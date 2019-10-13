// Copyright 2012 Rui Ueyama. Released under the MIT license.
// Modified for Nano backend

static int test_do(void) {
    int i = 0;
    float v = 1;
    i = 70;
    do i++; while (v -= 0.5);
    if (72 != i) return 1;
    return 0;
}

//int TestNano(void) {
//    int rc = 0;
//    rc += test_do();
//    return rc;
//}
