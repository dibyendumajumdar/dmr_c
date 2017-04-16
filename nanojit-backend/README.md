# NanoJIT backend

This backend is trying to use a [NanoJIT](https://github.com/dibyendumajumdar/nanojit) backend. 

## Status

This is very early days. We are just able to generate code for following simple C function.

* [strlen](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.c). The generated LIR and assembly instructions look 
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/strlen.lir). Note that the front-end needs to be run with
  -O1 option to enable Sparse IR simplications.
* [sumq](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/sumq.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/sumq.lir).
* [store](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/store.c). The generated LIR and assembly instructions look
  [like this](https://github.com/dibyendumajumdar/dmr_c/blob/master/tests/nano/store.lir).
  
  
## Issues

* Nanojit lacks instructions for 64-bit multiply and divide - this is a problem for dmrC as 64-bit multiply in particular is used for pointer arithmetic. (This is a blocker - I am investigating how to add these instructions to Nanojit). Update: I have [added support](https://github.com/dibyendumajumdar/nanojit/commit/54939aa859bfd84fae9e9fb876e807e6a76e89f0) for these operations in Nanojit.
* Nanojit lacks instruction for converting a double to 64-bit integer.
  
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
