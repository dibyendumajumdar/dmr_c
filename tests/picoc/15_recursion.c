extern int printf(const char *fmt, ...);

static int factorial(int i) 
{
    if (i < 2)
        return i;
    else
        return i * factorial(i - 1);
}


int main(void) 
{
	int Count;

	for (Count = 1; Count <= 10; Count++)
	    printf("%d\n", factorial(Count));

	return 0;
}
