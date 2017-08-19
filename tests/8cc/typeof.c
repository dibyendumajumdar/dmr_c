// Copyright 2012 Rui Ueyama. Released under the MIT license.

#include "testmain.c"

static void test_basic(void) {
    typeof(int) a = 5;
    expect(5, a);
    typeof(a) b = 6;
    expect(6, b);
}

static void test_array(void) {
    char *a = "abc"; // was char[] but that doesn't work yet
    typeof(a) b = "de";
    expect_string("de", b);
    expect(8, sizeof(b)); // was 4

    typeof(typeof (char *)[4]) y;
    expect(4, sizeof(y) / sizeof(*y));

    typedef typeof(a[0]) CHAR;
    CHAR z = 'z';
    expect('z', z);
}

static void test_alt(void) {
    __typeof__(int) a = 10;
    expect(10, a);
}

void testmain(void) {
    print("typeof");
    test_basic();
    test_array();
    test_alt();
}
