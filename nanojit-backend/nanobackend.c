#include <dmr_c.h>

#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

static void printd(double d) { printf("%.12f\n", d); }
static void printi(int i) { printf("%d\n", i); }
static void printll(long long i) { printf("%lld\n", i); }
static bool register_builtin_arg1(NJXContextRef module, const char *name,
				  void *fp, enum NJXValueKind return_type,
				  enum NJXValueKind arg1)
{
	enum NJXValueKind args[1];
	args[0] = arg1;
	return NJX_register_C_function(module, name, fp, return_type, args, 1);
}
static bool register_builtin_arg2(NJXContextRef module, const char *name,
				  void *fp, enum NJXValueKind return_type,
				  enum NJXValueKind arg1,
				  enum NJXValueKind arg2)
{
	enum NJXValueKind args[2];
	args[0] = arg1;
	args[1] = arg2;
	return NJX_register_C_function(module, name, fp, return_type, args, 2);
}

int main(int argc, char **argv)
{
	NJXContextRef module = NJX_create_context(true);

	if (!register_builtin_arg1(module, "printd", printd, NJXValueKind_V,
				   NJXValueKind_D) ||
	    !register_builtin_arg1(module, "printi", printi, NJXValueKind_V,
				   NJXValueKind_I) ||
	    !register_builtin_arg1(module, "printll", printll, NJXValueKind_V,
				   NJXValueKind_Q) ||
	    !register_builtin_arg1(module, "fabs", fabs, NJXValueKind_D,
				   NJXValueKind_D) ||
	    !register_builtin_arg1(module, "malloc", malloc, NJXValueKind_P,
				   NJXValueKind_Q) ||
	    !register_builtin_arg1(module, "free", free, NJXValueKind_V,
				   NJXValueKind_P) ||
	    !register_builtin_arg2(module, "calloc", calloc, NJXValueKind_P,
				   NJXValueKind_Q, NJXValueKind_Q)) {
		fprintf(stderr, "Failed to register inbuilt functions\n");
		goto Lexit;
	}

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
Lexit:
	NJX_destroy_context(module);

	return rc;
}
