mod helpers;
use anyhow as ah;
use core::fmt;
use either::Either;
use itertools::Itertools;
use llvm_ir::Name;
use std::collections::{HashMap, HashSet};

/// This type is used as a key into the points-to set map.
#[derive(Hash, PartialEq, Eq, Debug)]
pub enum Variable<'a> {
    /// Global pointer variables can be identified by their name alone (if its an object) or by a String (if it's a function)
    GlobalVariable(Either<&'a String, &'a Name>),

    /// We need to localize function-local variables into their functions.
    /// The String represents a function name, and Name is the name of the variable
    LocalVariable(&'a String, &'a llvm_ir::Name),

    /// When we load / store pointers from / into pointers-to-pointers, we
    /// need to track the points-to sets of abstract locations themselves.
    /// Hence, we add abstract locations as keys into the map.
    AbstractLocation(AbstrLoc<'a>),
}

/// This type is used to represent the entries in each
/// points-to set (where each set is the value in the points-to map).
/// So, a pointer variable or dereferenced pointer-to-pointer variable
/// might point to a function, a global, a heap allocation region, or a
/// stack allocation region.
#[derive(PartialEq, Eq, Hash, Debug, Clone)]
pub enum AbstrLoc<'a> {
    /// String represents function name
    // Function(&'a String),

    /// String represent global object variable name
    Global(Either<&'a String, &'a Name>),

    /// String represents function name, and "name" represents destination of malloc(..) call
    /// We use function-variable combinations as a unique identifier for this allocation point.
    MallocPoint(&'a String, &'a llvm_ir::Name),

    /// String represents function name, and "name" represents destination of alloca(..) instr.
    /// We use function-variable combinations as a unique identifier for this allocation point.
    StackAllocPoint(&'a String, &'a llvm_ir::Name),
}

impl<'a> AbstrLoc<'a> {
    /// Generate an AbstrLoc object representing a stack allocation. Must provide
    /// the parent function (in which the stack alloc occurs), along with the alloca
    /// object itself.
    fn from_alloca(
        func: &'a llvm_ir::Function,
        alloca: &'a llvm_ir::instruction::Alloca,
    ) -> AbstrLoc<'a> {
        AbstrLoc::StackAllocPoint(&func.name, &alloca.dest)
    }
}

pub struct PointsToGraph<'a> {
    pub module: &'a llvm_ir::Module,
    pub graph: HashMap<Variable<'a>, HashSet<AbstrLoc<'a>>>,
}

impl<'a> fmt::Debug for PointsToGraph<'a> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("PointsToGraph")
            .field("graph", &self.graph)
            .finish()
    }
}

impl<'a> PointsToGraph<'a> {
    pub fn new(module: &'a llvm_ir::Module) -> PointsToGraph<'a> {
        Self {
            module,
            graph: HashMap::new(),
        }
    }

    /// Given the name of a local pointer variable, this function will return an immutable reference
    /// to the points-to set of that variable. If the variable is unmapped in the map, then
    /// we return None.
    pub fn query_non_deref(
        &self,
        func: &'a llvm_ir::Function,
        name: &'a llvm_ir::Name,
    ) -> Option<&HashSet<AbstrLoc<'a>>> {
        let name_var = Variable::LocalVariable(&func.name, name);
        self.graph.get(&name_var)
    }

