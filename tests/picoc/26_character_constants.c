extern int printf(const char *fmt, ...);

int main(void)
{
	printf("%d\n", '\1');
	printf("%d\n", '\10');
	printf("%d\n", '\100');
	printf("%d\n", '\x01');
	printf("%d\n", '\x0e');
	printf("%d\n", '\x10');
	printf("%d\n", '\x40');
	printf("test \x407\n");

	return 0;
}
