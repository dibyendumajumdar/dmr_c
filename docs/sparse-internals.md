# Parser and Linearizer Internals

## Parser

### Parser Overview

Credit: Josh Triplett

#### Statements and Expressions

As far as the parsing structures go...

The C parser exists in two main files: parse.c, which parses statements, and expression.c, which parses expressions.

[parse.h](https://github.com/dibyendumajumdar/dmr_c/blob/master/src/parse.h) contains the definition of struct statement, which represents a C statement. That includes only those things which can't appear as an expression, which primarily includes control flow statements such as if, loops, switch/case, and goto.

[expression.h](https://github.com/dibyendumajumdar/dmr_c/blob/master/src/expression.h) contains the definition of struct expression, which represents a C expression.  That has a lot more content, since most C constructs can appear in expressions.

A series of statements forms a compound statement (STMT_COMPOUND). That appears as another struct statement which has a statement_list member.

A function body consists of a compound statement.

When you look at a loop body, if or else body, or case body, you'll notice that they just have a struct statement, not a statement_list; they can have multiple statements by using a compound statement. Also note that all loops get turned into a single "iterator" statement.
for, while, and do-while.

#### Symbols

A symbol, then, represents a name in a C file.  A symbol might represent a variable, a function, a label, or various other things.
See [symbol.h](https://github.com/dibyendumajumdar/dmr_c/blob/master/src/symbol.h).

"struct symbol" represents one symbol.

As with the various other structures, it has some common data and a union of sub-structures for the parts that differ between different types. Most of the interesting bits come in the NS_SYMBOL case. Among other things, it has a struct statement for the body of a function (if any), a list of symbols for the arguments, an expression for a variable initializer, and so on.

### More on Symbols

A symbol node of type SYM_NODE contains the C name of the symbol, but you should never have a SYM_NODE that points
to another SYM_NODE, it always points to some actual type (ie ptr, whatever).

So the rule should be that the node can have specific information about that particular named symbol (so: name, array size, modifiers,
address space, initializer etc), and then the node->ctype.base_type should point to a non-NODE symbol describing the base type.

[Source](http://marc.info/?l=linux-sparse&m=149080567024897&w=3)

#### Summary

Together, struct symbol, struct statement, and struct expression represent most of the abstract syntax tree for C.
So, that represents most of the "front-end" of Sparse: parsing C and generating that abstract syntax tree.
That much occurs in pretty much any program using the Sparse frontend.

## Linearizer

### Overview 

Credit: Josh Triplett

The linearized bytecode itself has a set of nested structures.
[linearize.h](https://github.com/dibyendumajumdar/dmr_c/blob/master/src/linearize.h) defines all of them.

#### entrypoint

At the top level, it has struct entrypoint. That represents an entrypoint to the code, which would normally mean a function.
An entrypoint has a list of basic blocks.

#### basic_block

struct basic_block.
A basic block represents a series of instructions with no branches. Straight-line code.
A branch only occurs at the end of a basic block, and branches can only target the beginning of a basic block.
Typically, a conditional will consist of a basic block leading up to the branch, a basic block for the true case, a basic block for the false case, and a basic block where the two paths merge back together.
Either the true or the false case may not exist.
A loop will normally have a basic block for the loop body, which can branch to the top at the end or continue to the next basic block.
So basic blocks represent a node in the control flow graph.
The edges in that graph lead from one basic block to a basic block which can follow it in the execution of the program.

#### instructions

Each basic block has a series of instructions, "struct instruction".
"enum opcode" lists all the instructions.
Fairly high-level instruction set, corresponding directly to bits of C.
So you have an entrypoint, which has a graph of basic blocks, each of which has a list of instructions.
An entrypoint also has a pointer to the first instruction.

#### pseudos

One last bit of trickiness: struct pseudo.
Have you ever heard of "static single assignment" or SSA form?
struct pseudo represents one of those single-assignment variables.
Each one has a pointer to the symbol it represents (which may have many pseudos referencing it).
Each one also has a pointer to the instruction that defines it.

### More about pseudos

A pseudo is a "register", and in SSA format. Local variables are not
registers, and do not honor SSA.

So local variables are very much *not* pseudos at any time. Local
variables can have their address taken, local variables can be
assigned multiple times, local variables can have complex types, none
of which is pseudo-like behavior.

Now, some *very* limited cases of local variables end up being
trivially very similar to pseudos, and those simple cases get turned
into pseudos. But that only happens for the simple cases - when their
address is not taken or used, and when they only have a single
assignment to them.

But local variables do not start out as pseudos, exactly because the
pseudo case is a very very very limited case of the full local
variable case.

[Source](http://marc.info/?l=linux-sparse&m=149073824506042&w=3)

### Linear IR is typeless

To explain, let me give a completely idiotic example:

    unsigned int test(int arg)
    {
        return arg + (unsigned int)arg;
    }

note how we're adding a "int" and an "unsigned int" together. But the
CSE etc doesn't actually care at all, and we will linearize this to
just

    test:
        add.32      %r5 <- %arg1, %arg1
        ret.32      %r5

because the type just isn't relevant at the linearization phase.

You can tell that there *used* to be multiple pseudos from the
numbering ("%r5"? What happened to "%r1..4"?), but they have all been
smushed together.

Linearization has fundamentally gotten rid of all the C types, and all
you can find are some rough remnants of them (you can find the *size*
of the type, and you can find the rough "type" of type - is it a
pointer, FP value or integer. There aren't even any signs, although
some _operations_ are signed (but not the pseudos).

The same pseudo can have many different types.

[Source](http://marc.info/?l=linux-sparse&m=148968511522310&w=3)

### Pointer arithmetic uses byte offsets

With an example:

*C code*

    void *foo(int *p) { return p + 5; }

*linearized code*

    foo:
    .L0:
    <entry-point>
    add.64      %r2 <- %arg1, $20
    cast.64     %r3 <- (64) %r2
    ret.64      %r3

This is correct.

*LLVM code from sparse-llvm*
    
    define i8* @foo(i32* %ARG1) {
    L0:
    %0 = getelementptr i32, i32* %ARG1, inttoptr (i64 20 to i32*)
    %R3 = bitcast i32* %0 to i8*

This is garbage, I'm afraid.

When sparse does the "add 20 to pointer", it adds the *byte offset* 20
to the pointer. The LLVM module should not use "getelementptr" for
this, because it's not element #20, it's the element at offset 20.

I think you're supposed to either use "uglygep" with the base pointer
cast to a simple address-unit pointer (ie unsigned char).

Or not use GEP at all.

[Source](http://marc.info/?l=linux-sparse&m=148882818325232&w=3)


