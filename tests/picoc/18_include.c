extern int printf(const char *fmt, ...);

int main(void)
{
	printf("including\n");
	#include "18_include.h"
	printf("done\n");

	return 0;
}
