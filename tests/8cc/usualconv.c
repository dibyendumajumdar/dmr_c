// Copyright 2014 Rui Ueyama. Released under the MIT license.

#include "testmain.c"
#define bool _Bool

static void test_usual_conv(void) {
    expect(1, sizeof(bool));
    expect(1, sizeof((char)0));

    expect(4, sizeof((bool)0 + (bool)0));
    expect(4, sizeof((char)0 + (char)0));
    expect(4, sizeof((char)0 + (bool)0));
    expect(4, sizeof((char)0 + (int)0));
    expect(8, sizeof((char)0 + (long long)0));
    expect(8, sizeof((char)0 + (double)0));
}

void testmain(void) {
    print("usual conversion");
    test_usual_conv();
}
