; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [11 x i8] c"a is true\0A\00"
@.str.1 = private constant [12 x i8] c"b is false\0A\00"

define i32 @main() {
L0:
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0))
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
