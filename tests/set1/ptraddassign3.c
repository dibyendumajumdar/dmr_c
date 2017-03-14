extern int printf(const char *, ...);

int main(void)
{
	char buf[5];

	char *p = &buf[4];
	p--;

	return p != &buf[3] ? 1 : 0;
}