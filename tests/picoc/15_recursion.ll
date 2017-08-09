; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @factorial(i32 %ARG1) {
L0:
  %i_0000025AD968BD68. = alloca i32
  %0 = alloca i32
  %i_0000025AD968BD68.1 = ptrtoint i32* %i_0000025AD968BD68. to i64
  %1 = add i64 %i_0000025AD968BD68.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %i_0000025AD968BD68.2 = ptrtoint i32* %i_0000025AD968BD68. to i64
  %3 = add i64 %i_0000025AD968BD68.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = icmp slt i32 %R1, 2
  %R23 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R23, 0
  br i1 %cond, label %L1, label %L2

L1:                                               ; preds = %L0
  %i_0000025AD968BD68.4 = ptrtoint i32* %i_0000025AD968BD68. to i64
  %5 = add i64 %i_0000025AD968BD68.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R3 = load i32, i32* %6
  store i32 %R3, i32* %0
  br label %L3

L2:                                               ; preds = %L0
  %i_0000025AD968BD68.5 = ptrtoint i32* %i_0000025AD968BD68. to i64
  %7 = add i64 %i_0000025AD968BD68.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R5 = load i32, i32* %8
  %i_0000025AD968BD68.6 = ptrtoint i32* %i_0000025AD968BD68. to i64
  %9 = add i64 %i_0000025AD968BD68.6, 0
  %10 = inttoptr i64 %9 to i32*
  %R6 = load i32, i32* %10
  %R7 = sub i32 %R6, 1
  %R8 = call i32 @factorial(i32 %R7)
  %R9 = mul i32 %R5, %R8
  store i32 %R9, i32* %0
  br label %L3

L3:                                               ; preds = %L2, %L1
  %11 = load i32, i32* %0
  ret i32 %11
}

define i32 @main() {
L4:
  %Count_0000025AD968C2A8. = alloca i32
  %0 = alloca i32
  %Count_0000025AD968C2A8.1 = ptrtoint i32* %Count_0000025AD968C2A8. to i64
  %1 = add i64 %Count_0000025AD968C2A8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 1, i32* %2
  br label %L5

L5:                                               ; preds = %L7, %L4
  %Count_0000025AD968C2A8.2 = ptrtoint i32* %Count_0000025AD968C2A8. to i64
  %3 = add i64 %Count_0000025AD968C2A8.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R10 = load i32, i32* %4
  %R11 = icmp sle i32 %R10, 10
  %R113 = zext i1 %R11 to i32
  %cond = icmp ne i32 %R113, 0
  br i1 %cond, label %L6, label %L8

L6:                                               ; preds = %L5
  %Count_0000025AD968C2A8.4 = ptrtoint i32* %Count_0000025AD968C2A8. to i64
  %5 = add i64 %Count_0000025AD968C2A8.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R13 = load i32, i32* %6
  %R14 = call i32 @factorial(i32 %R13)
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R14)
  br label %L7

L7:                                               ; preds = %L6
  %Count_0000025AD968C2A8.5 = ptrtoint i32* %Count_0000025AD968C2A8. to i64
  %7 = add i64 %Count_0000025AD968C2A8.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R16 = load i32, i32* %8
  %R17 = add i32 %R16, 1
  %Count_0000025AD968C2A8.6 = ptrtoint i32* %Count_0000025AD968C2A8. to i64
  %9 = add i64 %Count_0000025AD968C2A8.6, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 %R17, i32* %10
  br label %L5

L8:                                               ; preds = %L5
  store i32 0, i32* %0
  br label %L9

L9:                                               ; preds = %L8
  %11 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
