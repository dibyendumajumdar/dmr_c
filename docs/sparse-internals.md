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
