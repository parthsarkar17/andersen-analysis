mod helpers;
use anyhow as ah;
use core::fmt;
use itertools::Itertools;
use std::collections::{HashMap, HashSet};

/// This type is used as a key into the points-to set map.
#[derive(Hash, PartialEq, Eq, Debug)]
pub enum Variable<'a> {
    /// Global pointer variables can be identified by their name alone
    GlobalVariable(&'a llvm_ir::Name),

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
    Function(&'a String),

    /// String represent global object variable name
    Global(&'a String),

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

    pub fn build_graph(&mut self) -> ah::Result<()> {
        let mut changed = true;
        while changed {
            for f in &self.module.functions {
                for bb in &f.basic_blocks {
                    for instr in &bb.instrs {
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
                                if let Some(name) = helpers::find_name_in_operand(&gep.address) {
                                    if let Some(operand_points_to_set) = self
                                        .query_non_deref(f, name)
                                        .map(|s| s.iter().cloned().collect_vec())
                                    {
                                        // condition for whether the dest set changed is length difference
                                        let dest_points_to_set =
                                            self.query_non_deref_mut(f, &gep.dest);
                                        let orig_len = dest_points_to_set.len();
                                        dest_points_to_set.extend(operand_points_to_set);
                                        let new_len = dest_points_to_set.len();
                                        changed |= new_len > orig_len
                                    }
                                }
                            }
                            llvm_ir::Instruction::BitCast(bitc) => {
                                // Do the same thing with BitCast as we did above with GEP
                                if let Some(name) = helpers::find_name_in_operand(&bitc.operand) {
                                    if let Some(operand_points_to_set) = self
                                        .query_non_deref(f, name)
                                        .map(|s| s.iter().cloned().collect_vec())
                                    {
                                        let dest_points_to_set =
                                            self.query_non_deref_mut(f, &bitc.dest);
                                        let orig_len = dest_points_to_set.len();
                                        dest_points_to_set.extend(operand_points_to_set);
                                        let new_len = dest_points_to_set.len();
                                        changed |= new_len > orig_len
                                    }
                                }
                            }
                            llvm_ir::Instruction::Load(load) => {}
                            llvm_ir::Instruction::Store(store) => {}
                            llvm_ir::Instruction::Call(call) => {}
                            _ => (),
                        }
                    }
                }
            }
            changed = false;
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
    points_to_graph.build_graph();
    println!("{points_to_graph:#?}");

    Ok(())
}
