// Copyright 2012 Rui Ueyama. Released under the MIT license.

#include "inc/testmain.c"

static void test_or(void) {
    expect(3, 1 | 2);
    expect(7, 2 | 5);
    expect(7, 2 | 7);
}

static void test_and(void) {
    expect(0, 1 & 2);
    expect(2, 2 & 7);
}

static void test_not(void) {
    expect(-1, ~0);
    expect(-3, ~2);
    expect(0, ~-1);
}

static void test_xor(void) {
    expect(10, 15 ^ 5);
}

static void test_shift(void) {
    expect(16, 1 << 4);
    expect(48, 3 << 4);

    expect(1, 15 >> 3);
    expect(2, 8 >> 2);

    expect(1, ((unsigned)-1) >> 31);
}

void testmain(void) {
    print("bitwise operators");
    test_or();
    test_and();
    test_not();
    test_xor();
    test_shift();
}
