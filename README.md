# dmr_C

The aim of the dmr_C project is to create a JIT compiler for C. Is is based on the the Linux [Sparse](https://sparse.wiki.kernel.org/index.php/Main_Page) library originally written by Linus Torvalds. 

The name dmr_C is a homage to Dennis M Ritchie.

## Overview

dmr_C is a fork of Sparse. The main changes are:

* Removed global state
* Renamed objects and functions with external linkage to avoid polluting the global namespace
* Ensured that the library can be built on Windows using MSVC
* WIP Ensure that code can be compiled using a C++ compiler
* Converted the LLVM backend to a JIT compiler - i.e. it is exposed as a library API
* WIP Work is ongoing on additional backend based on [nanojit](https://github.com/dibyendumajumdar/dmr_c/tree/master/nanojit-backend).

## Current status

* We are now able to build on Windows, Linux and Mac OSX. However there are platform specific limitations - see below for details.
* The LLVM backend has had many fixes and is able to compile real programs. See details below for what works and what doesn't.
* The NanoJIT backend is now able to handle a reasonable subset of C, although it is not yet as well tested as the LLVM backend.

## News
* Sep-2017 - a lot more functional NanoJIT backend
* Aug-2017 - synced with Sparse 0.5.1 release

## Build instructions

The build is pretty standard CMake build. There are no external dependencies except LLVM or NanoJIT. To build without a backend just try:

```
mkdir build
cd build
cmake ..
```
This will generate appropriate build files that can then be used to build the project.

### LLVM Backend

To build with LLVM support, additional arguments are needed. Following instructions are for LLVM 3.9 on Windows 10. 

```
mkdir build
cd build
cmake -DLLVM_JIT=ON -DLLVM_DIR=$LLVM_INSTALL_DIR\lib\cmake\llvm -G "Visual Studio 15 2017 Win64" ..
```

Here $LLVM_INSTALL_DIR refers to the path where LLVM is installed. 

Generation of build scripts follows the same process on Linux and Mac OSX platforms. Note that on Ubuntu the standard LLVM package has broken CMake files hence the recommended approach is to download and build LLVM before attempting to build dmr_C.

Once the build files are generated you can use the normal build tools i.e. Visual Studio on Windows and make on UNIX or Mac OSX platforms.

### NanoJIT Backend 

* First follow instructions to build a [NanoJIT](https://github.com/dibyendumajumdar/nanojit) library.
* You may need to amend the script [FindNanoJIT.cmake](https://github.com/dibyendumajumdar/dmr_c/blob/master/cmake/FindNanoJIT.cmake) to
  match your installation details.
* Next you can generate the CMake build scripts. I use following on Windows 10.

```
mkdir build
cd build
cmake -DNANO_JIT=ON -G "Visual Studio 15 2017 Win64" ..
```

Process on Linux should be similar except for the CMake generator target.

## Using dmr_C as a JIT

dmr_C has two alternative backend JIT engines, LLVM and NanoJIT. The LLVM backend is better tested and has evolved from sparse-llvm tool that comes with Sparse. The NanoJIT backend is entirely new, has had little testing, and is also more limited in the features supported.

### Using the LLVM backend

To use it as a LLVM based JIT you only need to invoke following:

```C
extern bool dmrC_llvmcompile(int argc, char **argv, LLVMModuleRef module,
			     const char *inputbuffer);
```

The call accepts the arguments passed to a main() function, an LLVMModuleRef, and an optional buffer to be compiled. It will preprocess files if needed, and compile each of the source files given in the argument list. It will finally compile the supplied input buffer. The results of the compilation will be in the supplied LLVMModuleRef for the calling program to use as it wishes. 

A very simple use is below:

```C
#include <dmr_c.h>
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

This is basically what the sparse-llvm command (see below) does.

#### Limitations of LLVM backend

* Initializers on static and globals do not work yet except for simple strings and scalar variables. The front-end does handle these - the limitation is in the LLVM backend.
* Aggregate assignments are not yet supported by the LLVM backend, i.e. you cannot assign a struct by value.
* Initialization of char[] doesn't work as it is treated as an aggregate assignment.
* The `va_arg` mechanism is not supported.
* There is no support for computed gotos in the LLVM backend.
* The front-end parser and pre-processor knows about many Linux constructs hence it can process C header files on Linux. However, it doesn't know about Windows or Mac OSX features. As typically the vendor supplied header files have many platform specific extensions, unfortunately this means that you cannot process vendor supplied header files on these platforms.

### Using the NanoJIT backend

This is very similar to how the LLVM backend is used. There is again a single API call to compile C code. There are additional steps need to execute the compiled code.

```C
bool dmrC_nanocompile(int argc, char **argv, NJXContextRef module,
		      const char *inputbuffer);
```

Below is what the sparse-nanojit tool does:

```C
#include <dmr_c.h>

#include <stdbool.h>
#include <stdio.h>

int main(int argc, char **argv)
{
	NJXContextRef module = NJX_create_context(true);

	int rc = 0;
	if (!dmrC_nanocompile(argc, argv, module, NULL))
		rc = 1;

	int (*fp)(void) = NULL;
	if (rc == 0) {
		/* To help with testing check if the source defined a function
		 * named TestNano() and if so, execute it
		 */
		fp = NJX_get_function_by_name(module, "TestNano");
		if (fp) {
			int fprc = fp();
			if (fprc != 0) {
				printf("TestNano Failed (%d)\n", fprc);
				rc = 1;
			} else {
				printf("TestNano OK\n");
			}
		}
	}
	NJX_destroy_context(module);

	return rc;
}
```

In the example above, we check if there is a compiled function named 'TestNano'. If it is then we invoke it.

#### Limitations of NanoJIT backend

* Computed gotos are not supported
* Bitfield access is implemented but very well tested
* Calling functions through function pointers is not yet supported
* Aggregate initializers are not supported
* The `va_arg` mechanism is not supported
* Recursive function calls are not possible at present due to the way functions are resolved
* NanoJIT only allows 4 integer/pointer parameters (on X86-64) inside a JIT function
* You cannot have static or global data in JIT code
* String initializers are not supported
* Generated code for switch statements uses if (cond) branching rather than a jump table. NanoJIT does have a jump table instruction
but it requires the indices to be consecutive starting from zero, and there is no support for a default case. In future this instruction may be used when possible.

## Using dmr_C command line tools

The following command line tools are built:

### sparse-llvm
The sparse-llvm tool takes in a source C file and generates an LLVM module. It writes the LLVM Module in LLVM bitcode format.

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

### linearize
The linearize tool outputs the SSA IR generated by the parser and compiler front-end. (Note that these instructions are converted by the sparse-llvm backend to LLVM IR)

### showsymbols
The showsymbols tool shows the global symbols found in a source file, output is generated in XML format.

### showparsetree
This tool dumps the parse tree as built by the C parser - note that this tool is experimental and the output format is evolving. 

### sparse
The sparse tool checks C code and outputs warnings or error messages for certain conditions. For details please see [Linux Sparse man page](https://linux.die.net/man/1/sparse).

### The JIT backends

#### How it works

* The JIT backends take the [Sparse SSA IR](https://github.com/dibyendumajumdar/dmr_c/blob/master/docs/instructions.md) generated by the linearizer in sparse and converts these to JIT IR instructions.
* You can view the Sparse SSA IR output by running the linearize command.
* The [Sparse SSA IR](https://github.com/dibyendumajumdar/dmr_c/blob/master/docs/instructions.md) is lower level than LLVM IR - in particular it has no concept of types other than primitive integer, floating point and pointer types. The generated LLVM IR therefore relies upon casting the values where required to types expected by LLVM.

#### Bugs

Many bugs have been fixed in the LLVM backend and the tool is able to compile and run real programs. However there are still bugs that mean that the generated code is sometimes not correct. See the `tests/bugs` folder for examples of programs that fail to compile successfully. If you hit a problem, please submit a bug report with a minimal example of program that fails.

## Using dmr_C as a library

The dmr_C is also a library and can be linked and used by application programs. As a library it is made up of several components:

* Tokenizer - this converts the input stream into tokens
* Preprocesser - this carries out C pre-processing
* Parser - this parses the token stream and creates parse tree and symbols
* Linearizer - this takes the parsed tree and symbols and generates SSA IR
* Optimizer - this performs various optimizations on the SSA IR
* LLVM backend - this takes the SSA IR output and converts this to LLVM IR
* NanoJIT backend - alternative backend that generates machine code using NanoJIT

## Links

* [Sparse - a Semantic Parser for C](https://sparse.wiki.kernel.org/index.php/Main_Page)
* [Article on Sparse](https://lwn.net/Articles/689907/)
* [Wikipedia entry for Sparse](https://en.wikipedia.org/wiki/Sparse)
* [Sparse Linux Man Page](https://linux.die.net/man/1/sparse)
* [Smatch](http://smatch.sourceforge.net) is a tool based on Sparse
