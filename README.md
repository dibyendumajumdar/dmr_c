# dmr_C

The aim of the dmr_C project is to create a JIT compiler for C. Is is based on the the Linux [Sparse](https://sparse.wiki.kernel.org/index.php/Main_Page) library originally written by Linus Torvalds. 

The name dmr_C is a homage to Dennis M Ritchie.

## Overview

The code base is a fork of Sparse. The main changes are:

* Remove global state
* Rename objects and functions with external linkage to avoid polluting the global namespace
* Ensure the library can be built on Windows using MSVC
* Modify the code to be more C++ friendly
* Convert the LLVM backend to a JIT compiler
* Add other backends - possibly based on [nanojit](https://github.com/dibyendumajumdar/dmr_c/tree/master/nanojit-backend) and [asmjit](https://github.com/dibyendumajumdar/dmr_c/tree/master/asmjit-backend).

## Current status

* We are now able to build on Windows, Linux and Mac OSX. However there are platform specific limitations - see below for details.
* Global state has been removed mostly
* The LLVM backend has had many fixes and is able to compile real programs. See details below for what works and what doesn't.
* NOTE: Due to some other commitments work on this project will resume mid June.

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

Generation of build scripts follows the same process on Linux and Mac OSX platforms.

Once the build files are generated you can use the normal build tools i.e. Visual Studio on Windows and make on UNIX platforms.

## Using dmr_C command line tools

The following command line tools are built:

* sparse-llvm - this tool takes in a source C file and generates an LLVM module. It writes the LLVM Module in LLVM bitcode format.
* linearize - this tool outputs the SSA IR generated by the parser and compiler front-end. These instructions are converted by the sparse-llvm backend to LLVM IR.
* showsymbols - this tool shows the global symbols found in a source file, output is generated in XML format.
* showparse - this tool displays the parse tree generated by the front-end. This is the parse tree that is fed to the linearizer to produce SSA IR.
* sparse - this is a tool for analysing C code 

### sparse-llvm tool

#### How it works

* The LLVM backend takes the [Sparse SSA IR](https://github.com/dibyendumajumdar/dmr_c/blob/master/docs/instructions.md) generated by the linearizer in sparse and converts these to LLVM IR instructions.
* You can view the linearizer output by running the linearize command.
* The [Sparse SSA IR](https://github.com/dibyendumajumdar/dmr_c/blob/master/docs/instructions.md) is lower level than LLVM IR - in particular it has no concept of types other than primitive int, floating and pointer types. The generated LLVM IR therefore relies upon casting the values where required to types expected by LLVM.

#### Limitations

* Initializers on static and globals do not work yet except for simple strings and scalar variables. The front-end does handle these - the limitation is in the sparse-llvm backend.
* Aggregate assignments are not yet supported by the sparse-llvm backend.
* The va_arg mechanism is not supported.
* There is no support for computed gotos yet in the sparse-llvm backend.
* The front-end parser and pre-processor knows about many Linux constructs hence it can process C header files on Linux. However, it doesn't know about Windows or Mac OSX features. As typically the vendor supplied header files have many platform specific extensions, unfortunately this means that you cannot process vendor supplied header files on these platforms.

#### Usage

* The tool will output the preprocesed source code if -E option is given.
* The tool will save the output to specified file if -o option is given, otherwise output is saved to file named 'out.bc' in current directory.
* The -O1 option can be used to enable internal IR simplifications. Note that these simplifications sometimes cause issues - see the tests/bugs folder for known issues. 
* To run the generated module, you typically need to generate assembly code and then link it to produce an executable. Example:

```
sparse-llvm test.c -o test.bc
llc test.bc
gcc -o test test.s

```

* Alternatively you can also run the bitcode directly using the LLVM command `lli`.

```
sparse-llvm test.c -o test.bc
lli test.bc

```

* You can generate LLVM IR by running the `llvm-dis` command.

```
sparse-llvm test.c -o test.bc
llvm-dis test.bc

```

#### Bugs

Many bugs have been fixed and the tool is able to compile and run real programs. However there are still bugs that mean that the generated code is sometimes not correct. See the `tests/bugs` folder for examples of programs that fail to compile successfully. If you hit a problem, please submit a bug report with a minimal example of program that fails.


## Using dmr_C as a library

The dmr_C is also a library and can be linked and used by application programs. As a library it is made up of several components:

* Tokenizer - this converts the input stream into tokens
* Preprocesser - this carries out C pre-processing
* Parser - this parses the token stream and creates parse tree and symbols
* Linearizer - this takes the parsed tree and symbols and generates SSA IR
* Optimizer - this performs various optimizations on the SSA IR
* LLVM backend - this takes the SSA IR output and converts this to LLVM IR

Details of each of these is given below.

## LLVM Backend

There is a single API call:

```C
LLVMModuleRef dmrC_llvmcompile(int argc, char **argv, 
	LLVMContextRef context, const char *modulename, const char *inputbuffer);
```

The call accepts the arguments passed to a main() function, an LLVMContext, a module name, and an optional buffer to be compiled. It will preprocess files if needed, and compile each of the source files given in the argument list. Although not yet implemented the intention is that it will also compile the supplied input buffer. The results of the compilation are returned as an LLVM Module for the calling program to use as it wishes. 

A very simple use is below:

```C
#include <dmr_c_llvm.h>
#include <stdio.h>

int main(int argc, char **argv)
{
	int rc = 1;

	LLVMContextRef context = LLVMGetGlobalContext();
	LLVMModuleRef module =
	    LLVMModuleCreateWithNameInContext("dmrC", context);
	if (module) {
        if (dmrC_llvmcompile(argc, argv, module, NULL))
            rc = 0;
		LLVMDisposeModule(module);
	}
	return rc;
}
```

This is basically what the sparse-llvm command does.


## Tokenizer

Here is a simple program that uses the tokenizer. The tokenizer converts the input into a stream of tokens.

```C
	struct dmr_C *C = new_dmr_C();

	char test1[100] =
	    "int main() { printf(\"hello world!\\n\"); return 0; }";
	struct token *start;
	struct token *end;
	start = dmrC_tokenize_buffer(C, (unsigned char *)test1,
				(unsigned long)strlen(test1), &end);

	// do something with the tokens!
	for (struct token *p = start; p != end; p = p->next) {
		printf("%s\n", dmrC_show_token(C, p));
	}

	destroy_dmr_C(C);
```

The state of the parser is maintained in a structure called dmr_C. All state is maintained here except for ptr_list nodes which are
managed globally due to the way the ptr_list is implemented (see issue #1).

The example above tokenizes a buffer, but it is also possible to tokenize a file.

The destroy_dmr_C() call cleans up the parser state except for the globally maintained ptr_list nodes.

## Preprocessor

The above example can be extended to use the preprocessor by just adding one line.

```C
	start = dmrC_tokenize_buffer(C, (unsigned char *)test1,
				(unsigned long)strlen(test1), &end);

	start = dmrC_preprocess(C, start);
```

There is no driver as yet to pass various arguments but the underlying pre-processor can handle normal preprocessing of C programs.

## Parsing 

To follow.

## Links

* [Sparse - a Semantic Parser for C](https://sparse.wiki.kernel.org/index.php/Main_Page)
* [Article on Sparse](https://lwn.net/Articles/689907/)
* [Wikipedia entry for Sparse](https://en.wikipedia.org/wiki/Sparse)
* [Sparse Linux Man Page](https://linux.die.net/man/1/sparse)
