static int testfunc(int i) {
	return i-6;
}

/* initialiser does not work */
/* static int (*f) (int) = testfunc */
static int (*f) (int);

int main(int argc, const char *argv[]) {
	f = testfunc;
	if (f) {
		return f(6);
	}
	else {
		return 1;
	}
}
