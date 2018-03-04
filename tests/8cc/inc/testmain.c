// Copyright 2012 Rui Ueyama. Released under the MIT license.

extern int printf(const char *, ...);
extern void exit(int);
extern int strcmp(const char *, const char *);
extern int strncmp(const char *, const char *, __SIZE_TYPE__ n);

#define fail(msg) ffail(__FILE__, __LINE__, msg)
#define expect(a, b) fexpect(__FILE__, __LINE__, a, b);
#define expect_string(a, b) fexpect_string(__FILE__, __LINE__, a, b);
#define expectf(a, b) fexpectf(__FILE__, __LINE__, a, b);
#define expectd(a, b) fexpectd(__FILE__, __LINE__, a, b);
#define expectl(a, b) fexpectl(__FILE__, __LINE__, a, b);

static void print(char *s) {
    printf("Testing %s ... ", s);
}

static void printfail(void) {
    printf("Failed\n");
}

static void ffail(const char *file, int line, const char *msg) {
    printfail();
    printf("%s:%d: %s\n", file, line, msg);
    exit(1);
}

static void fexpect(const char *file, int line, int a, int b) {
    if (a == b)
        return;
    printfail();
    printf("%s:%d: %d expected, but got %d\n", file, line, a, b);
    exit(1);
}

static void fexpect_string(const char *file, int line, const char *a, const char *b) {
    if (!strcmp(a, b))
        return;
    printfail();
    printf("%s:%d: \"%s\" expected, but got \"%s\"\n", file, line, a, b);
    exit(1);
}

static void fexpectf(const char *file, int line, float a, float b) {
    if (a == b)
        return;
    printfail();
    printf("%s:%d: %f expected, but got %f\n", file, line, a, b);
    exit(1);
}

static void fexpectd(const char *file, int line, double a, double b) {
    if (a == b)
        return;
    printfail();
    printf("%s:%d: %lf expected, but got %lf\n", file, line, a, b);
    exit(1);
}

static void fexpectl(const char *file, int line, long a, long b) {
    if (a == b)
        return;
    printfail();
    printf("%s:%d: %ld expected, but got %ld\n", file, line, a, b);
    exit(1);
}

extern void testmain(void);
int main(int argc, const char *argv[]) {
    testmain();
    printf("OK\n");
    return 0;
}
