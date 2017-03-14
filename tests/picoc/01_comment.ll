; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [7 x i8] c"Hello\0A\00"
@.str.1 = private constant [7 x i8] c"Hello\0A\00"
@.str.2 = private constant [7 x i8] c"Hello\0A\00"
@.str.3 = private constant [7 x i8] c"Hello\0A\00"
@.str.4 = private constant [7 x i8] c"Hello\0A\00"

define i32 @main() {
L0:
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0))
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0))
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0))
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0))
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
