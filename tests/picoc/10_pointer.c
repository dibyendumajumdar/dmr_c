extern int printf(const char *fmt, ...);

struct ziggy
{
    int a;
    int b;
    int c;
} bolshevic;

int main(void)
{
	int a;
	int *b;
	int c;

	a = 42;
	b = &a;
	printf("a = %d\n", *b);

	bolshevic.a = 12;
	bolshevic.b = 34;
	bolshevic.c = 56;

	printf("bolshevic.a = %d\n", bolshevic.a);
	printf("bolshevic.b = %d\n", bolshevic.b);
	printf("bolshevic.c = %d\n", bolshevic.c);

	struct ziggy *tsar = &bolshevic;

	printf("tsar->a = %d\n", tsar->a);
	printf("tsar->b = %d\n", tsar->b);
	printf("tsar->c = %d\n", tsar->c);

/*
b = &(bolshevic.b);
printf("bolshevic.b = %d\n", *b);
*/

	return 0;
}
