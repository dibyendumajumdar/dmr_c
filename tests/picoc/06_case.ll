; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"
@.str.3 = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %Count_000001A0B1B0E328. = alloca i32
  %0 = alloca i32
  %Count_000001A0B1B0E328.1 = ptrtoint i32* %Count_000001A0B1B0E328. to i64
  %1 = add i64 %Count_000001A0B1B0E328.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 0, i32* %2
  br label %L1

L1:                                               ; preds = %L7, %L0
  %Count_000001A0B1B0E328.2 = ptrtoint i32* %Count_000001A0B1B0E328. to i64
  %3 = add i64 %Count_000001A0B1B0E328.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = icmp slt i32 %R1, 4
  %R23 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R23, 0
  br i1 %cond, label %L2, label %L8

L2:                                               ; preds = %L1
  %Count_000001A0B1B0E328.4 = ptrtoint i32* %Count_000001A0B1B0E328. to i64
  %5 = add i64 %Count_000001A0B1B0E328.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R4 = load i32, i32* %6
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R4)
  %Count_000001A0B1B0E328.5 = ptrtoint i32* %Count_000001A0B1B0E328. to i64
  %7 = add i64 %Count_000001A0B1B0E328.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R6 = load i32, i32* %8
  switch i32 %R6, label %L5 [
    i32 1, label %L3
    i32 2, label %L4
  ]

L3:                                               ; preds = %L2
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 1)
  br label %L6

L4:                                               ; preds = %L2
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 2)
  br label %L6

L5:                                               ; preds = %L2
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 0)
  br label %L6

L6:                                               ; preds = %L5, %L4, %L3
  br label %L7

L7:                                               ; preds = %L6
  %Count_000001A0B1B0E328.6 = ptrtoint i32* %Count_000001A0B1B0E328. to i64
  %9 = add i64 %Count_000001A0B1B0E328.6, 0
  %10 = inttoptr i64 %9 to i32*
  %R13 = load i32, i32* %10
  %R14 = add i32 %R13, 1
  %Count_000001A0B1B0E328.7 = ptrtoint i32* %Count_000001A0B1B0E328. to i64
  %11 = add i64 %Count_000001A0B1B0E328.7, 0
  %12 = inttoptr i64 %11 to i32*
  store i32 %R14, i32* %12
  br label %L1

L8:                                               ; preds = %L1
  store i32 0, i32* %0
  br label %L9

L9:                                               ; preds = %L8
  %13 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
