# Tests for OMRJIT backend

## How to run

* Build dmr_C with OMR JIT backend
* Run the tests using the sparse-omrjit command as follows

```
sparse-omrjit <testfile>
```

## Failing tests

* bitfields.c fails
* locals.c fails - this is because of incorrect optimization when address of auto var is passed to a function. 

