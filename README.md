# dmr_c

dmr_c is a project that aims to create a JIT compiler for C. Is is being created by reworking the Linux Kernel [Sparse](https://sparse.wiki.kernel.org/index.php/Main_Page) library originally written by Linus Torvalds. 

The name dmr_C is a homage to Dennis M Ritchie.

## Overview

The code base is a fork of Sparse v0.5.0. The main changes are:

* Remove global state (see issues log for outstanding issues)
* Ensure the library can be built on Windows using MSVC
 * Modify the code to be more C++ friendly
* Convert the LLVM backend to a JIT compiler

## Current status

* We are now able to build the sparse executable, but not all tests pass yet. 

## Build instructions

The build is pretty standard CMake build. There are no external dependencies. For example:
#
```
mkdir build
cd build
cmake ..
```

This will generate appropriate build files that can then be used to build the project.

## Using dmr_c
#
Right now following pieces have been ported but testing is still ongoing so no guarantee that the build works correctly.

* Tokenizer
* Preprocesser
* Parser and Semantic analyser
* Linearizer

Details of each of these is given below.


## Tokenizer

Here is a simple program that uses the tokenizer. The tokenizer converts the input into a stream of tokens.

```
	struct dmr_C *C = new_dmr_C();

char test1[100] =
	    "int main() { printf(\"hello world!\\n\"); return 0; }";
	struct token *start;
	struct token *end;
	start = tokenize_buffer(C, (unsigned char *)test1,
				(unsigned long)strlen(test1), &end);

    // do something with the tokens!

	destroy_dmr_C(C);
```

The state of the parser is maintained in a structure called dmr_C. All state is maintained here except for ptr_list nodes which are
managed globally due to the way the ptr_list is implemented (see issue #1).

The example above tokenizes a buffer, but it is also possible to tokenize a file.

The destroy_dmr_C() call cleans up the parser state except for the globally maintained ptr_list nodes.

## Preprocessor

The above example can be extended to use the preprocessor by just adding one line.

```
	start = tokenize_buffer(C, (unsigned char *)test1,
				(unsigned long)strlen(test1), &end);

	start = preprocess(C, start);
```

There is no driver as yet to pass various arguments but the underlying pre-processor can handle normal preprocessing of C programs.

## Parsing 

To follow.

## Driver program

To follow.

## LLVM integration

The Sparse project comes with an LLVM backend called sparse-llvm. This is included in dmr_C. Following instructions are
for LLVM 3.9 on Windows 10. 

```
cmake -DLLVM_JIT=ON  -DLLVM_DIR=$LLVM_INSTALL_DIR\lib\cmake\llvm -G "Visual Studio 14 Win64" ..
```

## Links

* [Article on Sparse](https://lwn.net/Articles/689907/)
