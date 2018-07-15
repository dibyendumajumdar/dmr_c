static int testfunc(int i) {
	return i-6;
}

int TestNano(void) {
    int (*f) (int);
	f = &testfunc;
	if (f) {
		return f(6);
	}
	else {
		return 1;
	}
}
