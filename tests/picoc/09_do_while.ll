; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %t_000001131B4AE788. = alloca i32
  %p_000001131B4AE6A8. = alloca i32
  %a_000001131B4AE5C8. = alloca i32
  %0 = alloca i32
  %a_000001131B4AE5C8.1 = ptrtoint i32* %a_000001131B4AE5C8. to i64
  %1 = add i64 %a_000001131B4AE5C8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 1, i32* %2
  %p_000001131B4AE6A8.2 = ptrtoint i32* %p_000001131B4AE6A8. to i64
  %3 = add i64 %p_000001131B4AE6A8.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 0, i32* %4
  %t_000001131B4AE788.3 = ptrtoint i32* %t_000001131B4AE788. to i64
  %5 = add i64 %t_000001131B4AE788.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  br label %L1

L1:                                               ; preds = %L2, %L0
  %a_000001131B4AE5C8.4 = ptrtoint i32* %a_000001131B4AE5C8. to i64
  %7 = add i64 %a_000001131B4AE5C8.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R2 = load i32, i32* %8
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R2)
  %a_000001131B4AE5C8.5 = ptrtoint i32* %a_000001131B4AE5C8. to i64
  %9 = add i64 %a_000001131B4AE5C8.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R4 = load i32, i32* %10
  %t_000001131B4AE788.6 = ptrtoint i32* %t_000001131B4AE788. to i64
  %11 = add i64 %t_000001131B4AE788.6, 0
  %12 = inttoptr i64 %11 to i32*
  store i32 %R4, i32* %12
  %t_000001131B4AE788.7 = ptrtoint i32* %t_000001131B4AE788. to i64
  %13 = add i64 %t_000001131B4AE788.7, 0
  %14 = inttoptr i64 %13 to i32*
  %R5 = load i32, i32* %14
  %p_000001131B4AE6A8.8 = ptrtoint i32* %p_000001131B4AE6A8. to i64
  %15 = add i64 %p_000001131B4AE6A8.8, 0
  %16 = inttoptr i64 %15 to i32*
  %R6 = load i32, i32* %16
  %R7 = add i32 %R5, %R6
  %a_000001131B4AE5C8.9 = ptrtoint i32* %a_000001131B4AE5C8. to i64
  %17 = add i64 %a_000001131B4AE5C8.9, 0
  %18 = inttoptr i64 %17 to i32*
  store i32 %R7, i32* %18
  %t_000001131B4AE788.10 = ptrtoint i32* %t_000001131B4AE788. to i64
  %19 = add i64 %t_000001131B4AE788.10, 0
  %20 = inttoptr i64 %19 to i32*
  %R8 = load i32, i32* %20
  %p_000001131B4AE6A8.11 = ptrtoint i32* %p_000001131B4AE6A8. to i64
  %21 = add i64 %p_000001131B4AE6A8.11, 0
  %22 = inttoptr i64 %21 to i32*
  store i32 %R8, i32* %22
  br label %L2

L2:                                               ; preds = %L1
  %a_000001131B4AE5C8.12 = ptrtoint i32* %a_000001131B4AE5C8. to i64
  %23 = add i64 %a_000001131B4AE5C8.12, 0
  %24 = inttoptr i64 %23 to i32*
  %R9 = load i32, i32* %24
  %R10 = icmp slt i32 %R9, 100
  %R1013 = zext i1 %R10 to i32
  %cond = icmp ne i32 %R1013, 0
  br i1 %cond, label %L1, label %L3

L3:                                               ; preds = %L2
  store i32 0, i32* %0
  br label %L4

L4:                                               ; preds = %L3
  %25 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
