; ModuleID = 'out.bc'
source_filename = "dmrC"

@x_000001EBF027E288. = internal global i32 1
@"<noident>" = private global [12 x i8] c"hello world\00", align 1
@s = private global [12 x i8]* @"<noident>", align 8
@.str = private constant [16 x i8] c"y = %d, s = %s\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @staticint() {
L0:
  %0 = alloca i32
  %R1 = load i32, i32* @x_000001EBF027E288.
  %R2 = add i32 %R1, 1
  store i32 %R2, i32* @x_000001EBF027E288.
  store i32 %R1, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %1 = load i32, i32* %0
  ret i32 %R1
}

define i32 @main() {
L2:
  %y_000001EBF027E8A8. = alloca i32
  %0 = alloca i32
  %R4 = call i32 @staticint()
  %y_000001EBF027E8A8.1 = ptrtoint i32* %y_000001EBF027E8A8. to i64
  %1 = add i64 %y_000001EBF027E8A8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %R4, i32* %2
  %R5 = call i32 @staticint()
  %y_000001EBF027E8A8.2 = ptrtoint i32* %y_000001EBF027E8A8. to i64
  %3 = add i64 %y_000001EBF027E8A8.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R6 = load i32, i32* %4
  %R8 = add i32 %R6, %R5
  %y_000001EBF027E8A8.3 = ptrtoint i32* %y_000001EBF027E8A8. to i64
  %5 = add i64 %y_000001EBF027E8A8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 %R8, i32* %6
  %y_000001EBF027E8A8.4 = ptrtoint i32* %y_000001EBF027E8A8. to i64
  %7 = add i64 %y_000001EBF027E8A8.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R11 = load i32, i32* %8
  %R12 = load i8*, i8** bitcast ([12 x i8]** @s to i8**)
  %R13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i32 %R11, i8* %R12)
  %y_000001EBF027E8A8.5 = ptrtoint i32* %y_000001EBF027E8A8. to i64
  %9 = add i64 %y_000001EBF027E8A8.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R14 = load i32, i32* %10
  %R15 = icmp eq i32 %R14, 3
  %R156 = zext i1 %R15 to i32
  %cond = icmp ne i32 %R156, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %11 = load i32, i32* %0
  ret i32 %select
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
