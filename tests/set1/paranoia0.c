#define FLOAT double
#define INT int
#define FP FLOAT
#define CHARP char *
#define CHARPP char **

/*Small floating point constants.*/
static FLOAT Half = 0.5;
static FLOAT One = 1.0;
static FLOAT Two = 2.0;

extern int printf(const char *, ...);

int main(void)
{
	/* First two assignments use integer right-hand sides. */
	One = 1;
	Two = One + One;
	Half = One / Two;

	printf("%f\n", Half);

	return Half == 0.5 ? 0 : 1;
}	

