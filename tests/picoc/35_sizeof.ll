; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [7 x i8] c"%d %d\0A\00"
@.str.1 = private constant [7 x i8] c"%d %d\0A\00"

define i32 @main() {
L0:
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 1, i32 1)
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 2, i32 2)
  ret i32 0
}

declare i32 @printf(i8*, ...)
