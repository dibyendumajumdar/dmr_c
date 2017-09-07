static int test_do(void) {
    int a = 0;
    int count = 27;
    switch (count % 8) {
    case 0: do {  a++;
    case 7:       a++;
    case 6:       a++;
    case 5:       a++;
    case 4:       a++;
    case 3:       a++;
    case 2:       a++;
    case 1:       a++;
            } while ((count -= 8) > 0);
    }
    //if (27 != a) return a;
    //return 0;
    return a;
}

#if 0
extern int printf(const char *, ...);
int main(void)
{
	int value = test_do();
	printf("%s (%d)\n", (value == 27? "OK": "FAILED"), value);
	return value == 27 ? 0 : 1;
}
#endif

int TestNano(void)
{
	return test_do();
}