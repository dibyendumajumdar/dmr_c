extern int printf(const char *fmt, ...);

#define FRED 12
#define BLOGGS(x) (12*(x))

int main(void) 
{

	printf("%d\n", FRED);
	printf("%d, %d, %d\n", BLOGGS(1), BLOGGS(2), BLOGGS(3));

	return 0;
}
