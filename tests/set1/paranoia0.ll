; ModuleID = 'out.bc'
source_filename = "sparse"

@Half = private global double 5.000000e-01, align 8
@One = private global double 1.000000e+00, align 8
@Two = private global double 2.000000e+00, align 8
@.str = private constant [4 x i8] c"%f\0A\00"

define i32 @main() {
L0:
  store double 1.000000e+00, double* @One
  store double 2.000000e+00, double* @Two
  store double 5.000000e-01, double* @Half
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double 5.000000e-01)
  %load_target = load double, double* @Half
  %R13 = fcmp une double %load_target, 5.000000e-01
  %R131 = zext i1 %R13 to i32
  ret i32 %R131
}

declare i32 @printf(i8*, ...)
