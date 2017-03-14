; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [13 x i8] c"%f %f %f %f\0A\00"

define i32 @main() {
L0:
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), double 3.140000e+00, double 1.000000e-03, double 1.000000e+02, double 0x3FF5555560000000)
  ret i32 0
}

declare i32 @printf(i8*, ...)
