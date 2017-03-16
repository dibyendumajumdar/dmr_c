extern int printf(const char *, ...);

static int staticint(void) {
	static int x = 1;
	return x++;
}

static const char *s = "hello world";

//static const char *staticstr(void) {
//	static const char *s2 = "hello world";
//	return s2;
//}

int main(void)
{
	int y;
	y = staticint();
	y += staticint();

	printf("y = %d, s = %s\n", y, s);
	return y == 3 ? 0 : 1;
}
