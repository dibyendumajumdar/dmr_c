; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"
@.str.3 = private constant [4 x i8] c"%d\0A\00"
@.str.4 = private constant [4 x i8] c"%d\0A\00"
@.str.5 = private constant [4 x i8] c"%d\0A\00"
@.str.6 = private constant [4 x i8] c"%d\0A\00"
@.str.7 = private constant [8 x i8] c"test \07\0A\00"

define i32 @main() {
L0:
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 1)
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 8)
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 64)
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 1)
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 14)
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 16)
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), i32 64)
  %R16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
