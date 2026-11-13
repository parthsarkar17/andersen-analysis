mod helpers;
use anyhow as ah;
use core::fmt;
use either::Either;
use itertools::Itertools;
use std::collections::{HashMap, HashSet};

/// This type is used as a key into the points-to set map.
#[derive(Hash, PartialEq, Eq, Debug)]
pub enum Variable<'a> {
    /// Global pointer variables can be identified by their name alone (if its an object) or by a String (if it's a function)
    GlobalVariable(Either<&'a String, &'a usize>),

    /// We need to localize function-local variables into their functions.
    /// The String represents a function name, and Name is the name of the variable
    LocalVariable(&'a String, Either<&'a String, &'a usize>),

    /// When we load / store pointers from / into pointers-to-pointers, we
    /// need to track the points-to sets of abstract locations themselves.
    /// Hence, we add abstract locations as keys into the map.
    AbstractLocation(&'a AbstrLoc<'a>),
}

/// This type is used to represent the entries in each
/// points-to set (where each set is the value in the points-to map).
/// So, a pointer variable or dereferenced pointer-to-pointer variable
/// might point to a function, a global, a heap allocation region, or a
/// stack allocation region.
#[derive(PartialEq, Eq, Hash, Debug, Clone)]
pub enum AbstrLoc<'a> {
    /// Represents global object variable name
    Global(Either<&'a String, &'a usize>),

    /// String represents function name, and Either represents destination of malloc(..) call
    /// We use function-variable combinations as a unique identifier for this allocation point.
    MallocPoint(&'a String, Either<&'a String, &'a usize>),

    /// String represents function name, and "name" represents destination of alloca(..) instr.
    /// We use function-variable combinations as a unique identifier for this allocation point.
    StackAllocPoint(&'a String, Either<&'a String, &'a usize>),
}

impl<'a> AbstrLoc<'a> {
    /// Generate an AbstrLoc object representing a stack allocation. Must provide
    /// the parent function (in which the stack alloc occurs), along with the alloca
    /// object itself.
    fn from_alloca(
        func: &'a llvm_ir::Function,
        alloca: &'a llvm_ir::instruction::Alloca,
    ) -> AbstrLoc<'a> {
        AbstrLoc::StackAllocPoint(&func.name, helpers::canonicalize_name(&alloca.dest))
    }

    /// Generate an AbstrLoc object representing a malloc site. Must provide
    /// the parent function (in which the heap alloc occurs), along with the malloc
    /// call object itself.
    fn from_malloc(
        func: &'a llvm_ir::Function,
        malloc_call: &'a llvm_ir::instruction::Call,
    ) -> ah::Result<AbstrLoc<'a>> {
        let malloc_dest =
            helpers::canonicalize_name(malloc_call.dest.as_ref().ok_or_else(|| {
                ah::anyhow!("Couldn't find a destination variable for this `malloc` call!")
            })?);
        Ok(AbstrLoc::MallocPoint(&func.name, malloc_dest))
    }
}

pub struct PointerAnalysis<'a> {
    pub module: &'a llvm_ir::Module,
    pub instructions: &'a Vec<(
        usize,
        &'a llvm_ir::Function,
        &'a llvm_ir::BasicBlock,
        &'a llvm_ir::Instruction,
    )>,
    pub graph: HashMap<Variable<'a>, HashSet<&'a AbstrLoc<'a>>>,
    pub dynamic_memory_objects: &'a HashMap<usize, AbstrLoc<'a>>,
    pub function_memory_objects: &'a Vec<AbstrLoc<'a>>,
    pub function_decl_memory_objects: &'a Vec<AbstrLoc<'a>>,
    pub global_memory_objects: &'a Vec<AbstrLoc<'a>>,
}

impl<'a> fmt::Debug for PointerAnalysis<'a> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("PointerAnalysis")
            .field("graph", &self.graph)
            .finish()
    }
}

