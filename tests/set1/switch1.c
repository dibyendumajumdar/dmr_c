extern int printf(const char *, ...);

int main(int argc, const char *argv[])
{
	const char *cp = argv[0];
	switch (*cp) {
	case 's':
		printf("%c\n", *cp);
		break;
	default:
		if (*cp) 
			printf("%c\n", *cp);
		break;	
	}
	return 0;
}