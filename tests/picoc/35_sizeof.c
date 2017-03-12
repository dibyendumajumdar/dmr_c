extern int printf(const char *fmt, ...);

int main(void)
{
	char a;
	short b;

	printf("%d %d\n", (int)sizeof(char), (int)sizeof(a));
	printf("%d %d\n", (int)sizeof(short), (int)sizeof(b));

	return 0;
}
