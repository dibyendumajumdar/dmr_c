extern int printf(const char *, ...);

int main(void)
{
	float a = 'a';
	printf("%f\n", (double)a);

	return 0;
}
