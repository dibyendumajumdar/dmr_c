# NanoJIT backend

This backend is trying to use a [NanoJIT](https://github.com/dibyendumajumdar/nanojit) backend. 

## Status

This is very early days. We are able to generate code for following simple C programs. 

* [strlen](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.c). The generated LIR and assembly instructions look 
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.lir). 
* [sumq](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/sumq.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/sumq.lir).
* [store](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/store.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/store.lir).
* [testif](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/testif.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/testif.lir).
  
  
## Issues

* NanoJIT lacks instructions for 64-bit multiply and divide - this is a problem for dmrC as 64-bit multiply in particular is used for pointer arithmetic. (This is a blocker - I am investigating how to add these instructions to Nanojit). Update: I have [added support](https://github.com/dibyendumajumdar/nanojit/commit/54939aa859bfd84fae9e9fb876e807e6a76e89f0) for these operations in Nanojit.
* NanoJIT lacks instruction for converting a double to 64-bit integer. Update: I have [added support](https://github.com/dibyendumajumdar/nanojit/commit/b2d63c3e77bcfc8272bdd0cbd971d8e2e3ed7f48) for this, although not tested yet.
* NanoJIT only allows 4 integer/pointer parameters inside a JIT function.

## Unimplemented features

* Assignments to floating point variables
* switch statement
* computed gotos
* selection operator (?:)

## Other limitations

* We cannot have static / global data in JIT code
* We probably can't generate code for string initializers
* Other limitations in the LLVM backend will also apply
  
## Building 

* First follow instructions to build a [NanoJIT](https://github.com/dibyendumajumdar/nanojit) library.
* You may need to amend the script [FindNanoJIT.cmake](https://github.com/dibyendumajumdar/dmr_c/blob/master/cmake/FindNanoJIT.cmake) to
  match your installation details.
* Next you can generate the CMake build scripts. I use following on Windows 10.

```
mkdir build
cd build
cmake -DNANO_JIT=ON -G "Visual Studio 15 2017 Win64" ..
```

Process on Linux should be similar except for the CMake generator target.
