; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"

define i32 @main() {
L0:
  %0 = alloca i32
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %1 = load i32, i32* %0
  %R2 = icmp slt i32 %1, 10
  %R21 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R21, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R6 = mul i32 %1, %1
  %R8 = mul i32 %1, 3
  %R10 = icmp slt i32 %1, 5
  %R102 = zext i1 %R10 to i32
  %cond3 = icmp ne i32 %R102, 0
  %select = select i1 %cond3, i32 %R6, i32 %R8
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %select)
  %R14 = add i32 %1, 1
  store i32 %R14, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  ret i32 0
}

declare i32 @printf(i8*, ...)
