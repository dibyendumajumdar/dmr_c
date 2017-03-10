/* Purpose of this test is to verify that 
   pointer arithmetic is handled correctly. */

static char *incr(char *p) {
	char *tmp = p;
	tmp += 5;
	return tmp;
}

int main(int argc, const char *argv[]) {
	char *text =  "abcde";
	char *p = incr(text);
	return (*p == 'e') ? 0 : 1;
}
