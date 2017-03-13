extern int printf(const char *, ...);

static char *str = "hello %d %f %f\n";
static int i = 55;
static float f = 1.5;
static double d = 65.78;

int main(void)
{
	printf(str, i, f, d);	

	int x = 6;
	const char *txt = "local string %d %f %f\n";
	float g = 4.2;
	double e = 42.34;

	const char *fmt = txt+1;

	printf(fmt, x, g, e);		

	return 0;
}