impl<'a> PointerAnalysis<'a> {
    /// This function instantiates an object representing the pointer analysis results.
    /// It does not yet contain any points-to information; for that, you must call `build_graph`.
    /// In order to avoid excessive cloning during the building of the points-to graph, we
    /// instantiate all of the objects representing abstract locations up front. Then,
    /// the points-to sets can just reference these objects instead of copying them.
    pub fn new(
        module: &'a llvm_ir::Module,
        instructions: &'a Vec<(
            usize,
            &'a llvm_ir::Function,
            &'a llvm_ir::BasicBlock,
            &'a llvm_ir::Instruction,
        )>,
        dynamic_memory_objects: &'a HashMap<usize, AbstrLoc<'a>>,
        function_memory_objects: &'a Vec<AbstrLoc<'a>>,
        function_decl_memory_objects: &'a Vec<AbstrLoc<'a>>,
        global_memory_objects: &'a Vec<AbstrLoc<'a>>,
    ) -> PointerAnalysis<'a> {
        Self {
            module,
            instructions,
            graph: HashMap::new(),
            dynamic_memory_objects,
            function_memory_objects,
            function_decl_memory_objects,
            global_memory_objects,
        }
    }

    /// Given the name of a local pointer variable, this function will return a mutable reference
    /// to the points-to set of that variable. If the variable is unmapped in the map, then
    /// we insert the map.
    pub fn query_local_mut(
        &mut self,
        func: &'a llvm_ir::Function,
        name: &'a llvm_ir::Name,
    ) -> &mut HashSet<&'a AbstrLoc<'a>> {
        let name_var = Variable::LocalVariable(&func.name, helpers::canonicalize_name(name));
        self.graph.entry(name_var).or_default()
    }

    /// This function initializes the points-to map with initial information about globals.
    /// Specifically, we map global variable names to global memory locations. Then, for each
    /// of these memory locations, we also add points-to information when the memory itself
    /// contains references to other memory locations. This is field insensitive! (for now)
    fn initialize_map_with_globals(&mut self) -> ah::Result<()> {
        let map = &mut self.graph;
        for (i, func) in self.module.functions.iter().enumerate() {
            let pts_to_set = map
                .entry(Variable::GlobalVariable(Either::Left(&func.name)))
                .or_default();

            let abstr_loc = &self.function_memory_objects[i];
            pts_to_set.insert(abstr_loc);
        }

        for (i, func_decl) in self.module.func_declarations.iter().enumerate() {
            let pts_to_set = map
                .entry(Variable::GlobalVariable(Either::Left(&func_decl.name)))
                .or_default();
            let abstr_loc = &self.function_decl_memory_objects[i];
            pts_to_set.insert(abstr_loc);
        }

        for (i, glob) in self.module.global_vars.iter().enumerate() {
            let pts_to_set = map
                .entry(Variable::GlobalVariable(helpers::canonicalize_name(
                    &glob.name,
                )))
                .or_default();
            let abstr_loc = &self.global_memory_objects[i];
            pts_to_set.insert(abstr_loc);

            // now, for the global memory region G, we go through its initial values
            // and find references to other globals (functions, function decls, global objects).
            // if we find them, we add a points-to edge from G to that object
            if let Some(initial_memory) = &glob.initializer {
                // get the map for G
                let mem_location_pts_to_set = map
                    .entry(Variable::AbstractLocation(abstr_loc))
                    .or_default();

                // find references to other global objects in this memory region
                let references_in_mem_location = helpers::gather_all_global_refs(initial_memory)?;

                // create an iterator over all objects in global memory
                let mut global_objs_iter = self
                    .global_memory_objects
                    .iter()
                    .chain(self.function_decl_memory_objects)
                    .chain(self.function_memory_objects);

                //
                let abstr_locations_of_references = references_in_mem_location
                    .into_iter()
                    .map(|name| {
                        let canonicalized_name = helpers::canonicalize_name(name);
                        let abstr_loc = global_objs_iter
                            .find(|abstr_loc| {
                                if let AbstrLoc::Global(abstr_loc_name) = abstr_loc {
                                    &canonicalized_name == abstr_loc_name
                                } else {
                                    false
                                }
                            })
                            .ok_or_else(|| {
                                ah::anyhow!(
                                    "Couldn't find the abstract location for the global name"
                                )
                            })?;

                        Ok(abstr_loc)
                    })
                    .collect::<ah::Result<Vec<_>>>()?;

                mem_location_pts_to_set.extend(abstr_locations_of_references);
            }
        }
        Ok(())
    }

    pub fn build_graph(&mut self) -> ah::Result<()> {
        self.initialize_map_with_globals()?;
        loop {
            let mut changed = false;
            for (idx, f, _, instr) in self.instructions {
                match instr {
                    llvm_ir::Instruction::Alloca(alloca) => {
                        let ptr_var = Variable::LocalVariable(
                            &f.name,
                            helpers::canonicalize_name(&alloca.dest),
                        );
                        let var_pts_to_set = self.graph.entry(ptr_var).or_default();

                        let Some(alloca_abstr_loc) = self.dynamic_memory_objects.get(idx) else {
                            return Err(ah::anyhow!(
                                "Couldn't find the abstract memory location for alloca instruction {instr:?}!"
                            ));
                        };
                        changed |= var_pts_to_set.insert(alloca_abstr_loc);
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
                            let dest_pts_to_set = self.query_local_mut(f, &gep.dest);
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
                            let dest_pts_to_set = self.query_local_mut(f, &bitc.dest);
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
                            && let Some(operand_var_pts_to_set) =
                                self.graph.get(&operand_var).map(|s| s.iter().collect_vec())
                        {
                            // load constraint says that every location pointed to by
                            // every element of the operand's points-to set should be
                            // flowed into the destination pointer
                            let points_to_of_deref_of_operand = operand_var_pts_to_set
                                .iter()
                                .filter_map(|abstr_loc| {
                                    self.graph
                                        .get(&Variable::AbstractLocation(abstr_loc))
                                        .map(|abstr_loc_pts_to_set| abstr_loc_pts_to_set.iter())
                                })
                                .flatten()
                                .cloned()
                                .collect_vec();

                            let dest_pts_to_set = self.query_local_mut(f, &load.dest);
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
                                    .entry(Variable::AbstractLocation(mem_location))
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
    // get file & parse llvm module object from .ll or .bc file
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

    // since we're not mutating the file, we can just gather all the memory locations
    // (globals, functions, function declarations, stack & heap objects) up front
    // so we can pass references around in the points-to sets instead of allocated objects
    // representing memory locations
    let instructions = helpers::iter_instrs(&module);
    let dynamic_memory_objects = instructions
        .iter()
        .filter_map(|(idx, func, _, instr)| match instr {
            llvm_ir::Instruction::Alloca(alloca) => {
                Some(Ok((*idx, AbstrLoc::from_alloca(func, &alloca))))
            }
            llvm_ir::Instruction::Call(call) => {
                helpers::is_malloc(call).then(|| Ok((*idx, AbstrLoc::from_malloc(func, call)?)))
            }
            _ => None,
        })
        .collect::<ah::Result<HashMap<_, _>>>()?;

    let function_memory_objects = module
        .functions
        .iter()
        .map(|func| AbstrLoc::Global(Either::Left(&func.name)))
        .collect_vec();

    let function_decl_memory_objects = module
        .func_declarations
        .iter()
        .map(|func_decl| AbstrLoc::Global(Either::Left(&func_decl.name)))
        .collect_vec();

    let global_memory_objects = module
        .global_vars
        .iter()
        .map(|glob| AbstrLoc::Global(helpers::canonicalize_name(&glob.name)))
        .collect_vec();

    let mut points_to_graph = PointerAnalysis::new(
        &module,
        &instructions,
        &dynamic_memory_objects,
        &function_memory_objects,
        &function_decl_memory_objects,
        &global_memory_objects,
    );
    points_to_graph.build_graph()?;
    println!("{points_to_graph:#?}");

    let dummy_str = "dummy".to_string();
    let x = points_to_graph.graph.get(&&Variable::LocalVariable(
        &dummy_str,
        helpers::canonicalize_name(&llvm_ir::Name::Number(1)),
    ));
    println!("{x:#?}");

    Ok(())
}
