This test is essentially a fairly complex program called minilua, which is part of the LuaJIT distribution.

The orginal code has been modified to avoid initializers for structs, arrays and unions, as these are not yet supported.

## Status

* ~~Compiles without LLVM errors~~ - as include headers are not supported on Windows, you can only compile this on Linux.
* ~~We can now run the hello.lua script!~~
* Update: as sparse-llvm does not handle variable argument processing correctly temporarily this won't compile. For now we will modify the code to move out all var arg processing to a separate unit and compile that with gcc.

## Steps to run

Update: following will not work due to above.

```
sparse-llvm minilua.c -o minilua.bc
lli minilua.bc hello.lua
```
