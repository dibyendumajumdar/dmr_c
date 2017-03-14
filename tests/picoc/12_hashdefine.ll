; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [12 x i8] c"%d, %d, %d\0A\00"

define i32 @main() {
L0:
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 12)
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 12, i32 24, i32 36)
  ret i32 0
}

declare i32 @printf(i8*, ...)
