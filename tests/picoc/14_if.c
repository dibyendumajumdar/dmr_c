extern int printf(const char *fmt, ...);

int main(void) 
{
	int a = 1;

	if (a)
    	printf("a is true\n");
	else
    	printf("a is false\n");

	int b = 0;
	if (b)
    	printf("b is true\n");
	else
    	printf("b is false\n");

    return 0;
}

