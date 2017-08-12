rm mandelbrot.got tutorial.posix64.c bf_dynasm 
../minilua ./dynasm.lua -o tutorial.posix64.c -D X64 bf_dynasm.c
gcc -o bf_dynasm tutorial.posix64.c
./bf_dynasm mandelbrot.bf > mandelbrot.got
diff mandelbrot.expect mandelbrot.got
