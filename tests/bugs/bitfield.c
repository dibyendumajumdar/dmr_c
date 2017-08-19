extern int printf(const char *s, ...);

int main(void) {
	struct { char a:4; char b:4; } x = { 2, 4 };
	printf("a=%d b=%d\n", (int)x.a, (int)x.b);
	return 0;
}