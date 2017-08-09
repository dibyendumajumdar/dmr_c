; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [7 x i8] c"x=%d: \00"
@.str.1 = private constant [4 x i8] c"%d \00"
@.str.2 = private constant [2 x i8] c"\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %a_0000021A88F1CDF8. = alloca [4 x [4 x i32]]
  %y_0000021A88F1D258. = alloca i32
  %x_0000021A88F1D178. = alloca i32
  %b_0000021A88F1D098. = alloca i32
  %0 = alloca i32
  store i32 0, i32* %b_0000021A88F1D098.
  %b_0000021A88F1D098.1 = ptrtoint i32* %b_0000021A88F1D098. to i64
  %1 = add i64 %b_0000021A88F1D098.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 0, i32* %2
  %x_0000021A88F1D178.2 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %3 = add i64 %x_0000021A88F1D178.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 0, i32* %4
  br label %L1

L1:                                               ; preds = %L7, %L0
  %x_0000021A88F1D178.3 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %5 = add i64 %x_0000021A88F1D178.3, 0
  %6 = inttoptr i64 %5 to i32*
  %R1 = load i32, i32* %6
  %R2 = icmp slt i32 %R1, 4
  %R24 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R24, 0
  br i1 %cond, label %L2, label %L8

L2:                                               ; preds = %L1
  %y_0000021A88F1D258.5 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %7 = add i64 %y_0000021A88F1D258.5, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 0, i32* %8
  br label %L3

L3:                                               ; preds = %L5, %L2
  %y_0000021A88F1D258.6 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %9 = add i64 %y_0000021A88F1D258.6, 0
  %10 = inttoptr i64 %9 to i32*
  %R3 = load i32, i32* %10
  %R4 = icmp slt i32 %R3, 4
  %R47 = zext i1 %R4 to i32
  %cond8 = icmp ne i32 %R47, 0
  br i1 %cond8, label %L4, label %L6

L4:                                               ; preds = %L3
  %b_0000021A88F1D098.9 = ptrtoint i32* %b_0000021A88F1D098. to i64
  %11 = add i64 %b_0000021A88F1D098.9, 0
  %12 = inttoptr i64 %11 to i32*
  %R5 = load i32, i32* %12
  %R6 = add i32 %R5, 1
  %b_0000021A88F1D098.10 = ptrtoint i32* %b_0000021A88F1D098. to i64
  %13 = add i64 %b_0000021A88F1D098.10, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 %R6, i32* %14
  %b_0000021A88F1D098.11 = ptrtoint i32* %b_0000021A88F1D098. to i64
  %15 = add i64 %b_0000021A88F1D098.11, 0
  %16 = inttoptr i64 %15 to i32*
  %R7 = load i32, i32* %16
  %R8 = bitcast [4 x [4 x i32]]* %a_0000021A88F1CDF8. to [4 x i32]*
  %x_0000021A88F1D178.12 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %17 = add i64 %x_0000021A88F1D178.12, 0
  %18 = inttoptr i64 %17 to i32*
  %R9 = load i32, i32* %18
  %R10 = sext i32 %R9 to i64
  %R11 = mul i64 %R10, 16
  %R813 = ptrtoint [4 x i32]* %R8 to i64
  %R12 = add i64 %R813, %R11
  %R1214 = inttoptr i64 %R12 to i32*
  %y_0000021A88F1D258.15 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %19 = add i64 %y_0000021A88F1D258.15, 0
  %20 = inttoptr i64 %19 to i32*
  %R13 = load i32, i32* %20
  %R14 = sext i32 %R13 to i64
  %R15 = mul i64 %R14, 4
  %R121416 = ptrtoint i32* %R1214 to i64
  %R16 = add i64 %R121416, %R15
  %R1617 = inttoptr i64 %R16 to i32*
  %R161718 = ptrtoint i32* %R1617 to i64
  %21 = add i64 %R161718, 0
  %22 = inttoptr i64 %21 to i32*
  store i32 %R7, i32* %22
  br label %L5

L5:                                               ; preds = %L4
  %y_0000021A88F1D258.19 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %23 = add i64 %y_0000021A88F1D258.19, 0
  %24 = inttoptr i64 %23 to i32*
  %R17 = load i32, i32* %24
  %R18 = add i32 %R17, 1
  %y_0000021A88F1D258.20 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %25 = add i64 %y_0000021A88F1D258.20, 0
  %26 = inttoptr i64 %25 to i32*
  store i32 %R18, i32* %26
  br label %L3

L6:                                               ; preds = %L3
  br label %L7

