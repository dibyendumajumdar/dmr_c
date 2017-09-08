struct S {
    int a;
    int count;
};
static int test_do(void) {
    struct S s;
    s.a = 0;
    s.count = 27;
    switch (s.count % 8) {
    case 0: do {  s.a++;
    case 7:       s.a++;
    case 6:       s.a++;
    case 5:       s.a++;
    case 4:       s.a++;
    case 3:       s.a++;
    case 2:       s.a++;
    case 1:       s.a++;
            } while ((s.count -= 8) > 0);
    }
    return s.a;
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
	int rc = test_do();
    return rc == 27 ? 0 : rc;
}