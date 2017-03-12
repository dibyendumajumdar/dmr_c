extern int printf(const char *fmt, ...);
extern char * strcpy ( char * destination, const char * source );

int main(void)
{
	char a[10];
	strcpy(a, "abcdef");
	printf("%s\n", &a[1]);

	return 0;
}
