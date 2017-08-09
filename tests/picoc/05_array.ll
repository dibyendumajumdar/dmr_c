; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %Array_0000027C04AFBF58. = alloca [10 x i32]
  %Count_0000027C04AFBE78. = alloca i32
  %0 = alloca i32
  %Count_0000027C04AFBE78.1 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %1 = add i64 %Count_0000027C04AFBE78.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 1, i32* %2
  br label %L1

L1:                                               ; preds = %L3, %L0
  %Count_0000027C04AFBE78.2 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %3 = add i64 %Count_0000027C04AFBE78.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = icmp sle i32 %R1, 10
  %R23 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R23, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %Count_0000027C04AFBE78.4 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %5 = add i64 %Count_0000027C04AFBE78.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R3 = load i32, i32* %6
  %Count_0000027C04AFBE78.5 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %7 = add i64 %Count_0000027C04AFBE78.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R4 = load i32, i32* %8
  %R5 = mul i32 %R3, %R4
  %R6 = bitcast [10 x i32]* %Array_0000027C04AFBF58. to i32*
  %Count_0000027C04AFBE78.6 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %9 = add i64 %Count_0000027C04AFBE78.6, 0
  %10 = inttoptr i64 %9 to i32*
  %R7 = load i32, i32* %10
  %R8 = sub i32 %R7, 1
  %R9 = sext i32 %R8 to i64
  %R10 = mul i64 %R9, 4
  %R67 = ptrtoint i32* %R6 to i64
  %R11 = add i64 %R67, %R10
  %R118 = inttoptr i64 %R11 to i32*
  %R1189 = ptrtoint i32* %R118 to i64
  %11 = add i64 %R1189, 0
  %12 = inttoptr i64 %11 to i32*
  store i32 %R5, i32* %12
  br label %L3

L3:                                               ; preds = %L2
  %Count_0000027C04AFBE78.10 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %13 = add i64 %Count_0000027C04AFBE78.10, 0
  %14 = inttoptr i64 %13 to i32*
  %R12 = load i32, i32* %14
  %R13 = add i32 %R12, 1
  %Count_0000027C04AFBE78.11 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %15 = add i64 %Count_0000027C04AFBE78.11, 0
  %16 = inttoptr i64 %15 to i32*
  store i32 %R13, i32* %16
  br label %L1

L4:                                               ; preds = %L1
  %Count_0000027C04AFBE78.12 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %17 = add i64 %Count_0000027C04AFBE78.12, 0
  %18 = inttoptr i64 %17 to i32*
  store i32 0, i32* %18
  br label %L5

L5:                                               ; preds = %L7, %L4
  %Count_0000027C04AFBE78.13 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %19 = add i64 %Count_0000027C04AFBE78.13, 0
  %20 = inttoptr i64 %19 to i32*
  %R14 = load i32, i32* %20
  %R15 = icmp slt i32 %R14, 10
  %R1514 = zext i1 %R15 to i32
  %cond15 = icmp ne i32 %R1514, 0
  br i1 %cond15, label %L6, label %L8

L6:                                               ; preds = %L5
  %R17 = bitcast [10 x i32]* %Array_0000027C04AFBF58. to i32*
  %Count_0000027C04AFBE78.16 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %21 = add i64 %Count_0000027C04AFBE78.16, 0
  %22 = inttoptr i64 %21 to i32*
  %R18 = load i32, i32* %22
  %R19 = sext i32 %R18 to i64
  %R20 = mul i64 %R19, 4
  %R1717 = ptrtoint i32* %R17 to i64
  %R21 = add i64 %R1717, %R20
  %R2118 = inttoptr i64 %R21 to i32*
  %R211819 = ptrtoint i32* %R2118 to i64
  %23 = add i64 %R211819, 0
  %24 = inttoptr i64 %23 to i32*
  %R22 = load i32, i32* %24
  %R2320 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R22)
  br label %L7

L7:                                               ; preds = %L6
  %Count_0000027C04AFBE78.21 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %25 = add i64 %Count_0000027C04AFBE78.21, 0
  %26 = inttoptr i64 %25 to i32*
  %R24 = load i32, i32* %26
  %R25 = add i32 %R24, 1
  %Count_0000027C04AFBE78.22 = ptrtoint i32* %Count_0000027C04AFBE78. to i64
  %27 = add i64 %Count_0000027C04AFBE78.22, 0
  %28 = inttoptr i64 %27 to i32*
  store i32 %R25, i32* %28
  br label %L5

L8:                                               ; preds = %L5
  store i32 0, i32* %0
  br label %L9

L9:                                               ; preds = %L8
  %29 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
