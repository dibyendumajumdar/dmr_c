; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%f\0A\00"

define i32 @main() {
L0:
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), double -1.000000e+00)
  ret i32 0
}

declare i32 @printf(i8*, ...)
