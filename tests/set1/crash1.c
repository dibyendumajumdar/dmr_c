extern int printf(const char *, ...);

static char *randomletters = "agqwewbxklpfgytuorz";

int main(void)
{
	int i;
	for (i = 0; i < 20; i++) {
		int key;
		key = randomletters[i];
		printf("Inserting %d\n", key);
	}
	return 0;
}

