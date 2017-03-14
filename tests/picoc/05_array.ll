; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [4 x i8] c"%d\0A\00"

define i32 @main() {
L0:
  %Array_0000026AED66B658 = alloca [10 x i32]
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
  %R6 = bitcast [10 x i32]* %Array_0000026AED66B658 to i32*
  %R8 = add i32 %2, -1
  %R9 = sext i32 %R8 to i64
  %R10 = mul i64 %R9, 4
  %3 = bitcast i32* %R6 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 %R10
  %5 = bitcast i8* %4 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = bitcast i8* %7 to i32*
  store i32 %R5, i32* %8
  %R13 = add i32 %2, 1
  store i32 %R13, i32* %0
  br label %L1

L3:                                               ; preds = %L1
  store i32 0, i32* %1
  br label %L4

L4:                                               ; preds = %L5, %L3
  %9 = load i32, i32* %1
  %R15 = icmp slt i32 %9, 10
  %R152 = zext i1 %R15 to i32
  %cond3 = icmp ne i32 %R152, 0
  br i1 %cond3, label %L5, label %L6

L5:                                               ; preds = %L4
  %R17 = bitcast [10 x i32]* %Array_0000026AED66B658 to i32*
  %R19 = sext i32 %9 to i64
  %R20 = mul i64 %R19, 4
  %10 = bitcast i32* %R17 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 %R20
  %12 = bitcast i8* %11 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 0
  %15 = bitcast i8* %14 to i32*
  %load_target = load i32, i32* %15
  %R23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %load_target)
  %R25 = add i32 %9, 1
  store i32 %R25, i32* %1
  br label %L4

L6:                                               ; preds = %L4
  ret i32 0
}

declare i32 @printf(i8*, ...)
