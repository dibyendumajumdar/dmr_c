# dmr_c

The aim of the dmr_c project is to create a JIT compiler for C. Is is based on the the Linux [Sparse](https://sparse.wiki.kernel.org/index.php/Main_Page) library originally written by Linus Torvalds. 

The name dmr_c is a homage to Dennis M Ritchie.

## Overview

The code base is a fork of Sparse. The main changes are:

* Removal of global state (see issues log for outstanding issues)
* Ensure the library can be built on Windows using MSVC
* Modify the code to be more C++ friendly
* Convert the LLVM backend to a JIT compiler
* Add other backends - possibly based on nanojit and/or asmjit.

## Current status

* We are now able to build on Windows, Linux and Mac OSX.
* Global state has been removed except for the way ptr_list nodes are allocated.
* The LLVM backend has had many fixes and is able to compile real programs. See the tests folder for what works, and what doesn't.

## Build instructions

The build is pretty standard CMake build. There are no external dependencies except LLVM. To build without LLVM backend just try:

```
mkdir build
cd build
cmake ..
```
This will generate appropriate build files that can then be used to build the project.

To build with LLVM support, additional arguments are needed. Following instructions are for LLVM 3.9 on Windows 10. 

```
mkdir build
cd build
cmake -DLLVM_JIT=ON -DLLVM_DIR=$LLVM_INSTALL_DIR\lib\cmake\llvm -G "Visual Studio 15 2017 Win64" ..
```

Here $LLVM_INSTALL_DIR refers to the path where LLVM is installed. 

Build on Linux and Mac OSX is similar.

## Using dmr_c

Right now following pieces have been ported but testing is still ongoing so no guarantee that the build works correctly.

* Tokenizer
* Preprocesser
* Parser and Semantic analyser
* Linearizer
* LLVM backend

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

## LLVM backend

The Sparse project comes with an LLVM backend called sparse-llvm. This is included in dmr_C. The LLVM backend is being developed to fix bugs and to define the subset of C that works. 

### Unsupported features
Currently following features are known to not work:

* Initializers for arrays, structs and unions. Only simple scalar initializers work including strings.

## Samples 

The build generates a few example command line tools that use the Sparse library:

* show-parse - this tool outputs the parse tree as built by Sparse
* show-symbols - this tool outputs the global / static symbols in C code - the output is produced in XML format
* linearizer - this tool outputs the linearized output from Sparse

## Links

* [Sparse - a Semantic Parser for C](https://sparse.wiki.kernel.org/index.php/Main_Page)
* [Article on Sparse](https://lwn.net/Articles/689907/)
* [Wikipedia entry for Sparse](https://en.wikipedia.org/wiki/Sparse)
