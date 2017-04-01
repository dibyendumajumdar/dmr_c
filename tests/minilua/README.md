This test is essentially a fairly complex program called minilua, which is part of the LuaJIT distribution.

The orginal code has been modified:
* to avoid initializers for structs, arrays and unions, as these are not yet supported.
* the use of var arg macros in stdarg.h is not supported, hence all functions making use of these are moved to a separate source file.

## Status

* Compiles on Linux as described below. As include headers are not supported on Windows, you can only compile this on Linux.
* We can now run the hello.lua script!

## Steps to build

```
sparse-llvm minilua.c -o minilua.bc
llc minilua.bc
gcc -o minilua minilua.s miniluav.c -lm
```
