extern int printf(const char *fmt, ...);

int main(void) 
{
	int a = 24680;
	int b = 01234567;
	int c = 0x2468ac;
	int d = 0x2468AC;
	int e = 0b010101010101;

	printf("%d\n", a);
	printf("%d\n", b);
	printf("%d\n", c);
	printf("%d\n", d);
	printf("%d\n", e);

	return 0;
}
