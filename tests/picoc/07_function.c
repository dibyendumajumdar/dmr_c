extern int printf(const char *fmt, ...);

static int myfunc(int x)
{
    return x * x;
}

static void vfunc(int a)
{
    printf("a=%d\n", a);
}

static void qfunc(void)
{
    printf("qfunc()\n");
}

int main(void) 
{
	printf("%d\n", myfunc(3));
	printf("%d\n", myfunc(4));

	vfunc(1234);
	qfunc();

	return 0;
}
