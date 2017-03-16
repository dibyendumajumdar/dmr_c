; ModuleID = 'out.bc'
source_filename = "sparse"

@x = internal global i32 1
@"<noident>" = private global [12 x i8] c"hello world\00", align 1
@s = private global [12 x i8]* @"<noident>", align 8
@.str = private constant [16 x i8] c"y = %d, s = %s\0A\00"

define internal i32 @staticint() {
L0:
  %load_target = load i32, i32* @x
  %R2 = add i32 %load_target, 1
  store i32 %R2, i32* @x
  ret i32 %load_target
}

define i32 @main() {
L1:
  %R4 = call i32 @staticint()
  %R5 = call i32 @staticint()
  %R8 = add i32 %R4, %R5
  %load_target = load i8*, i8** bitcast ([12 x i8]** @s to i8**)
  %R13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i32 %R8, i8* %load_target)
  %R16 = icmp ne i32 %R8, 3
  %R161 = zext i1 %R16 to i32
  ret i32 %R161
}

declare i32 @printf(i8*, ...)
