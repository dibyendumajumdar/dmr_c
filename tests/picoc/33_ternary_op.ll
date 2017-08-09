; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %Count_000001418CA5C248. = alloca i32
  %0 = alloca i32
  %Count_000001418CA5C248.1 = ptrtoint i32* %Count_000001418CA5C248. to i64
  %1 = add i64 %Count_000001418CA5C248.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 0, i32* %2
  br label %L1

L1:                                               ; preds = %L3, %L0
  %Count_000001418CA5C248.2 = ptrtoint i32* %Count_000001418CA5C248. to i64
  %3 = add i64 %Count_000001418CA5C248.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = icmp slt i32 %R1, 10
  %R23 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R23, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %Count_000001418CA5C248.4 = ptrtoint i32* %Count_000001418CA5C248. to i64
  %5 = add i64 %Count_000001418CA5C248.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R4 = load i32, i32* %6
  %Count_000001418CA5C248.5 = ptrtoint i32* %Count_000001418CA5C248. to i64
  %7 = add i64 %Count_000001418CA5C248.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R5 = load i32, i32* %8
  %R6 = mul i32 %R4, %R5
  %Count_000001418CA5C248.6 = ptrtoint i32* %Count_000001418CA5C248. to i64
  %9 = add i64 %Count_000001418CA5C248.6, 0
  %10 = inttoptr i64 %9 to i32*
  %R7 = load i32, i32* %10
  %R8 = mul i32 %R7, 3
  %Count_000001418CA5C248.7 = ptrtoint i32* %Count_000001418CA5C248. to i64
  %11 = add i64 %Count_000001418CA5C248.7, 0
  %12 = inttoptr i64 %11 to i32*
  %R9 = load i32, i32* %12
  %R10 = icmp slt i32 %R9, 5
  %R108 = zext i1 %R10 to i32
  %cond9 = icmp ne i32 %R108, 0
  %select = select i1 %cond9, i32 %R6, i32 %R8
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %select)
  br label %L3

L3:                                               ; preds = %L2
  %Count_000001418CA5C248.10 = ptrtoint i32* %Count_000001418CA5C248. to i64
  %13 = add i64 %Count_000001418CA5C248.10, 0
  %14 = inttoptr i64 %13 to i32*
  %R13 = load i32, i32* %14
  %R14 = add i32 %R13, 1
  %Count_000001418CA5C248.11 = ptrtoint i32* %Count_000001418CA5C248. to i64
  %15 = add i64 %Count_000001418CA5C248.11, 0
  %16 = inttoptr i64 %15 to i32*
  store i32 %R14, i32* %16
  br label %L1

L4:                                               ; preds = %L1
  store i32 0, i32* %0
  br label %L5

L5:                                               ; preds = %L4
  %17 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
