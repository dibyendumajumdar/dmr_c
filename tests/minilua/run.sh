../../build/sparse-llvm minilua.c -o minilua.bc
$HOME/LLVM/bin/llc minilua.bc
gcc -o minilua minilua.s miniluav.c -lm
./minilua hello.lua
