; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"
@.str.3 = private constant [4 x i8] c"%d\0A\00"
@.str.4 = private constant [4 x i8] c"%d\0A\00"
@.str.5 = private constant [4 x i8] c"%d\0A\00"

define i32 @main() {
L0:
  %b_0000022AF6F7DD28 = alloca i32
  %a_0000022AF6F7DC48 = alloca i32
  %0 = ptrtoint i32* %a_0000022AF6F7DC48 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 12, i32* %2
  %3 = ptrtoint i32* %b_0000022AF6F7DD28 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i32*
  store i32 34, i32* %5
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 12)
  %6 = ptrtoint i32* %b_0000022AF6F7DD28 to i64
  %7 = add i64 %6, 0
  %8 = inttoptr i64 %7 to i32*
  %load_target = load i32, i32* %8
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %load_target)
  %9 = ptrtoint i32* %a_0000022AF6F7DC48 to i64
  %10 = ptrtoint i32* %b_0000022AF6F7DD28 to i64
  %R14 = icmp eq i64 %9, %10
  %R141 = zext i1 %R14 to i32
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %R141)
  %11 = ptrtoint i32* %a_0000022AF6F7DC48 to i64
  %12 = ptrtoint i32* %b_0000022AF6F7DD28 to i64
  %R19 = icmp ne i64 %11, %12
  %R192 = zext i1 %R19 to i32
  %R20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %R192)
  %R26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i32 1)
  %R31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 0)
  ret i32 0
}

declare i32 @printf(i8*, ...)
