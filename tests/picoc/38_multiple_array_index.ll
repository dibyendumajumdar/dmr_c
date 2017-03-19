; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [7 x i8] c"x=%d: \00"
@.str.1 = private constant [4 x i8] c"%d \00"
@.str.2 = private constant [2 x i8] c"\0A\00"

define i32 @main() {
L0:
  %a_00000229C315BDA8 = alloca [4 x [4 x i32]]
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  %4 = alloca i32
  store i32 0, i32* %2
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L5, %L0
  %5 = load i32, i32* %0
  %R2 = icmp slt i32 %5, 4
  %R21 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R21, 0
  br i1 %cond, label %L2, label %L6

L2:                                               ; preds = %L1
  store i32 0, i32* %1
  br label %L3

L3:                                               ; preds = %L4, %L2
  %6 = load i32, i32* %1
  %R4 = icmp slt i32 %6, 4
  %R42 = zext i1 %R4 to i32
  %cond3 = icmp ne i32 %R42, 0
  br i1 %cond3, label %L4, label %L5

L4:                                               ; preds = %L3
  %7 = load i32, i32* %2
  %R6 = add i32 %7, 1
  %R8 = bitcast [4 x [4 x i32]]* %a_00000229C315BDA8 to [4 x i32]*
  %R10 = sext i32 %5 to i64
  %R11 = mul i64 %R10, 16
  %8 = ptrtoint [4 x i32]* %R8 to i64
  %R12 = add i64 %8, %R11
  %9 = inttoptr i64 %R12 to i32*
  %R14 = sext i32 %6 to i64
  %R15 = mul i64 %R14, 4
  %10 = ptrtoint i32* %9 to i64
  %R16 = add i64 %10, %R15
  %11 = inttoptr i64 %R16 to i32*
  %12 = ptrtoint i32* %11 to i64
  %13 = add i64 %12, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 %R6, i32* %14
  store i32 %R6, i32* %2
  %R18 = add i32 %6, 1
  store i32 %R18, i32* %1
  br label %L3

L5:                                               ; preds = %L3
  %R20 = add i32 %5, 1
  store i32 %R20, i32* %0
  br label %L1

L6:                                               ; preds = %L1
  store i32 0, i32* %3
  br label %L7

L7:                                               ; preds = %L11, %L6
  %15 = load i32, i32* %3
  %R22 = icmp slt i32 %15, 4
  %R224 = zext i1 %R22 to i32
  %cond5 = icmp ne i32 %R224, 0
  br i1 %cond5, label %L8, label %L12

L8:                                               ; preds = %L7
  %R25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 %15)
  store i32 0, i32* %4
  br label %L9

L9:                                               ; preds = %L10, %L8
  %16 = load i32, i32* %4
  %R27 = icmp slt i32 %16, 4
  %R276 = zext i1 %R27 to i32
  %cond7 = icmp ne i32 %R276, 0
  br i1 %cond7, label %L10, label %L11

L10:                                              ; preds = %L9
  %R29 = bitcast [4 x [4 x i32]]* %a_00000229C315BDA8 to [4 x i32]*
  %R31 = sext i32 %15 to i64
  %R32 = mul i64 %R31, 16
  %17 = ptrtoint [4 x i32]* %R29 to i64
  %R33 = add i64 %17, %R32
  %18 = inttoptr i64 %R33 to i32*
  %R35 = sext i32 %16 to i64
  %R36 = mul i64 %R35, 4
  %19 = ptrtoint i32* %18 to i64
  %R37 = add i64 %19, %R36
  %20 = inttoptr i64 %R37 to i32*
  %21 = ptrtoint i32* %20 to i64
  %22 = add i64 %21, 0
  %23 = inttoptr i64 %22 to i32*
  %load_target = load i32, i32* %23
  %R39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %load_target)
  %R41 = add i32 %16, 1
  store i32 %R41, i32* %4
  br label %L9

L11:                                              ; preds = %L9
  %R43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  %R45 = add i32 %15, 1
  store i32 %R45, i32* %3
  br label %L7

L12:                                              ; preds = %L7
  ret i32 0
}

declare i32 @printf(i8*, ...)
