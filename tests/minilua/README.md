This test is essentially a fairly complex program called minilua, which is part of the LuaJIT distribution.

The orginal code has been modified to avoid initializers for structs, arrays and unions, as these are not yet supported.

## Status

* Compiles without LLVM errors - as include headers are not supported on Windows, you can only compile this on Linux.
* We can now run the hello.lua script!

## Steps to run

```
sparse-llvm minilua.c -o minilua.bc
lli minilua.bc hello.lua
```
