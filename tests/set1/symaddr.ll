; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [10 x i8] c"value %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @print(i32* %ARG1) {
L0:
  %p_000001A56A06BE98. = alloca i32*
  %0 = alloca i32
  %p_000001A56A06BE98.1 = ptrtoint i32** %p_000001A56A06BE98. to i64
  %1 = add i64 %p_000001A56A06BE98.1, 0
  %2 = inttoptr i64 %1 to i32**
  store i32* %ARG1, i32** %2
  %p_000001A56A06BE98.2 = ptrtoint i32** %p_000001A56A06BE98. to i64
  %3 = add i64 %p_000001A56A06BE98.2, 0
  %4 = inttoptr i64 %3 to i32**
  %R2 = load i32*, i32** %4
  %R23 = ptrtoint i32* %R2 to i64
  %5 = add i64 %R23, 0
  %6 = inttoptr i64 %5 to i32*
  %R3 = load i32, i32* %6
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %R3)
  %p_000001A56A06BE98.4 = ptrtoint i32** %p_000001A56A06BE98. to i64
  %7 = add i64 %p_000001A56A06BE98.4, 0
  %8 = inttoptr i64 %7 to i32**
  %R5 = load i32*, i32** %8
  %R55 = ptrtoint i32* %R5 to i64
  %9 = add i64 %R55, 0
  %10 = inttoptr i64 %9 to i32*
  %R6 = load i32, i32* %10
  store i32 %R6, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %11 = load i32, i32* %0
  ret i32 %R6
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L2:
  %escapelist_000001A56A06C4B8. = alloca i32
  %0 = alloca i32
  store i32 -1, i32* %escapelist_000001A56A06C4B8.
  %escapelist_000001A56A06C4B8.1 = ptrtoint i32* %escapelist_000001A56A06C4B8. to i64
  %1 = add i64 %escapelist_000001A56A06C4B8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 -1, i32* %2
  %R9 = call i32 @print(i32* %escapelist_000001A56A06C4B8.)
  %R10 = icmp eq i32 %R9, -1
  %R102 = zext i1 %R10 to i32
  %cond = icmp ne i32 %R102, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %3 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
