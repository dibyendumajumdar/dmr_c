; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %t_0000019D2B0FE4E8. = alloca i32
  %p_0000019D2B0FE408. = alloca i32
  %a_0000019D2B0FE328. = alloca i32
  %0 = alloca i32
  %a_0000019D2B0FE328.1 = ptrtoint i32* %a_0000019D2B0FE328. to i64
  %1 = add i64 %a_0000019D2B0FE328.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 1, i32* %2
  %p_0000019D2B0FE408.2 = ptrtoint i32* %p_0000019D2B0FE408. to i64
  %3 = add i64 %p_0000019D2B0FE408.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 0, i32* %4
  %t_0000019D2B0FE4E8.3 = ptrtoint i32* %t_0000019D2B0FE4E8. to i64
  %5 = add i64 %t_0000019D2B0FE4E8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  br label %L1

L1:                                               ; preds = %L3, %L0
  %a_0000019D2B0FE328.4 = ptrtoint i32* %a_0000019D2B0FE328. to i64
  %7 = add i64 %a_0000019D2B0FE328.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R1 = load i32, i32* %8
  %R2 = icmp slt i32 %R1, 100
  %R25 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R25, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %a_0000019D2B0FE328.6 = ptrtoint i32* %a_0000019D2B0FE328. to i64
  %9 = add i64 %a_0000019D2B0FE328.6, 0
  %10 = inttoptr i64 %9 to i32*
  %R4 = load i32, i32* %10
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R4)
  %a_0000019D2B0FE328.7 = ptrtoint i32* %a_0000019D2B0FE328. to i64
  %11 = add i64 %a_0000019D2B0FE328.7, 0
  %12 = inttoptr i64 %11 to i32*
  %R6 = load i32, i32* %12
  %t_0000019D2B0FE4E8.8 = ptrtoint i32* %t_0000019D2B0FE4E8. to i64
  %13 = add i64 %t_0000019D2B0FE4E8.8, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 %R6, i32* %14
  %t_0000019D2B0FE4E8.9 = ptrtoint i32* %t_0000019D2B0FE4E8. to i64
  %15 = add i64 %t_0000019D2B0FE4E8.9, 0
  %16 = inttoptr i64 %15 to i32*
  %R7 = load i32, i32* %16
  %p_0000019D2B0FE408.10 = ptrtoint i32* %p_0000019D2B0FE408. to i64
  %17 = add i64 %p_0000019D2B0FE408.10, 0
  %18 = inttoptr i64 %17 to i32*
  %R8 = load i32, i32* %18
  %R9 = add i32 %R7, %R8
  %a_0000019D2B0FE328.11 = ptrtoint i32* %a_0000019D2B0FE328. to i64
  %19 = add i64 %a_0000019D2B0FE328.11, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 %R9, i32* %20
  %t_0000019D2B0FE4E8.12 = ptrtoint i32* %t_0000019D2B0FE4E8. to i64
  %21 = add i64 %t_0000019D2B0FE4E8.12, 0
  %22 = inttoptr i64 %21 to i32*
  %R10 = load i32, i32* %22
  %p_0000019D2B0FE408.13 = ptrtoint i32* %p_0000019D2B0FE408. to i64
  %23 = add i64 %p_0000019D2B0FE408.13, 0
  %24 = inttoptr i64 %23 to i32*
  store i32 %R10, i32* %24
  br label %L3

L3:                                               ; preds = %L2
  br label %L1

L4:                                               ; preds = %L1
  store i32 0, i32* %0
  br label %L5

L5:                                               ; preds = %L4
  %25 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
