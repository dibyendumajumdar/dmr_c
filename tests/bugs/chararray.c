extern int printf(const char *, ...);
int main(void)
{
	static char s86er[] = "s86,er%d\n";
	printf(s86er, 1);
	return 0;
}