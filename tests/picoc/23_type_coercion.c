extern int printf(const char *fmt, ...);

static void charfunc(char a)
{
    printf("char: %c\n", a);
}

static void intfunc(int a)
{
    printf("int: %d\n", a);
}

static void floatfunc(float a)
{
    printf("float: %f\n", (double)a);
}

int main(void)
{
	charfunc('a');
	charfunc(98);
	charfunc(99.0);

	intfunc('a');
	intfunc(98);
	intfunc(99.0);

	floatfunc('a');
	floatfunc(98);
	floatfunc(99.0);

	printf("%c %d %f\n", 'a', 'b', (double)'c');
	printf("%c %d %f\n", 97, 98, (double)99);
	printf("%c %d %f\n", (char)97.0, (int)98.0, 99.0);

	char b = 97;
	char c = 97.0;

	printf("%d %d\n", b, c);

	int d = 'a';
	int e = 97.0;

	printf("%d %d\n", d, e);
	float f = 'a';
	float g = 97;

	printf("%f %f\n", (double)f, (double)g);

	return 0;
}

