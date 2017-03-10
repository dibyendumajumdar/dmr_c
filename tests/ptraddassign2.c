/* Purpose of this test is to verify that 
   pointer arithmetic is handled correctly. */

static int *incr(int *p) {
	int *tmp = p;
	tmp += 4;
	return tmp;
}

int main(int argc, const char *argv[]) {
	int values[5];
	values[0] = 9;
	values[1] = 8;
	values[2] = 7;
	values[3] = 6;
	values[4] = 5;
	int *p = incr((int *)values);
	return (*p == 5) ? 0 : 1;
//	if (*p == 5) 
//		return 0;
//	else
//		return 1;
}
