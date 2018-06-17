# dmr_C backend using OMR JIT

## Overview

This is a new backend that is using the [Eclipse OMR JIT](https://github.com/dibyendumajumdar/nj). It is currently work in progress.

## What works

Have a look at the [test program](https://github.com/dibyendumajumdar/dmr_c/blob/master/omrjit-backend/testomrbackend.c) to see 
examples of what works.

## Build Instructions for Windows 10

* First you need to build and install [OMR JIT](https://github.com/dibyendumajumdar/nj). 
* Assuming that you installed under `/Software/omr`, then you can setup dmr_C using:

```
mkdir build
cd build
cmake -G "Visual Studio 15 2017 Win64" -DOMR_JIT=ON ..
```

* Now you can open the project in Visual Studio and build it.

## Usage

This is very similar to how the LLVM backend is used. There is again a single API call to compile C code; this is declared in header file `dmr_c.h`. Additional steps are needed to execute the compiled code.

```C
bool dmrC_omrcompile(int argc, char **argv, JIT_ContextRef module,
		      const char *inputbuffer);
```

Below is what the sparse-nanojit tool does:

```C
#include <dmr_c.h>

#include <stdbool.h>
#include <stdio.h>

int main(int argc, char **argv)
{
	JIT_ContextRef module = JIT_CreateContext();

	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, NULL))
		rc = 1;

	int (*fp)(void) = NULL;
	if (rc == 0) {
		/* To help with testing check if the source defined a function
		 * named TestNano() and if so, execute it
		 */
		fp = JIT_GetFunction(module, "TestNano");
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
	JIT_DestroyContext(module);

	return rc;
}
```

In the example above, we check if there is a compiled function named 'TestNano'. If it is then we invoke it.
