; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [11 x i8] c"including\0A\00"
@.str.1 = private constant [10 x i8] c"included\0A\00"
@.str.2 = private constant [6 x i8] c"done\0A\00"

define i32 @main() {
L0:
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0))
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0))
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
