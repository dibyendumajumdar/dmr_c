extern int printf(const char *, ...);

static void variadic(int argc, ...);

static void variadic(int argc, ...)
{	
	printf("argc %d\n", argc);	
}


int main(void) 
{
	variadic(1, 2, 3);
	return 0;
}
