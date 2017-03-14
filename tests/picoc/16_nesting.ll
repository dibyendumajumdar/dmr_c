; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [10 x i8] c"%d %d %d\0A\00"

define i32 @main() {
L0:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L8, %L0
  %3 = load i32, i32* %0
  %R2 = icmp slt i32 %3, 2
  %R21 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R21, 0
  br i1 %cond, label %L2, label %L9

L2:                                               ; preds = %L1
  store i32 0, i32* %1
  br label %L3

L3:                                               ; preds = %L7, %L2
  %4 = load i32, i32* %1
  %R4 = icmp slt i32 %4, 3
  %R42 = zext i1 %R4 to i32
  %cond3 = icmp ne i32 %R42, 0
  br i1 %cond3, label %L4, label %L8

L4:                                               ; preds = %L3
  store i32 0, i32* %2
  br label %L5

L5:                                               ; preds = %L6, %L4
  %5 = load i32, i32* %2
  %R6 = icmp slt i32 %5, 3
  %R64 = zext i1 %R6 to i32
  %cond5 = icmp ne i32 %R64, 0
  br i1 %cond5, label %L6, label %L7

L6:                                               ; preds = %L5
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %3, i32 %4, i32 %5)
  %R13 = add i32 %5, 1
  store i32 %R13, i32* %2
  br label %L5

L7:                                               ; preds = %L5
  %R15 = add i32 %4, 1
  store i32 %R15, i32* %1
  br label %L3

L8:                                               ; preds = %L3
  %R17 = add i32 %3, 1
  store i32 %R17, i32* %0
  br label %L1

L9:                                               ; preds = %L1
  ret i32 0
}

declare i32 @printf(i8*, ...)
