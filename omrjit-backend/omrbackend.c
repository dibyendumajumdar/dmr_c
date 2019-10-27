/**
 * This is a backend code generator for dmr_C that uses
 * the JIT engine NanoJIT (https://github.com/dibyendumajumdar/nanojit).
 *
 * Copyright (C) 2017 Dibyendu Majumdar
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#include <dmr_c.h>

#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

static void printd(double d) { printf("%.12f\n", d); }
static void printi(int i) { printf("%d\n", i); }
static void printll(long long i) { printf("%lld\n", i); }
static long long printlllii(long long a, long long b, long long c, int d, int e)
{
	printf("received %lld %lld %lld %d %d\n", a, b, c, d, e);
	return a + b + c + d + e;
}
static bool register_builtin_arg0(JIT_ContextRef module, const char *name, void *fp, JIT_Type return_type)
{
	JIT_Type args[1] = {0};
	JIT_RegisterFunction(module, name, return_type, 0, args, fp);
	return true;
}
static bool register_builtin_arg1(JIT_ContextRef module, const char *name, void *fp, JIT_Type return_type,
				  JIT_Type arg1)
{
	JIT_Type args[1];
	args[0] = arg1;
	JIT_RegisterFunction(module, name, return_type, 1, args, fp);
	return true;
}
static bool register_builtin_arg2(JIT_ContextRef module, const char *name, void *fp, JIT_Type return_type,
				  JIT_Type arg1, JIT_Type arg2)
{
	JIT_Type args[2];
	args[0] = arg1;
	args[1] = arg2;
	JIT_RegisterFunction(module, name, return_type, 2, args, fp);
	return true;
}
static bool register_builtin_arg5(JIT_ContextRef module, const char *name, void *fp, JIT_Type return_type,
				  JIT_Type arg1, JIT_Type arg2, JIT_Type arg3, JIT_Type arg4, JIT_Type arg5)
{
	JIT_Type args[5];
	args[0] = arg1;
	args[1] = arg2;
	args[2] = arg3;
	args[3] = arg4;
	args[4] = arg5;
	JIT_RegisterFunction(module, name, return_type, 5, args, fp);
	return true;
}

int main(int argc, char **argv)
{
	JIT_ContextRef module = JIT_CreateContext();

	if (!register_builtin_arg1(module, "printd", printd, JIT_NoType, JIT_Double) ||
	    !register_builtin_arg1(module, "printi", printi, JIT_NoType, JIT_Int32) ||
	    !register_builtin_arg1(module, "printll", printll, JIT_NoType, JIT_Int64) ||
	    !register_builtin_arg5(module, "printlllii", printlllii, JIT_Int64, JIT_Int64, JIT_Int64, JIT_Int64,
				   JIT_Int32, JIT_Int32) ||
	    !register_builtin_arg1(module, "exit", exit, JIT_NoType, JIT_Int32) ||
	    !register_builtin_arg0(module, "abort", abort, JIT_NoType) ||
	    !register_builtin_arg1(module, "fabs", fabs, JIT_Double, JIT_Double) ||
	    !register_builtin_arg1(module, "malloc", malloc, JIT_Address, JIT_Int64) ||
	    !register_builtin_arg1(module, "free", free, JIT_NoType, JIT_Address) ||
	    !register_builtin_arg2(module, "calloc", calloc, JIT_Address, JIT_Int64, JIT_Int64)) {
		fprintf(stderr, "Failed to register inbuilt functions\n");
		goto Lexit;
	}

	int rc = 0;
	if (!dmrC_omrcompile(argc, argv, module, NULL))
		rc = 127;

	int (*fp)(void) = NULL;
	if (rc == 0) {
		/* To help with testing check if the source defined a function
		 * named TestNano() and if so, execute it
		 */
		fp = JIT_GetFunction(module, "TestNano");
		if (fp == NULL) {
			fp = JIT_GetFunction(module, "main");
		}
		if (fp) {
			rc = fp();
		}
		else {
			rc = 126;
		}
	}
Lexit:
	JIT_DestroyContext(module);

	return rc;
}
