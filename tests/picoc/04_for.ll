; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %Count_000001B349F3D638. = alloca i32
  %0 = alloca i32
  %Count_000001B349F3D638.1 = ptrtoint i32* %Count_000001B349F3D638. to i64
  %1 = add i64 %Count_000001B349F3D638.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 1, i32* %2
  br label %L1

L1:                                               ; preds = %L3, %L0
  %Count_000001B349F3D638.2 = ptrtoint i32* %Count_000001B349F3D638. to i64
  %3 = add i64 %Count_000001B349F3D638.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = icmp sle i32 %R1, 10
  %R23 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R23, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %Count_000001B349F3D638.4 = ptrtoint i32* %Count_000001B349F3D638. to i64
  %5 = add i64 %Count_000001B349F3D638.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R4 = load i32, i32* %6
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R4)
  br label %L3

L3:                                               ; preds = %L2
  %Count_000001B349F3D638.5 = ptrtoint i32* %Count_000001B349F3D638. to i64
  %7 = add i64 %Count_000001B349F3D638.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R6 = load i32, i32* %8
  %R7 = add i32 %R6, 1
  %Count_000001B349F3D638.6 = ptrtoint i32* %Count_000001B349F3D638. to i64
  %9 = add i64 %Count_000001B349F3D638.6, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 %R7, i32* %10
  br label %L1

L4:                                               ; preds = %L1
  store i32 0, i32* %0
  br label %L5

L5:                                               ; preds = %L4
  %11 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
