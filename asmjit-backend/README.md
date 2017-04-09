# AsmJit backend

This backend is trying to use the [AsmJit](https://github.com/asmjit/asmjit) code generator. We are using the X86Compiler component as 
this allows working at a higher level using virtual registers, with asmjit taking care of the register allocation.

## Status

This is very early days. Right now, we cannot generate code successfully. Our initial attempt is to compile following:

* [strlen](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.c)

## Building 

* You will need to generate the CMake build scripts. I use following on Windows 10.

```
mkdir build
cd build
cmake -DASM_JIT=ON -G "Visual Studio 15 2017 Win64" ..
```

Process on Linus should be similar except for the CMake generator target.
