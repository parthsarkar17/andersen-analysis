use crate::Variable;
use anyhow as ah;
use either::Either;
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
        llvm_ir::Operand::LocalOperand { name, .. } => {
            Some(Variable::LocalVariable(&f.name, canonicalize_name(name)))
        }
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
                            name_opt = Some(Variable::GlobalVariable(canonicalize_name(name)))
                        }
                        _ => (),
                    },
                }
            }
            name_opt
        }
    }
}

pub fn gather_all_global_refs<'a>(
    initial_mem_location: &'a llvm_ir::ConstantRef,
) -> ah::Result<Vec<&'a llvm_ir::Name>> {
    let mut global_refs = vec![];
    let mut queue = VecDeque::new();
    queue.push_back(initial_mem_location);
    loop {
        match queue.pop_front() {
            None => break,
            Some(mem_location) => match mem_location.as_ref() {
                llvm_ir::Constant::Struct { values, .. } => {
                    values.iter().for_each(|value| queue.push_back(value));
                }
                llvm_ir::Constant::Array { elements, .. } => {
                    elements.iter().for_each(|element| queue.push_back(element))
                }
                llvm_ir::Constant::GlobalReference { name, .. } => {
                    global_refs.push(name);
                }
                llvm_ir::Constant::AggregateZero(..)
                | llvm_ir::Constant::Int { .. }
                | llvm_ir::Constant::Float { .. } => (),
                _ => {
                    return Err(ah::anyhow!(
                        "Unhandled llvm_ir::Constant! Observed {mem_location:#?}"
                    ));
                }
            },
        }
    }
    Ok(global_refs)
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

pub fn canonicalize_name(name: &llvm_ir::Name) -> Either<&String, &usize> {
    match name {
        llvm_ir::Name::Name(name) => Either::Left(&*name),
        llvm_ir::Name::Number(x) => Either::Right(x),
    }
}
