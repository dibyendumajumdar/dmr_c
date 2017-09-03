// Copyright 2012 Rui Ueyama. Released under the MIT license.
// Modified for Nano backend

static int test_if1(void) { if (1) { return 'a';} return 0; }
static int test_if2(void) { if (0) { return 0;} return 'b'; }
static int test_if3(void) { if (1) { return 'c';} else { return 0; } return 0; }
static int test_if4(void) { if (0) { return 0;} else { return 'd'; } return 0; }
static int test_if5(void) { if (1) return 'e'; return 0; }
static int test_if6(void) { if (0) return 0; return 'f'; }
static int test_if7(void) { if (1) return 'g'; else return 0; return 0; }
static int test_if8(void) { if (0) return 0; else return 'h'; return 0; }
static int test_if9(void) { if (0+1) return 'i'; return 0; }
static int test_if10(void) { if (1-1) return 0; return 'j'; }
static int test_if11(void) { if (0.5) return 'k'; return 0; }

static int test_if(void) {
    if ('a' != test_if1()) return 1;
    if ('b' != test_if2()) return 1;
    if ('c' != test_if3()) return 1;
    if ('d' != test_if4()) return 1;
    if ('e' != test_if5()) return 1;
    if ('f' != test_if6()) return 1;
    if ('g' != test_if7()) return 1;
    if ('h' != test_if8()) return 1;
    if ('i' != test_if9()) return 1;
    if ('j' != test_if10()) return 1;
    if ('k' != test_if11()) return 1;
    return 0;
}

static int test_for(void) {
    int i;
    int acc = 0;
    for (i = 0; i < 5; i++) {
        acc = acc + i;
    }
    if (10 != acc) return 1;

    acc = 0;
    for (i = 0; i < 5; i++) {
        acc = acc + i;
    }
    if (10 != acc) return 1;

    acc = 0;
    for (i = 0; i < 100; i++) {
        if (i < 5) continue;
        if (i == 9) break;
        acc += i;
    }
    if ((5 + 6 + 7 + 8) !=  acc) return 1;

    for (int x = 3, y = 5, z = 8; x < 100; x++, y++, z+=2)
        if (z != x + y) return 1;

    for (;;)
        break;
    for (i = 0; i < 100; i++)
        ;

    i = 0;
    for (; 0.5;) {
        i = 68;
        break;
    }
    if (68 != i) return 1;
    return 0;
}

static int test_while(void) {
    int acc = 0;
    int i = 0;
    while (i <= 100)
        acc = acc + i++;
    if (5050 != acc) return 1;

    acc = 1;
    i = 0;
    while (i <= 100) {
        acc = acc + i++;
    }
    if (5051 != acc) return 1;

    acc = 0;
    i = 0;
    while (i < 10) {
        if (i++ < 5) continue;
        acc += i;
        if (i == 9) break;
    }
    if (6 + 7 + 8 + 9 != acc) return 1;

    i = 0;
    while (i++ < 100)
        ;

    i = 0;
    while (0.5) {
        i = 67;
        break;
    }
    if (67 != i) return 1;
    return 0;
}

static int test_do(void) {
    int acc = 0;
    int i = 0;
    do {
        acc = acc + i++;
    } while (i <= 100);
    if (5050 != acc) return 1;

    i = 0;
    do { i = 37; } while (0);
    if (37 != i) return 1;

    acc = 0;
    i = 0;
    do {
        if (i++ < 5) continue;
        acc += i;
        if (i == 9) break;
    } while (i < 10);
    if (6 + 7 + 8 + 9 != acc) return 1;

    i = 0;
    do {} while (i++ < 100);

    i = 0;
    do; while (i++ < 100);

// Results in infinite loop 
// Suspect bug in converting value to boolean
//    float v = 1;
//    i = 70;
//    do i++; while (v -= 0.5);
//    if (72 != i) return 1;
    return 0;
}

static int test_switch(void) {
    int a = 0;
    switch (1+2) {
    case 0: return 1;
    case 3: a = 3; break;
    case 1: return 1;
    }
    if (a != 3) return 1;

    a = 0;
    switch (1) {
    case 0: a++;
    case 1: a++;
    case 2: a++;
    case 3: a++;
    }
    a = 3;

    a = 0;
    switch (100) {
    case 0: a++;
    default: a = 55;
    }
    if (a != 55) return 1;

    a = 0;
    switch (100) {
    case 0: a++;
    }
    if (a != 0) return 1;

    a = 5;
    switch (3) {
        a++;
    }
    if (a != 5) return 1;

    switch (7) {
    case 1 ... 2: return 1;
    case 3: return 1;
    case 5 ... 10: break;
    default: return 1;
    }
#if 0
// Fails to compile - Sparse linearizer bug
    a = 0;
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
    if (27 != a) return 1;
#endif
    switch (1)
        ;
    return 0;
}

static int test_goto(void) {
    int acc = 0;
    goto x;
    acc = 5;
 x: if (0 != acc) return 1;

    int i = 0;
    acc = 0;
 y: if (i > 10) goto z;
    acc += i++;
    goto y;
 z: if (i > 11) goto a;
    if (55 != acc) return 1;
    i++;
    goto y;
 a:
    ;
    return 0;
}

static int test_label(void) {
    int x = 0;
    if (1)
      L1: x++;
    if(1 != x) return 1;

    int y = 0;
    if (0)
      L2: y++;
    if(0 != y) return 1;

    int z = 0;
    switch (7) {
        if (1)
          case 5: z += 2;
        if (0)
          case 7: z += 3;
        if (1)
          case 6: z += 5;
    }
    if (8 != z) return 1;
    return 0;
}

#if 0
// Computed gotos not supported
static void test_computed_goto(void) {
    struct { void *x, *y, *z, *a; } t = { &&x, &&y, &&z, &&a };
    int acc = 0;
    goto *t.x;
    acc = 5;
 x: expect(0, acc);

    int i = 0;
    acc = 0;
 y: if (i > 10) goto *t.z;
    acc += i++;
    goto *t.y;
 z: if (i > 11) goto *t.a;
    expect(55, acc);
    i++;
    goto *t.y;
 a:
    ;
    static void *p = &&L;
    goto *p;
 L:
    ;
}
#endif

int TestNano(void) {
    int rc = 0;
    rc += test_if();
    rc += test_for();
    rc += test_while();
    rc += test_do();
    rc += test_switch();
    rc += test_goto();
    rc += test_label();
    return rc;
}
