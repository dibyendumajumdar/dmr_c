extern int printf(const char *fmt, ...);

static int fred(int p)
{
    printf("yo %d\n", p);
    return 42;
}

static int (*f)(int);

int main(void)
{
	f = &fred;
    printf("%d\n", f(24));
    return 0;
}
