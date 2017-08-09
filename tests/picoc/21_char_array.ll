; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [6 x i8] c"hello\00"
@.str.1 = private constant [4 x i8] c"%s\0A\00"
@.str.2 = private constant [8 x i8] c"%c: %d\0A\00"
@.str.3 = private constant [21 x i8] c"copied string is %s\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %src_000001DC01EDC768. = alloca i8*
  %dest_000001DC01EDC5A8. = alloca i8*
  %destarray_000001DC01EDC3E8. = alloca [10 x i8]
  %b_000001DC01EDC068. = alloca i8*
  %c_000001DC01EDBF88. = alloca i32
  %a_000001DC01EDBDC8. = alloca i8*
  %y_000001DC01EDBCE8. = alloca i8
  %x_000001DC01EDBC08. = alloca i32
  %0 = alloca i32
  store i32 97, i32* %x_000001DC01EDBC08.
  %x_000001DC01EDBC08.1 = ptrtoint i32* %x_000001DC01EDBC08. to i64
  %1 = add i64 %x_000001DC01EDBC08.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 97, i32* %2
  store i8 97, i8* %y_000001DC01EDBCE8.
  %y_000001DC01EDBCE8.2 = ptrtoint i8* %y_000001DC01EDBCE8. to i64
  %3 = add i64 %y_000001DC01EDBCE8.2, 0
  %4 = inttoptr i64 %3 to i8*
  store i8 97, i8* %4
  %a_000001DC01EDBDC8.3 = ptrtoint i8** %a_000001DC01EDBDC8. to i64
  %5 = add i64 %a_000001DC01EDBDC8.3, 0
  %6 = inttoptr i64 %5 to i8**
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %6
  %a_000001DC01EDBDC8.4 = ptrtoint i8** %a_000001DC01EDBDC8. to i64
  %7 = add i64 %a_000001DC01EDBDC8.4, 0
  %8 = inttoptr i64 %7 to i8**
  %R3 = load i8*, i8** %8
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %R3)
  %a_000001DC01EDBDC8.5 = ptrtoint i8** %a_000001DC01EDBDC8. to i64
  %9 = add i64 %a_000001DC01EDBDC8.5, 0
  %10 = inttoptr i64 %9 to i8**
  %R5 = load i8*, i8** %10
  %R56 = ptrtoint i8* %R5 to i64
  %11 = add i64 %R56, 0
  %12 = inttoptr i64 %11 to i8*
  %R6 = load i8, i8* %12
  %R7 = sext i8 %R6 to i32
  %c_000001DC01EDBF88.7 = ptrtoint i32* %c_000001DC01EDBF88. to i64
  %13 = add i64 %c_000001DC01EDBF88.7, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 %R7, i32* %14
  %a_000001DC01EDBDC8.8 = ptrtoint i8** %a_000001DC01EDBDC8. to i64
  %15 = add i64 %a_000001DC01EDBDC8.8, 0
  %16 = inttoptr i64 %15 to i8**
  %R8 = load i8*, i8** %16
  %b_000001DC01EDC068.9 = ptrtoint i8** %b_000001DC01EDC068. to i64
  %17 = add i64 %b_000001DC01EDC068.9, 0
  %18 = inttoptr i64 %17 to i8**
  store i8* %R8, i8** %18
  br label %L1

L1:                                               ; preds = %L3, %L0
  %b_000001DC01EDC068.10 = ptrtoint i8** %b_000001DC01EDC068. to i64
  %19 = add i64 %b_000001DC01EDC068.10, 0
  %20 = inttoptr i64 %19 to i8**
  %R9 = load i8*, i8** %20
  %R911 = ptrtoint i8* %R9 to i64
  %21 = add i64 %R911, 0
  %22 = inttoptr i64 %21 to i8*
  %R10 = load i8, i8* %22
  %R11 = sext i8 %R10 to i32
  %R12 = icmp ne i32 %R11, 0
  %R1212 = zext i1 %R12 to i32
  %cond = icmp ne i32 %R1212, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %b_000001DC01EDC068.13 = ptrtoint i8** %b_000001DC01EDC068. to i64
  %23 = add i64 %b_000001DC01EDC068.13, 0
  %24 = inttoptr i64 %23 to i8**
  %R14 = load i8*, i8** %24
  %R1414 = ptrtoint i8* %R14 to i64
  %25 = add i64 %R1414, 0
  %26 = inttoptr i64 %25 to i8*
  %R15 = load i8, i8* %26
  %R16 = sext i8 %R15 to i32
  %b_000001DC01EDC068.15 = ptrtoint i8** %b_000001DC01EDC068. to i64
  %27 = add i64 %b_000001DC01EDC068.15, 0
  %28 = inttoptr i64 %27 to i8**
  %R17 = load i8*, i8** %28
  %R1716 = ptrtoint i8* %R17 to i64
  %29 = add i64 %R1716, 0
  %30 = inttoptr i64 %29 to i8*
  %R18 = load i8, i8* %30
  %R19 = sext i8 %R18 to i32
  %R20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %R16, i32 %R19)
  br label %L3

