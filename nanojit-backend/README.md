# NanoJIT backend

This backend uses [NanoJIT](https://github.com/dibyendumajumdar/nanojit) to generate machine code. The Sparse IR is converted to nanoJIT IR and then translated to machine code. 

## Status

These are very early days. We are able to generate code for following simple C programs. 

* [strlen.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.c). The generated LIR and assembly instructions look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.lir). 
* [sumq.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/sumq.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/sumq.lir).
* [store.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/store.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/store.lir).
* [testif.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/testif.c). The generated LIR and assembly instructions look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/testif.lir).
* [locals.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/locals.c). The generated LIR and assembly instructions look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/locals.lir).  
* [bitfields.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/bitfields.c). The generated LIR and assembly instructions look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/bitfields.lir).  
* [switch.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/switch.c). The generated LIR and assembly instructions   look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/switch.lir).  
* [control.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/control.c). The generated LIR and assembly instructions   look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/control.lir).  
* [matmul.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/matmul.c). The generated LIR and assembly instructions   look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/matmul.lir).  
* [bool.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/bool.c). The generated LIR and assembly instructions   look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/bool.lir).  

  
## Issues

### Features not yet implemented

* String literals are not supported as they need static storage
* Computed gotos (probably can't be implemented)
* Bitfield access is implemented but not fully tested
* Calling functions through function pointers
* Aggregate initializers
* Recursive function calls are not possible at present due to the way functions are resolved

### Limitations

* NanoJIT only allows 4 integer/pointer parameters inside a JIT function.
* We cannot have static or global data in JIT code
* We probably can't generate code for string initializers
* Generated code for switch statements uses if (cond) branching rather than a jump table. NanoJIT does have a jump table instruction
but it requires the indices to be consecutive starting from zero, and there is no support for default case. We can still use this
instruction when the conditions are met.
  
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

## Using NanoJIT backend

Please see [testnanobackend.c](https://github.com/dibyendumajumdar/dmr_c/blob/master/nanojit-backend/testnanobackend.c) for example usage. Note that this backend is not yet well tested so nothing is guaranteed to work.
