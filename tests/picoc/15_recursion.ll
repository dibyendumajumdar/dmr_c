; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"

define internal i32 @factorial(i32 %ARG1) {
L0:
  %0 = alloca i32
  %R2 = icmp slt i32 %ARG1, 2
  %R21 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R21, 0
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  store i32 %ARG1, i32* %0
  br label %L3

L2:                                               ; preds = %L0
  %R7 = add i32 %ARG1, -1
  %R8 = call i32 @factorial(i32 %R7)
  %R9 = mul i32 %ARG1, %R8
  store i32 %R9, i32* %0
  br label %L3

L3:                                               ; preds = %L2, %L1
  %1 = load i32, i32* %0
  ret i32 %1
}

define i32 @main() {
L4:
  %0 = alloca i32
  store i32 1, i32* %0
  br label %L5

L5:                                               ; preds = %L6, %L4
  %1 = load i32, i32* %0
  %R11 = icmp sle i32 %1, 10
  %R111 = zext i1 %R11 to i32
  %cond = icmp ne i32 %R111, 0
  br i1 %cond, label %L6, label %L7

L6:                                               ; preds = %L5
  %R14 = call i32 @factorial(i32 %1)
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R14)
  %R17 = add i32 %1, 1
  store i32 %R17, i32* %0
  br label %L5

L7:                                               ; preds = %L5
  ret i32 0
}

declare i32 @printf(i8*, ...)
