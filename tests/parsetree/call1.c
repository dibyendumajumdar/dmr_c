extern int printf(const char *s, ...);
extern int foo(int a, double b);

void bar(double x)
{
	printf("%s\n", "hello");
	foo(1, x+3.0);
	int (*foo_ptr)(int, double) = foo;
	foo_ptr(1, x-1.0);
}