    /// Given the name of a local pointer variable, this function will return a mutable reference
    /// to the points-to set of that variable. If the variable is unmapped in the map, then
    /// we insert the map.
    pub fn query_non_deref_mut(
        &mut self,
        func: &'a llvm_ir::Function,
        name: &'a llvm_ir::Name,
    ) -> &mut HashSet<AbstrLoc<'a>> {
        let name_var = Variable::LocalVariable(&func.name, name);
        self.graph.entry(name_var).or_default()
    }

    /// This function initializes the points-to map with initial information about globals.
    /// Specifically, we map global variable names to global memory locations. Then, for each
    /// of these memory locations, we also add points-to information when the memory itself
    /// contains references to other memory locations. This is field insensitive! (for now)
    fn initialize_map_with_globals(&mut self) -> ah::Result<()> {
        let map = &mut self.graph;
        for f in &self.module.functions {
            let pts_to_set = map
                .entry(Variable::GlobalVariable(Either::Left(&f.name)))
                .or_default();
            let abstr_loc = AbstrLoc::Global(Either::Left(&f.name));
            pts_to_set.insert(abstr_loc);
        }

        for f in &self.module.func_declarations {
            let pts_to_set = map
                .entry(Variable::GlobalVariable(Either::Left(&f.name)))
                .or_default();
            let abstr_loc = AbstrLoc::Global(Either::Left(&f.name));
            pts_to_set.insert(abstr_loc);
        }

        for glob in &self.module.global_vars {
            let pts_to_set = map
                .entry(Variable::GlobalVariable(Either::Right(&glob.name)))
                .or_default();
            let abstr_loc = AbstrLoc::Global(Either::Right(&glob.name));
            pts_to_set.insert(abstr_loc.clone());
            if let Some(initial_memory) = &glob.initializer {
                map.entry(Variable::AbstractLocation(abstr_loc))
                    .or_default()
                    .extend(
                        helpers::gather_all_global_refs(initial_memory)?
                            .into_iter()
                            .map(|name| AbstrLoc::Global(Either::Right(name))),
                    );
            }
        }
        Ok(())
    }

    pub fn build_graph(&mut self) -> ah::Result<()> {
        self.initialize_map_with_globals()?;
        let instr_vec = helpers::iter_instrs(&self.module);
        loop {
            let mut changed = false;
            for (f, _, instr) in &instr_vec {
                match instr {
                    llvm_ir::Instruction::Alloca(alloca) => {
                        let ptr_var = Variable::LocalVariable(&f.name, &alloca.dest);
                        let var_pts_to_set = self.graph.entry(ptr_var).or_default();
                        changed |= var_pts_to_set.insert(AbstrLoc::from_alloca(f, alloca));
                    }
                    llvm_ir::Instruction::GetElementPtr(gep) => {
                        // get the stuff pointed to by the operand and put it into the
                        // set of stuff ponted to by the destination. this is conservative;
                        // revisit for field-senstivie analysis later
                        if let Some(operand_var) = helpers::variable_from_operand(&gep.address, f)
                            && let Some(operand_var_pts_to_set) = self
                                .graph
                                .get(&operand_var)
                                .map(|s| s.iter().cloned().collect_vec())
                        {
                            // condition for whether the dest set changed is length difference
                            let dest_pts_to_set = self.query_non_deref_mut(f, &gep.dest);
                            let orig_len = dest_pts_to_set.len();
                            dest_pts_to_set.extend(operand_var_pts_to_set);
                            let new_len = dest_pts_to_set.len();
                            changed |= new_len > orig_len
                        }
                    }
                    llvm_ir::Instruction::BitCast(bitc) => {
                        // Do the same thing with BitCast as we did above with GEP
                        if let Some(operand_var) = helpers::variable_from_operand(&bitc.operand, f)
                            && let Some(operand_var_pts_to_set) = self
                                .graph
                                .get(&operand_var)
                                .map(|s| s.iter().cloned().collect_vec())
                        {
                            // condition for whether the dest set changed is length difference
                            let dest_pts_to_set = self.query_non_deref_mut(f, &bitc.dest);
                            let orig_len = dest_pts_to_set.len();
                            dest_pts_to_set.extend(operand_var_pts_to_set);
                            let new_len = dest_pts_to_set.len();
                            changed |= new_len > orig_len
                        }
                    }
                    llvm_ir::Instruction::Load(load) => {
                        // obviously the operand we're loading from is a pointer, so we expect
                        // it to have a points-to set (or maybe it's currently unmapped but will
                        // eventually get a set). however, we only want the destination's set
                        // to get updated if the destination is a pointer itself. we don't want
                        // to pollute the map with a points-to entry for an integer, for example.

                        if let llvm_ir::Type::PointerType { .. } = load.loaded_ty.as_ref()
                            && let Some(operand_var) =
                                helpers::variable_from_operand(&load.address, f)
                            && let Some(operand_var_pts_to_set) = self
                                .graph
                                .get(&operand_var)
                                .map(|s| s.iter().cloned().collect_vec())
                        {
                            // load constraint says that every location pointed to by
                            // every element of the operand's points-to set should be
                            // flowed into the destination pointer
                            let points_to_of_deref_of_operand = operand_var_pts_to_set
                                .into_iter()
                                .filter_map(|abstr_loc| {
                                    self.graph.get(&Variable::AbstractLocation(abstr_loc)).map(
                                        |abstr_loc_pts_to_set| abstr_loc_pts_to_set.iter().cloned(),
                                    )
                                })
                                .flatten()
                                .collect_vec();

                            let dest_pts_to_set = self.query_non_deref_mut(f, &load.dest);
                            let orig_len = dest_pts_to_set.len();
                            dest_pts_to_set.extend(points_to_of_deref_of_operand);
                            let new_len = dest_pts_to_set.len();
                            changed |= new_len > orig_len;
                        }
                    }
                    llvm_ir::Instruction::Store(store) => {
                        // it's not easy to get the type of the value being stored, so our condition
                        // for flowing the points-to set of the value operand into the dereference of the
                        // address operand is if the value operand is mapped at all. as we mentioned above,
                        // it should never be the case that a non-pointer variable (e.g. int) has a points-to set,
                        // so this method should work
                        if let Some(value_operand) = helpers::variable_from_operand(&store.value, f)
                            && let Some(value_operand_pts_to_set) = self
                                .graph
                                .get(&value_operand)
                                .map(|s| s.iter().cloned().collect_vec())
                            && let Some(address_variable) =
                                helpers::variable_from_operand(&store.address, f)
                        {
                            let address_variable_pts_to_set =
                                self.graph.entry(address_variable).or_default().clone();

                            for mem_location in address_variable_pts_to_set {
                                let og_set = self
                                    .graph
                                    .entry(Variable::AbstractLocation(mem_location.clone()))
                                    .or_default();
                                let og_len = og_set.len();
                                og_set.extend(value_operand_pts_to_set.clone());
                                let new_len = og_set.len();

                                changed |= new_len > og_len;
                            }
                        }
                    }
                    llvm_ir::Instruction::Call(call) => {}
                    _ => (),
                }
            }

            if !changed {
                break;
            }
        }

        Ok(())
    }
}

fn main() -> ah::Result<()> {
    let args = std::env::args().collect_vec();
    if args.len() != 2 {
        return Err(ah::anyhow!("usage: cargo run -- <.ll|.bc filename>"));
    }

    let module = if args[1].ends_with(".bc") {
        llvm_ir::Module::from_bc_path(&args[1])
    } else if args[1].ends_with(".ll") {
        llvm_ir::Module::from_ir_path(&args[1])
    } else {
        return Err(ah::anyhow!("usage: cargo run -- <.ll|.bc filename>"));
    }
    .map_err(|e| ah::anyhow!("{e}"))?;

    let mut points_to_graph = PointsToGraph::new(&module);
    points_to_graph.build_graph()?;
    println!("{points_to_graph:#?}");

    let dummy_str = "dummy".to_string();
    let x = points_to_graph.graph.get(&&Variable::LocalVariable(
        &dummy_str,
        &llvm_ir::Name::Number(1),
    ));
    println!("{x:#?}");

    Ok(())
}
