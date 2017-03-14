; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [24 x i8] c"Hello world!, from %s%c\00"
@.str.1 = private constant [7 x i8] c"Sparse\00"
@.str.2 = private constant [24 x i8] c"A very long value %lld\0A\00"
@.str.3 = private constant [16 x i8] c"A int value %d\0A\00"

define i32 @main(i32 %ARG1, i8** %ARG2) {
L0:
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 10)
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i64 918181788818181)
  %R8 = add i32 %R3, %R5
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 1000000)
  %R14 = add i32 %R8, %R11
  %R18 = icmp ne i32 %R14, 80
  %R181 = zext i1 %R18 to i32
  ret i32 %R181
}

declare i32 @printf(i8*, ...)
