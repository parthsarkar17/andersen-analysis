use crate::Variable;
use std::collections::VecDeque;
/// This function extracts the operand names of pointer expressions. The easiest
/// case is that of a "local operand", which is just a local variable. Second,
/// a common pattern is for pointer operands to be constants. These constants
/// may directly refer by name to global variables, or they may be an inline
/// GEP expression. I expect we'll only ever need to cover a couple
/// (bitcast, global reference, and GEP).
pub fn variable_from_operand<'a>(
    op: &'a llvm_ir::Operand,
    f: &'a llvm_ir::Function,
) -> Option<Variable<'a>> {
    match op {
        llvm_ir::Operand::MetadataOperand => None,
        llvm_ir::Operand::LocalOperand { name, .. } => Some(Variable::LocalVariable(&f.name, name)),
        llvm_ir::Operand::ConstantOperand(constant) => {
            let mut name_opt = None;
            let mut queue = VecDeque::new();
            queue.push_back(constant);
            loop {
                match queue.pop_front() {
                    None => break,
                    Some(constant) => match constant.as_ref() {
                        llvm_ir::Constant::BitCast(bitc) => queue.push_back(&bitc.operand),
                        llvm_ir::Constant::GetElementPtr(gep) => queue.push_back(&gep.address),
                        llvm_ir::Constant::GlobalReference { name, .. } => {
                            name_opt = Some(Variable::GlobalVariable(name))
                        }
                        _ => (),
                    },
                }
            }
            name_opt
        }
    }
}

/// Returns all instructions (along with their parent BB and Function)
/// in a first-level list to avoid nested for-loops when analyzing code.
pub fn iter_instrs(
    m: &llvm_ir::Module,
) -> Vec<(
    &llvm_ir::Function,
    &llvm_ir::BasicBlock,
    &llvm_ir::Instruction,
)> {
    let mut v = vec![];
    for f in &m.functions {
        for bb in &f.basic_blocks {
            for i in &bb.instrs {
                v.push((f, bb, i));
            }
        }
    }
    v
}
