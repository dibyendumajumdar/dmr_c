; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%c\0A\00"
@.str.1 = private constant [4 x i8] c"%c\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main(i32 %ARG1, i8** %ARG2) {
L0:
  %cp_0000023E201ADBF8. = alloca i8*
  %argv_0000023E201AD878. = alloca i8**
  %argc_0000023E201AD798. = alloca i32
  %0 = alloca i32
  %argc_0000023E201AD798.1 = ptrtoint i32* %argc_0000023E201AD798. to i64
  %1 = add i64 %argc_0000023E201AD798.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %argv_0000023E201AD878.2 = ptrtoint i8*** %argv_0000023E201AD878. to i64
  %3 = add i64 %argv_0000023E201AD878.2, 0
  %4 = inttoptr i64 %3 to i8***
  store i8** %ARG2, i8*** %4
  %argv_0000023E201AD878.3 = ptrtoint i8*** %argv_0000023E201AD878. to i64
  %5 = add i64 %argv_0000023E201AD878.3, 0
  %6 = inttoptr i64 %5 to i8***
  %R1 = load i8**, i8*** %6
  %R14 = ptrtoint i8** %R1 to i64
  %7 = add i64 %R14, 0
  %8 = inttoptr i64 %7 to i8**
  %R2 = load i8*, i8** %8
  %cp_0000023E201ADBF8.5 = ptrtoint i8** %cp_0000023E201ADBF8. to i64
  %9 = add i64 %cp_0000023E201ADBF8.5, 0
  %10 = inttoptr i64 %9 to i8**
  store i8* %R2, i8** %10
  %cp_0000023E201ADBF8.6 = ptrtoint i8** %cp_0000023E201ADBF8. to i64
  %11 = add i64 %cp_0000023E201ADBF8.6, 0
  %12 = inttoptr i64 %11 to i8**
  %R3 = load i8*, i8** %12
  %R37 = ptrtoint i8* %R3 to i64
  %13 = add i64 %R37, 0
  %14 = inttoptr i64 %13 to i8*
  %R4 = load i8, i8* %14
  switch i8 %R4, label %L2 [
    i8 115, label %L1
  ]

L1:                                               ; preds = %L0
  %cp_0000023E201ADBF8.8 = ptrtoint i8** %cp_0000023E201ADBF8. to i64
  %15 = add i64 %cp_0000023E201ADBF8.8, 0
  %16 = inttoptr i64 %15 to i8**
  %R6 = load i8*, i8** %16
  %R69 = ptrtoint i8* %R6 to i64
  %17 = add i64 %R69, 0
  %18 = inttoptr i64 %17 to i8*
  %R7 = load i8, i8* %18
  %R8 = sext i8 %R7 to i32
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R8)
  br label %L5

L2:                                               ; preds = %L0
  %cp_0000023E201ADBF8.10 = ptrtoint i8** %cp_0000023E201ADBF8. to i64
  %19 = add i64 %cp_0000023E201ADBF8.10, 0
  %20 = inttoptr i64 %19 to i8**
  %R10 = load i8*, i8** %20
  %R1011 = ptrtoint i8* %R10 to i64
  %21 = add i64 %R1011, 0
  %22 = inttoptr i64 %21 to i8*
  %R11 = load i8, i8* %22
  %cond = icmp ne i8 %R11, 0
  br i1 %cond, label %L3, label %L4

L3:                                               ; preds = %L2
  %cp_0000023E201ADBF8.12 = ptrtoint i8** %cp_0000023E201ADBF8. to i64
  %23 = add i64 %cp_0000023E201ADBF8.12, 0
  %24 = inttoptr i64 %23 to i8**
  %R13 = load i8*, i8** %24
  %R1313 = ptrtoint i8* %R13 to i64
  %25 = add i64 %R1313, 0
  %26 = inttoptr i64 %25 to i8*
  %R1414 = load i8, i8* %26
  %R15 = sext i8 %R1414 to i32
  %R16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %R15)
  br label %L4

L4:                                               ; preds = %L3, %L2
  br label %L5

L5:                                               ; preds = %L4, %L1
  store i32 0, i32* %0
  br label %L6

L6:                                               ; preds = %L5
  %27 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