L3:                                               ; preds = %L2
  %b_000001DC01EDC068.17 = ptrtoint i8** %b_000001DC01EDC068. to i64
  %31 = add i64 %b_000001DC01EDC068.17, 0
  %32 = inttoptr i64 %31 to i8**
  %R21 = load i8*, i8** %32
  %R2118 = ptrtoint i8* %R21 to i64
  %R22 = add i64 %R2118, 1
  %R2219 = inttoptr i64 %R22 to i8*
  %b_000001DC01EDC068.20 = ptrtoint i8** %b_000001DC01EDC068. to i64
  %33 = add i64 %b_000001DC01EDC068.20, 0
  %34 = inttoptr i64 %33 to i8**
  store i8* %R2219, i8** %34
  br label %L1

L4:                                               ; preds = %L1
  %R23 = bitcast [10 x i8]* %destarray_000001DC01EDC3E8. to i8*
  %R2321 = ptrtoint i8* %R23 to i64
  %R24 = add i64 %R2321, 0
  %R2422 = inttoptr i64 %R24 to i8*
  %dest_000001DC01EDC5A8.23 = ptrtoint i8** %dest_000001DC01EDC5A8. to i64
  %35 = add i64 %dest_000001DC01EDC5A8.23, 0
  %36 = inttoptr i64 %35 to i8**
  store i8* %R2422, i8** %36
  %a_000001DC01EDBDC8.24 = ptrtoint i8** %a_000001DC01EDBDC8. to i64
  %37 = add i64 %a_000001DC01EDBDC8.24, 0
  %38 = inttoptr i64 %37 to i8**
  %R25 = load i8*, i8** %38
  %src_000001DC01EDC768.25 = ptrtoint i8** %src_000001DC01EDC768. to i64
  %39 = add i64 %src_000001DC01EDC768.25, 0
  %40 = inttoptr i64 %39 to i8**
  store i8* %R25, i8** %40
  br label %L5

L5:                                               ; preds = %L7, %L4
  %src_000001DC01EDC768.26 = ptrtoint i8** %src_000001DC01EDC768. to i64
  %41 = add i64 %src_000001DC01EDC768.26, 0
  %42 = inttoptr i64 %41 to i8**
  %R26 = load i8*, i8** %42
  %R2627 = ptrtoint i8* %R26 to i64
  %43 = add i64 %R2627, 0
  %44 = inttoptr i64 %43 to i8*
  %R27 = load i8, i8* %44
  %R28 = sext i8 %R27 to i32
  %R29 = icmp ne i32 %R28, 0
  %R2928 = zext i1 %R29 to i32
  %cond29 = icmp ne i32 %R2928, 0
  br i1 %cond29, label %L6, label %L8

L6:                                               ; preds = %L5
  %src_000001DC01EDC768.30 = ptrtoint i8** %src_000001DC01EDC768. to i64
  %45 = add i64 %src_000001DC01EDC768.30, 0
  %46 = inttoptr i64 %45 to i8**
  %R30 = load i8*, i8** %46
  %R3031 = ptrtoint i8* %R30 to i64
  %R31 = add i64 %R3031, 1
  %R3132 = inttoptr i64 %R31 to i8*
  %src_000001DC01EDC768.33 = ptrtoint i8** %src_000001DC01EDC768. to i64
  %47 = add i64 %src_000001DC01EDC768.33, 0
  %48 = inttoptr i64 %47 to i8**
  store i8* %R3132, i8** %48
  %R3034 = ptrtoint i8* %R30 to i64
  %49 = add i64 %R3034, 0
  %50 = inttoptr i64 %49 to i8*
  %R32 = load i8, i8* %50
  %dest_000001DC01EDC5A8.35 = ptrtoint i8** %dest_000001DC01EDC5A8. to i64
  %51 = add i64 %dest_000001DC01EDC5A8.35, 0
  %52 = inttoptr i64 %51 to i8**
  %R33 = load i8*, i8** %52
  %R3336 = ptrtoint i8* %R33 to i64
  %R34 = add i64 %R3336, 1
  %R3437 = inttoptr i64 %R34 to i8*
  %dest_000001DC01EDC5A8.38 = ptrtoint i8** %dest_000001DC01EDC5A8. to i64
  %53 = add i64 %dest_000001DC01EDC5A8.38, 0
  %54 = inttoptr i64 %53 to i8**
  store i8* %R3437, i8** %54
  %R3339 = ptrtoint i8* %R33 to i64
  %55 = add i64 %R3339, 0
  %56 = inttoptr i64 %55 to i8*
  store i8 %R32, i8* %56
  br label %L7

L7:                                               ; preds = %L6
  br label %L5

L8:                                               ; preds = %L5
  %dest_000001DC01EDC5A8.40 = ptrtoint i8** %dest_000001DC01EDC5A8. to i64
  %57 = add i64 %dest_000001DC01EDC5A8.40, 0
  %58 = inttoptr i64 %57 to i8**
  %R35 = load i8*, i8** %58
  %R3541 = ptrtoint i8* %R35 to i64
  %59 = add i64 %R3541, 0
  %60 = inttoptr i64 %59 to i8*
  store i8 0, i8* %60
  %R37 = bitcast [10 x i8]* %destarray_000001DC01EDC3E8. to i8*
  %R38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0), i8* %R37)
  store i32 0, i32* %0
  br label %L9

L9:                                               ; preds = %L8
  %61 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
