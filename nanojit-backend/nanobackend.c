#include <nanojitextra.h>

#include <stdbool.h>
#include <stdio.h>

extern bool dmrC_nanocompile(int argc, char **argv, NJXContextRef module,
			     const char *inputbuffer);

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
