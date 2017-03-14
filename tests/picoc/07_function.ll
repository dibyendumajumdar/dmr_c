; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [6 x i8] c"a=%d\0A\00"
@.str.1 = private constant [9 x i8] c"qfunc()\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"
@.str.3 = private constant [4 x i8] c"%d\0A\00"

define internal i32 @myfunc(i32 %ARG1) {
L0:
  %R3 = mul i32 %ARG1, %ARG1
  ret i32 %R3
}

define internal void @vfunc(i32 %ARG1) {
L1:
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i32 %ARG1)
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @qfunc() {
L2:
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0))
  ret void
}

define i32 @main() {
L3:
  %R11 = call i32 @myfunc(i32 3)
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %R11)
  %R14 = call i32 @myfunc(i32 4)
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %R14)
  call void @vfunc(i32 1234)
  call void @qfunc()
  ret i32 0
}
