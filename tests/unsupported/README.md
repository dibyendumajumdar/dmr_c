Unsupported features include:

* complex intializers on static or global variables.
* assignments involving aggregate types; you cannot assign structs or unions by value.
* assignments to char[] doesn't work as it is treated as aggregate assignment.
* va_arg mechanism is not supported

## Illustrations

chararray.c - this contains a static char[] array declaration with initializer.
stdarg.c - example of va_arg that is not supported
