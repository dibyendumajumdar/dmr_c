extern int printf(const char *fmt, ...);

int main(void) {
	int a;
	a = 42;
	printf("%d\n", a);

	int b = 64;
	printf("%d\n", b);

	int c = 12, d = 34;
	printf("%d, %d\n", c, d);

	return 0;
}
