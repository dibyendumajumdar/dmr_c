#include <nanojitextra.h>

#include <stdio.h>
#include <stdbool.h>

extern bool dmrC_nanocompile(int argc, char **argv, NJXContextRef module, const char *inputbuffer);

static int test1(int argc, char **argv) {
    const char *code =
        "long long sumq(long long len, long long *array) "
        "{"
        "long long n = 0;"
        "int i = 0; "
        "for (i = 0; i < len; i++) "
        "n += array[i]; "
        "return n; "
        "}";
    NJXContextRef module = NJX_create_context(true);

    int rc = 0;
    if (!dmrC_nanocompile(argc, argv, module, code))
        rc = 1;
    long long (*fp)(long long, long long*) = NULL;
    if (rc == 0) {
        fp = NJX_get_function_by_name(module, "sumq");
        if (!fp)
            rc = 1;
    }
    if (rc == 0 && fp) {
        long long data[5] = { 100, 200, 300, 400, 500 };
        long long result = fp(5, data);
        if (result != (100 + 200 + 300 + 400 + 500))
            rc = 1;
    }
    NJX_destroy_context(module);
    return rc;
}


int main(int argc, char **argv)
{
    int rc = 0;
    rc += test1(argc, argv);
	return rc;
}
