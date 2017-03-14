This test is essentially a fairly complex program called minilua, which is part of the LuaJIT distribution.

The orginal code has been modified to avoid initializers for structs, arrays and unions, as these are not yet supported.

## Status

* Compiles without LLVM errors - as include headers are not supported on Windows, you can only compile this on Linux.
* Crashes when run 