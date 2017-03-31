#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>

void error_message(const char *fmt, ...) {
	va_list argp;
	va_start(argp, fmt);
	vfprintf(stdout, fmt, argp);
	va_end(argp);
}

int main(void)
{
	error_message("%s\n", "hello world");
	return 0;
}

