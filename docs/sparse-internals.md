# Parser and Linearizer Internals

## Parser

### Symbols

A symbol node of type SYM_NODE contains the C name of the symbol, but you should never have a SYM_NODE that points
to another SYM_NODE, it always points to some actual type (ie ptr, whatever).

So the rule should be that the node can have specific information about that particular named symbol (so: name, array size, modifiers,
address space, initializer etc), and then the node->ctype.base_type should point to a non-NODE symbol describing the base type.

[Source](http://marc.info/?l=linux-sparse&m=149080567024897&w=3)

## Linearizer

### pseudos

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
== C code ==
    void *foo(int *p) { return p + 5; }

== linearized code ==
    foo:
    .L0:
    <entry-point>
    add.64      %r2 <- %arg1, $20
    cast.64     %r3 <- (64) %r2
    ret.64      %r3

This is correct.

== LLVM code from sparse-llvm ==
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


