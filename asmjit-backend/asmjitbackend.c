#include <stdio.h>
#include <stdbool.h>

typedef struct ASMJITContext* ASMJITContextRef;
extern bool dmrC_asmjitcompile(int argc, char **argv, ASMJITContextRef jit,
	const char *inputbuffer);

int main(int argc, const char *argv[])
{
	dmrC_asmjitcompile(argc, argv, NULL, NULL);
	return 0;
}
