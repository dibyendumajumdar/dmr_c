# Tests for Sparse-LLVM backend

The tests in this folder are for validating the LLVM backend for Sparse. Each test can be compiled and run - the test should end normally with return code 0 on success.

Following steps show how to test one program.

```
sparse-llvm funcptr1.c 
lli out.bc
echo $?
```


