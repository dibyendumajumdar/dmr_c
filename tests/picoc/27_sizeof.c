extern int printf(const char *fmt, ...);

int main(void)
{
	char a;
	int b;
	double c;

	printf("%d\n", sizeof(a));
	printf("%d\n", sizeof(b));
	printf("%d\n", sizeof(c));

	return 0;
}
