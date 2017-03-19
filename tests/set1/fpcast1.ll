; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%f\0A\00"

define double @f1() {
L0:
  %0 = alloca double
  store double -1.000000e+00, double* %0
  %1 = load double, double* %0
  ret double -1.000000e+00
}

define double @f2() {
L1:
  %0 = alloca double
  store double -1.000000e+00, double* %0
  %1 = load double, double* %0
  ret double -1.000000e+00
}

define double @f3() {
L2:
  %0 = alloca double
  store double -1.000000e+00, double* %0
  %1 = load double, double* %0
  ret double -1.000000e+00
}

define i32 @main() {
L3:
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double 9.700000e+01)
  ret i32 0
}

declare i32 @printf(i8*, ...)
