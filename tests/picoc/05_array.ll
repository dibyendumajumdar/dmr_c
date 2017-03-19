; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"

define i32 @main() {
L0:
  %Array_000001F2D24FD248 = alloca [10 x i32]
  %0 = alloca i32
  %1 = alloca i32
  store i32 1, i32* %0
  br label %L1

L1:                                               ; preds = %L2, %L0
  %2 = load i32, i32* %0
  %R2 = icmp sle i32 %2, 10
  %R21 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R21, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %R5 = mul i32 %2, %2
  %R6 = bitcast [10 x i32]* %Array_000001F2D24FD248 to i32*
  %R8 = add i32 %2, -1
  %R9 = sext i32 %R8 to i64
  %R10 = mul i64 %R9, 4
  %3 = ptrtoint i32* %R6 to i64
  %R11 = add i64 %3, %R10
  %4 = inttoptr i64 %R11 to i32*
  %5 = ptrtoint i32* %4 to i64
  %6 = add i64 %5, 0
  %7 = inttoptr i64 %6 to i32*
  store i32 %R5, i32* %7
  %R13 = add i32 %2, 1
  store i32 %R13, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  store i32 0, i32* %1
  br label %L4

L4:                                               ; preds = %L5, %L3
  %8 = load i32, i32* %1
  %R15 = icmp slt i32 %8, 10
  %R152 = zext i1 %R15 to i32
  %cond3 = icmp ne i32 %R152, 0
  br i1 %cond3, label %L5, label %L6

L5:                                               ; preds = %L4
  %R17 = bitcast [10 x i32]* %Array_000001F2D24FD248 to i32*
  %R19 = sext i32 %8 to i64
  %R20 = mul i64 %R19, 4
  %9 = ptrtoint i32* %R17 to i64
  %R214 = add i64 %9, %R20
  %10 = inttoptr i64 %R214 to i32*
  %11 = ptrtoint i32* %10 to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to i32*
  %load_target = load i32, i32* %13
  %R23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %load_target)
  %R25 = add i32 %8, 1
  store i32 %R25, i32* %1
  br label %L4

L6:                                               ; preds = %L4
  ret i32 0
}

declare i32 @printf(i8*, ...)
