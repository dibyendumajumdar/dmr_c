extern int printf(const char *fmt, ...);

enum fred
{
    a,
    b,
    c,
    d,
    e = 54,
    f = 73,
    g,
    h
};

int main(void)
{
	enum fred frod;

	printf("%d %d %d %d %d %d %d %d\n", a, b, c, d, e, f, g, h);
	frod = 12;
	printf("%d\n", frod);
	frod = e;
	printf("%d\n", frod);

	return 0;
}
