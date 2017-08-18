# NanoJIT backend

This is a [NanoJIT](https://github.com/dibyendumajumdar/nanojit) backend. 

## Status

These are very early days. We are able to generate code for following simple C programs. 

* [strlen](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.c). The generated LIR and assembly instructions look 
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.lir). 
* [sumq](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/sumq.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/sumq.lir).
* [store](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/store.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/store.lir).
* [testif](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/testif.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/testif.lir).
* [locals](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/locals.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/locals.lir).  
* [bitfields](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/bitfields.c). The generated LIR and assembly instructions   look [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/bitfields.lir).  
    
  
## Issues

### Features not yet implemented

* switch statement (probably can't be implemented)
* computed gotos (probably can't be implemented)
* bitfield access is implemented but not fully tested
* calling functions through function pointers
* aggregate initializers
* recursive function calls not possible at present due to the way functions are resolved

### Limitations

* NanoJIT only allows 4 integer/pointer parameters inside a JIT function.
* We cannot have static or global data in JIT code
* We probably can't generate code for string initializers
  
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
