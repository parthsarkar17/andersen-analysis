mod helpers;

use anyhow as ah;
use core::fmt;
use itertools::Itertools;
use std::collections::{HashMap, HashSet};

/// For load/store instructions, Andersen analysis constraints
/// state that [p = load q] should result in "p" receieving the
/// points-to set of *q (i.e. the dereference of "q"). So,
/// this enum just represents the difference between a
/// variable and its dereference. If a variable is annotated
/// with "Pointer", it's just a pointer variable. If
/// a variable is annoated with "Deref", the variable is a
/// pointer-to-a-pointer that has been dereferenced.
#[derive(Hash, PartialEq, Eq, Debug)]
pub enum ConstraintVarType {
    Deref,
    Pointer,
}

/// This type is used as a key into the points-to set map. For
/// example, we might have a normal pointer variable that is the
///  destination of an alloca. Then, the corresponding "Variable"
/// will be Variable { name : %1, var_type : Pointer}.
#[derive(Hash, PartialEq, Eq, Debug)]
pub struct Variable<'a> {
    name: &'a llvm_ir::Name,
    var_type: ConstraintVarType,
}

impl<'a> Variable<'a> {
    pub fn new(name: &'a llvm_ir::Name, is_deref: bool) -> Self {
        Self {
            name,
            var_type: if is_deref {
                ConstraintVarType::Deref
            } else {
                ConstraintVarType::Pointer
            },
        }
    }
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
    /// we insert the map (that's why we require a mutable reference to `self`).
    pub fn query_non_deref(&self, name: &'a llvm_ir::Name) -> Option<&HashSet<AbstrLoc<'a>>> {
        let v = Variable::new(name, false);
        self.graph.get(&v)
        // self.graph.entry(v).or_default()
    }

    /// Given the name of a local pointer variable, this function will return a mutable reference
    /// to the points-to set of that variable. If the variable is unmapped in the map, then
    /// we insert the map (that's why we require a mutable reference to `self`).
    pub fn query_non_deref_mut(&mut self, name: &'a llvm_ir::Name) -> &mut HashSet<AbstrLoc<'a>> {
        let v = Variable::new(name, false);
        self.graph.entry(v).or_default()
    }

    pub fn build_graph(&mut self) -> ah::Result<()> {
        let mut changed = true;
        while changed {
            for f in &self.module.functions {
                for bb in &f.basic_blocks {
                    for instr in &bb.instrs {
                        match instr {
                            llvm_ir::Instruction::Alloca(alloca) => {
                                let ptr_var = Variable::new(&alloca.dest, false);
                                let var_pts_to_set = self.graph.entry(ptr_var).or_default();
                                changed |= var_pts_to_set.insert(AbstrLoc::from_alloca(f, alloca));
                            }
                            llvm_ir::Instruction::GetElementPtr(gep) => {
                                let llvm_ir::Operand::LocalOperand { name, .. } = &gep.address
                                else {
                                    return Err(ah::anyhow!(
                                        "Operand of GEP was unexpectedly a non-local variable: {gep:#?}"
                                    ));
                                };

                                // get the stuff pointed to by the operand and put it into the
                                // set of stuff ponted to by the destination
                                if let Some(operand_points_to_set) = self
                                    .query_non_deref(name)
                                    .map(|s| s.iter().cloned().collect_vec())
                                {
                                    // condition for whether the dest set changed is length difference
                                    let dest_points_to_set = self.query_non_deref_mut(&gep.dest);
                                    let orig_len = dest_points_to_set.len();
                                    dest_points_to_set.extend(operand_points_to_set);
                                    let new_len = dest_points_to_set.len();
                                    changed |= new_len > orig_len
                                }
                            }
                            llvm_ir::Instruction::BitCast(bitc) => {}
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
