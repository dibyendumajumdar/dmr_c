# Sparse SSA Instruction Set

## Credits

Originally written by Luc Van Oostenryck.

## Instructions

This brievely describe which field of struct instruction is
used by which operation.

## Terminator

### OP_RET
Return from subroutine.
- .src : returned value (NULL if void)
- .type: type of .src

### OP_BR
Unconditional branch
- .bb_true: destination basic block

### OP_CBR
Conditional branch
- .cond: condition
- .type: type of .cond, must be an integral type
- .bb_true, .bb_false: destination basic blocks

### OP_SWITCH
Switch / multi-branch
- .cond: condition
- .type: type of .cond, must be an integral type
- .multijmp_list: pairs of case-value - destination basic block

### OP_COMPUTEDGOTO 
Computed goto / branch to register
- .target: target address
- .type: type of .target	FIXME
- .multijmp_list: list of possible destination basic blocks

## Arithmetic binops
They all follow the same signature:
- .src1, .src1: operands (types must be compatible with .target)
- .target: result of the operation
- .type: type of .target

### OP_ADD 
Addition.

### OP_SUB
Subtraction.

### OP_MULU
Multiplication (unsigned ints & floating-points)

### OP_MULS
Multiplication (signed ints)

### OP_DIVU
Division (unsigned ints & floating-points)

### OP_DIVS
Division (signed ints)

### OP_MODU
Modulo (unsigned division remainder, integer only)

### OP_MODS
Modulo (signed division remainder, integer only)

### OP_SHL
Shift left (integer only)

### OP_LSR
Logical Shift right (integer only)

### OP_ASR
Arithmetic Shift right (integer only)

## Logical
They all follow the same signature:
- .src1, .src2: operands (types must be compatible with .target)
- .target: result of the operation
- .type: type of .target, must be an integral type

### OP_AND
### OP_OR
### OP_XOR

## Boolean

### OP_AND_BOOL
### OP_OR_BOOL

## Comparison
- .src1, .src2: operands (types must be compatible)
- .target: result of the operation (0/1 valued integer)
- .type: type of .target, must be an integral type

### OP_SET_EQ
Compare equal.

### OP_SET_NE
Compare not-equal.

### OP_SET_LE
Compare less-than-or-equal (signed).

### OP_SET_GE
Compare greater-than-or-equal (signed).

### OP_SET_LT
Compare less-than (signed).

### OP_SET_GT
Compare greater-than (signed).

### OP_SET_B
Compare less-than (unsigned).

### OP_SET_A
Compare greater-than (unsigned).

### OP_SET_BE
Compare less-than-or-equal (unsigned).

### OP_SET_AE
Compare greater-than-or-equal (unsigned).

## Unary trinary ops

### OP_NOT
Logical not.
- .src: operand (type must be compatible with .target)
- .target: result of the operation
- .type: type of .target, must be an integral type

### OP_NEG
Arithmetic negation.
- .src: operand (type must be compatible with .target)
- .target: result of the operation
- .type: type of .target

### OP_COPY
Copy (only needed after out-of-SSA).
- .src: operand (type must be compatible with .target)
- .target: result of the operation
- .type: type of .target

### OP_SEL
- .src1: condition, must be of integral type
- .src2, .src3: operands (types must be compatible with .target)
- .target: result of the operation
- .type: type of .target

## Type conversion
They all follow the same signature:
- .src: source value
- .orig_type: type of .src
- .target: result value
- .type: type of .target

### OP_CAST
Cast to unsigned integer (and to void pointer).

### OP_SCAST
Cast to signed integer.

### OP_FPCAST
Cast to floating-point.

### OP_PTRCAST
Cast to pointer.

## Memory

### OP_LOAD
Load.
- .src: base address to load from
- .offset: address offset
- .target: loaded value
- .type: type of .target

### OP_STORE
Store.
- .src: base address to store to
- .offset: address offset
- .target: value to be stored
- .type: type of .target

### OP_SYMADDR
Symbol's address.
- .symbol: the symbol
- .target: symbol's address

### OP_SETVAL
"Set Value"
- .val: value's expression
- .target: the value
- .type: type of .target
The expression can be an EXPR_STRING, EXPR_FVALUE or an EXPR_LABEL.

## Other

### OP_PHI
Phi-node (for SSA form).
- .phi_list: phi-operands (type must be compatible with .target)
- .target: "result"
- .type: type of .target

### OP_PHISOURCE
Phi-node source.
Like OP_COPY but exclusively used to create *all* OP_PHI operands.

### OP_INLINED_CALL

### OP_PUSH
Push argument.
- .src: argument
- .type: type of .src

### OP_CALL
Function call.
- .func: the function (can be a symbol or a "register")
- .arguments: list of the associated OP_PUSH instructions
- .target: function return value (if any)
- .type: type of .target
- .fntype: the full function type

### OP_SLICE
Extract a "slice" from an aggregate.
- .base: aggregate
- .from, .len: offet @ size of the slice within the aggregate
- .target: result
- .type: type of .target

### OP_ASM
Inlined assembly code.
- .string: asm template
- .asm_rules: asm constraints, rules

## Sparse tagging (line numbers, context, whatever)

### OP_CONTEXT
Currently only used for lock/unlock tracking.
- .context_expr: unused
- .increment: (1 for locking, -1 for unlocking)
- .check: (ignore the instruction if 0)

### OP_RANGE
Range checking.
- .src1: value to be checked
- .src2, src3: bound of the value (must be constants?)
- .type: FIXME

## Misc

### OP_ENTRY
Function entry point (no associated semantic).

### OP_BADOP
Invalid operation (should never be generated).

### OP_NOP
No-op (should never be generated).

### OP_SNOP
Store no-op (removed store operation).

### OP_LNOP
Load no-op (removed load operation).

### OP_DEATHNOTE
Annotation telling the pseudo will be death after the next
instruction (other than some other annotation, that is).

## Unused

### OP_VANEXT
### OP_VAARG
### OP_MALLOC
### OP_FREE
### OP_ALLOCA
### OP_GET_ELEMENT_PTR
### OP_INVOKE
### OP_UNWIND
