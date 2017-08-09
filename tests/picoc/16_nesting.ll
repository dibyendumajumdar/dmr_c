; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [10 x i8] c"%d %d %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %z_000001A1CDF4EBE8. = alloca i32
  %y_000001A1CDF4EB08. = alloca i32
  %x_000001A1CDF4EA28. = alloca i32
  %0 = alloca i32
  %x_000001A1CDF4EA28.1 = ptrtoint i32* %x_000001A1CDF4EA28. to i64
  %1 = add i64 %x_000001A1CDF4EA28.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 0, i32* %2
  br label %L1

L1:                                               ; preds = %L11, %L0
  %x_000001A1CDF4EA28.2 = ptrtoint i32* %x_000001A1CDF4EA28. to i64
  %3 = add i64 %x_000001A1CDF4EA28.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = icmp slt i32 %R1, 2
  %R23 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R23, 0
  br i1 %cond, label %L2, label %L12

L2:                                               ; preds = %L1
  %y_000001A1CDF4EB08.4 = ptrtoint i32* %y_000001A1CDF4EB08. to i64
  %5 = add i64 %y_000001A1CDF4EB08.4, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  br label %L3

L3:                                               ; preds = %L9, %L2
  %y_000001A1CDF4EB08.5 = ptrtoint i32* %y_000001A1CDF4EB08. to i64
  %7 = add i64 %y_000001A1CDF4EB08.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R3 = load i32, i32* %8
  %R4 = icmp slt i32 %R3, 3
  %R46 = zext i1 %R4 to i32
  %cond7 = icmp ne i32 %R46, 0
  br i1 %cond7, label %L4, label %L10

L4:                                               ; preds = %L3
  %z_000001A1CDF4EBE8.8 = ptrtoint i32* %z_000001A1CDF4EBE8. to i64
  %9 = add i64 %z_000001A1CDF4EBE8.8, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 0, i32* %10
  br label %L5

L5:                                               ; preds = %L7, %L4
  %z_000001A1CDF4EBE8.9 = ptrtoint i32* %z_000001A1CDF4EBE8. to i64
  %11 = add i64 %z_000001A1CDF4EBE8.9, 0
  %12 = inttoptr i64 %11 to i32*
  %R5 = load i32, i32* %12
  %R6 = icmp slt i32 %R5, 3
  %R610 = zext i1 %R6 to i32
  %cond11 = icmp ne i32 %R610, 0
  br i1 %cond11, label %L6, label %L8

L6:                                               ; preds = %L5
  %x_000001A1CDF4EA28.12 = ptrtoint i32* %x_000001A1CDF4EA28. to i64
  %13 = add i64 %x_000001A1CDF4EA28.12, 0
  %14 = inttoptr i64 %13 to i32*
  %R8 = load i32, i32* %14
  %y_000001A1CDF4EB08.13 = ptrtoint i32* %y_000001A1CDF4EB08. to i64
  %15 = add i64 %y_000001A1CDF4EB08.13, 0
  %16 = inttoptr i64 %15 to i32*
  %R9 = load i32, i32* %16
  %z_000001A1CDF4EBE8.14 = ptrtoint i32* %z_000001A1CDF4EBE8. to i64
  %17 = add i64 %z_000001A1CDF4EBE8.14, 0
  %18 = inttoptr i64 %17 to i32*
  %R10 = load i32, i32* %18
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %R8, i32 %R9, i32 %R10)
  br label %L7

L7:                                               ; preds = %L6
  %z_000001A1CDF4EBE8.15 = ptrtoint i32* %z_000001A1CDF4EBE8. to i64
  %19 = add i64 %z_000001A1CDF4EBE8.15, 0
  %20 = inttoptr i64 %19 to i32*
  %R12 = load i32, i32* %20
  %R13 = add i32 %R12, 1
  %z_000001A1CDF4EBE8.16 = ptrtoint i32* %z_000001A1CDF4EBE8. to i64
  %21 = add i64 %z_000001A1CDF4EBE8.16, 0
  %22 = inttoptr i64 %21 to i32*
  store i32 %R13, i32* %22
  br label %L5

L8:                                               ; preds = %L5
  br label %L9

L9:                                               ; preds = %L8
  %y_000001A1CDF4EB08.17 = ptrtoint i32* %y_000001A1CDF4EB08. to i64
  %23 = add i64 %y_000001A1CDF4EB08.17, 0
  %24 = inttoptr i64 %23 to i32*
  %R14 = load i32, i32* %24
  %R15 = add i32 %R14, 1
  %y_000001A1CDF4EB08.18 = ptrtoint i32* %y_000001A1CDF4EB08. to i64
  %25 = add i64 %y_000001A1CDF4EB08.18, 0
  %26 = inttoptr i64 %25 to i32*
  store i32 %R15, i32* %26
  br label %L3

L10:                                              ; preds = %L3
  br label %L11

L11:                                              ; preds = %L10
  %x_000001A1CDF4EA28.19 = ptrtoint i32* %x_000001A1CDF4EA28. to i64
  %27 = add i64 %x_000001A1CDF4EA28.19, 0
  %28 = inttoptr i64 %27 to i32*
  %R16 = load i32, i32* %28
  %R17 = add i32 %R16, 1
  %x_000001A1CDF4EA28.20 = ptrtoint i32* %x_000001A1CDF4EA28. to i64
  %29 = add i64 %x_000001A1CDF4EA28.20, 0
  %30 = inttoptr i64 %29 to i32*
  store i32 %R17, i32* %30
  br label %L1

L12:                                              ; preds = %L1
  store i32 0, i32* %0
  br label %L13

L13:                                              ; preds = %L12
  %31 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
