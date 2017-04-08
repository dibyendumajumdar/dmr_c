#include <nanojitextra.h>

#include <stdio.h>
#include <stdbool.h>

extern bool dmrC_nanocompile(int argc, char **argv, NJXContextRef module, const char *inputbuffer);

int main(int argc, char **argv)
{
	NJXContextRef module = NJX_create_context(true);

	int rc = 1;
	dmrC_nanocompile(argc, argv, module, NULL);

	NJX_destroy_context(module);

	return rc;
}