L7:                                               ; preds = %L6
  %x_0000021A88F1D178.21 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %27 = add i64 %x_0000021A88F1D178.21, 0
  %28 = inttoptr i64 %27 to i32*
  %R19 = load i32, i32* %28
  %R20 = add i32 %R19, 1
  %x_0000021A88F1D178.22 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %29 = add i64 %x_0000021A88F1D178.22, 0
  %30 = inttoptr i64 %29 to i32*
  store i32 %R20, i32* %30
  br label %L1

L8:                                               ; preds = %L1
  %x_0000021A88F1D178.23 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %31 = add i64 %x_0000021A88F1D178.23, 0
  %32 = inttoptr i64 %31 to i32*
  store i32 0, i32* %32
  br label %L9

L9:                                               ; preds = %L15, %L8
  %x_0000021A88F1D178.24 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %33 = add i64 %x_0000021A88F1D178.24, 0
  %34 = inttoptr i64 %33 to i32*
  %R21 = load i32, i32* %34
  %R22 = icmp slt i32 %R21, 4
  %R2225 = zext i1 %R22 to i32
  %cond26 = icmp ne i32 %R2225, 0
  br i1 %cond26, label %L10, label %L16

L10:                                              ; preds = %L9
  %x_0000021A88F1D178.27 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %35 = add i64 %x_0000021A88F1D178.27, 0
  %36 = inttoptr i64 %35 to i32*
  %R2428 = load i32, i32* %36
  %R25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 %R2428)
  %y_0000021A88F1D258.29 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %37 = add i64 %y_0000021A88F1D258.29, 0
  %38 = inttoptr i64 %37 to i32*
  store i32 0, i32* %38
  br label %L11

L11:                                              ; preds = %L13, %L10
  %y_0000021A88F1D258.30 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %39 = add i64 %y_0000021A88F1D258.30, 0
  %40 = inttoptr i64 %39 to i32*
  %R26 = load i32, i32* %40
  %R27 = icmp slt i32 %R26, 4
  %R2731 = zext i1 %R27 to i32
  %cond32 = icmp ne i32 %R2731, 0
  br i1 %cond32, label %L12, label %L14

L12:                                              ; preds = %L11
  %R29 = bitcast [4 x [4 x i32]]* %a_0000021A88F1CDF8. to [4 x i32]*
  %x_0000021A88F1D178.33 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %41 = add i64 %x_0000021A88F1D178.33, 0
  %42 = inttoptr i64 %41 to i32*
  %R30 = load i32, i32* %42
  %R31 = sext i32 %R30 to i64
  %R32 = mul i64 %R31, 16
  %R2934 = ptrtoint [4 x i32]* %R29 to i64
  %R33 = add i64 %R2934, %R32
  %R3335 = inttoptr i64 %R33 to i32*
  %y_0000021A88F1D258.36 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %43 = add i64 %y_0000021A88F1D258.36, 0
  %44 = inttoptr i64 %43 to i32*
  %R34 = load i32, i32* %44
  %R35 = sext i32 %R34 to i64
  %R36 = mul i64 %R35, 4
  %R333537 = ptrtoint i32* %R3335 to i64
  %R37 = add i64 %R333537, %R36
  %R3738 = inttoptr i64 %R37 to i32*
  %R373839 = ptrtoint i32* %R3738 to i64
  %45 = add i64 %R373839, 0
  %46 = inttoptr i64 %45 to i32*
  %R38 = load i32, i32* %46
  %R39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %R38)
  br label %L13

L13:                                              ; preds = %L12
  %y_0000021A88F1D258.40 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %47 = add i64 %y_0000021A88F1D258.40, 0
  %48 = inttoptr i64 %47 to i32*
  %R40 = load i32, i32* %48
  %R41 = add i32 %R40, 1
  %y_0000021A88F1D258.41 = ptrtoint i32* %y_0000021A88F1D258. to i64
  %49 = add i64 %y_0000021A88F1D258.41, 0
  %50 = inttoptr i64 %49 to i32*
  store i32 %R41, i32* %50
  br label %L11

L14:                                              ; preds = %L11
  %R43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  br label %L15

L15:                                              ; preds = %L14
  %x_0000021A88F1D178.42 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %51 = add i64 %x_0000021A88F1D178.42, 0
  %52 = inttoptr i64 %51 to i32*
  %R44 = load i32, i32* %52
  %R45 = add i32 %R44, 1
  %x_0000021A88F1D178.43 = ptrtoint i32* %x_0000021A88F1D178. to i64
  %53 = add i64 %x_0000021A88F1D178.43, 0
  %54 = inttoptr i64 %53 to i32*
  store i32 %R45, i32* %54
  br label %L9

L16:                                              ; preds = %L9
  store i32 0, i32* %0
  br label %L17

L17:                                              ; preds = %L16
  %55 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
