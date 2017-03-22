#if __DMR_C__
extern int printf(const char *, ...);
#else
#include <stdio.h>
#endif

int li;
float fr;

int main(void) 
{
	li = 5;
	fr = 2;

	printf("%d\n", (int)(li/fr));
	return 0;
}