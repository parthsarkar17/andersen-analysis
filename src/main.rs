use anyhow as ah;
use core::fmt;
use itertools::Itertools;
use std::collections::{HashMap, HashSet};

#[derive(Hash, PartialEq, Eq, Debug)]
pub enum ConstraintVarType {
    Deref,
    Pointer,
}

#[derive(Hash, PartialEq, Eq, Debug)]
pub struct ConstraintVariable<'a> {
    name: &'a llvm_ir::Name,
    var_type: ConstraintVarType,
}

impl<'a> ConstraintVariable<'a> {
    pub fn new(name: &'a llvm_ir::Name, var_type: ConstraintVarType) -> Self {
        Self { name, var_type }
    }
}

#[derive(PartialEq, Eq, Hash, Debug)]
pub enum AbstractLocation<'a> {
    Function(&'a llvm_ir::DebugLoc),
    Global(&'a llvm_ir::DebugLoc),
    MallocPoint(&'a llvm_ir::DebugLoc),
    StackAllocPoint(&'a llvm_ir::DebugLoc),
}

pub struct PointsToGraph<'a> {
    pub module: &'a llvm_ir::Module,
    pub graph: HashMap<ConstraintVariable<'a>, HashSet<AbstractLocation<'a>>>,
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

    pub fn build_graph(&mut self) {
        let mut changed = true;
        while changed {
            for f in &self.module.functions {
                for bb in &f.basic_blocks {
                    for inst in &bb.instrs {}
                }
            }
            changed = false;
        }
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

    let points_to_graph = PointsToGraph::new(&module);

    Ok(())
}
