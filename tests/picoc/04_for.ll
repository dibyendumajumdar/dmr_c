; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"

define i32 @main() {
L0:
  %0 = alloca i32
  store i32 1, i32* %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %1 = load i32, i32* %0
  %R2 = icmp sle i32 %1, 10
  %R21 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R21, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %1)
  %R7 = add i32 %1, 1
  store i32 %R7, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  ret i32 0
}

declare i32 @printf(i8*, ...)
