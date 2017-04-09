# ASMJIT backend

This backend is trying to use the [asmjit](https://github.com/asmjit/asmjit) code generator. We are using the X86Compiler component as 
this allows working at a higher level using virtual registers, with asmjit taking care of the register allocation.

## Status

This is very early days. Right now, we cannot generate code successfully. Our initial attempt is to compile following:

* [strlen](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.c)


