#!/bin/bash
set -e
sparse-llvm minilua.c -o minilua.bc
llc minilua.bc
gcc -o minilua minilua.s miniluav.c -lm
./minilua hello.lua

cd tests && sh ./run.sh && cd -
cd dynasm && sh ./run.sh && cd - 
