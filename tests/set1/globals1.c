static int once;

static int once = 1;

extern int printf(const char *, ...);

static int value(int *p)
{
	return *p;
}

int main(void)
{
	return value(&once)	== 1 ? 0 : 1;
}
