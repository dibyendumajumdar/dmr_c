; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [7 x i8] c"yo %d\0A\00"
@f = private global i32 (i32)* null, align 8
@.str.1 = private constant [4 x i8] c"%d\0A\00"

define internal i32 @fred(i32 %ARG1) {
L0:
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 %ARG1)
  ret i32 42
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L1:
  store i32 (i32)* @fred, i32 (i32)** @f
  %R8 = call i32 @fred(i32 24)
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %R8)
  ret i32 0
}
