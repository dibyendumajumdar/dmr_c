; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [13 x i8] c"Hello world\0A\00"
@.str.1 = private constant [12 x i8] c"Count = %d\0A\00"
@.str.2 = private constant [39 x i8] c"String 'hello', 'there' is '%s', '%s'\0A\00"
@.str.3 = private constant [6 x i8] c"hello\00"
@.str.4 = private constant [6 x i8] c"there\00"
@.str.5 = private constant [23 x i8] c"Character 'A' is '%c'\0A\00"
@.str.6 = private constant [23 x i8] c"Character 'a' is '%c'\0A\00"

define i32 @main() {
L0:
  %0 = alloca i32
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  store i32 -5, i32* %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %1 = load i32, i32* %0
  %R4 = icmp sle i32 %1, 5
  %R41 = zext i1 %R4 to i32
  %cond = icmp ne i32 %R41, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 %1)
  %R9 = add i32 %1, 1
  store i32 %R9, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  %R13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0))
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i32 65)
  %R17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i64 0, i64 0), i32 97)
  ret i32 0
}

declare i32 @printf(i8*, ...)
