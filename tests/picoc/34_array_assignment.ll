; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [13 x i8] c"%d %d %d %d\0A\00"
@.str.1 = private constant [13 x i8] c"%d %d %d %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %b_00000285F37FC098. = alloca i32*
  %a_00000285F37FBED8. = alloca [4 x i32]
  %0 = alloca i32
  %a_00000285F37FBED8.1 = ptrtoint [4 x i32]* %a_00000285F37FBED8. to i64
  %1 = add i64 %a_00000285F37FBED8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 12, i32* %2
  %a_00000285F37FBED8.2 = ptrtoint [4 x i32]* %a_00000285F37FBED8. to i64
  %3 = add i64 %a_00000285F37FBED8.2, 4
  %4 = inttoptr i64 %3 to i32*
  store i32 23, i32* %4
  %a_00000285F37FBED8.3 = ptrtoint [4 x i32]* %a_00000285F37FBED8. to i64
  %5 = add i64 %a_00000285F37FBED8.3, 8
  %6 = inttoptr i64 %5 to i32*
  store i32 34, i32* %6
  %a_00000285F37FBED8.4 = ptrtoint [4 x i32]* %a_00000285F37FBED8. to i64
  %7 = add i64 %a_00000285F37FBED8.4, 12
  %8 = inttoptr i64 %7 to i32*
  store i32 45, i32* %8
  %a_00000285F37FBED8.5 = ptrtoint [4 x i32]* %a_00000285F37FBED8. to i64
  %9 = add i64 %a_00000285F37FBED8.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R2 = load i32, i32* %10
  %a_00000285F37FBED8.6 = ptrtoint [4 x i32]* %a_00000285F37FBED8. to i64
  %11 = add i64 %a_00000285F37FBED8.6, 4
  %12 = inttoptr i64 %11 to i32*
  %R3 = load i32, i32* %12
  %a_00000285F37FBED8.7 = ptrtoint [4 x i32]* %a_00000285F37FBED8. to i64
  %13 = add i64 %a_00000285F37FBED8.7, 8
  %14 = inttoptr i64 %13 to i32*
  %R4 = load i32, i32* %14
  %a_00000285F37FBED8.8 = ptrtoint [4 x i32]* %a_00000285F37FBED8. to i64
  %15 = add i64 %a_00000285F37FBED8.8, 12
  %16 = inttoptr i64 %15 to i32*
  %R5 = load i32, i32* %16
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i32 %R2, i32 %R3, i32 %R4, i32 %R5)
  %R7 = bitcast [4 x i32]* %a_00000285F37FBED8. to i32*
  %b_00000285F37FC098.9 = ptrtoint i32** %b_00000285F37FC098. to i64
  %17 = add i64 %b_00000285F37FC098.9, 0
  %18 = inttoptr i64 %17 to i32**
  store i32* %R7, i32** %18
  %R8 = bitcast [4 x i32]* %a_00000285F37FBED8. to i32*
  %b_00000285F37FC098.10 = ptrtoint i32** %b_00000285F37FC098. to i64
  %19 = add i64 %b_00000285F37FC098.10, 0
  %20 = inttoptr i64 %19 to i32**
  store i32* %R8, i32** %20
  %b_00000285F37FC098.11 = ptrtoint i32** %b_00000285F37FC098. to i64
  %21 = add i64 %b_00000285F37FC098.11, 0
  %22 = inttoptr i64 %21 to i32**
  %R10 = load i32*, i32** %22
  %R1012 = ptrtoint i32* %R10 to i64
  %23 = add i64 %R1012, 0
  %24 = inttoptr i64 %23 to i32*
  %R11 = load i32, i32* %24
  %b_00000285F37FC098.13 = ptrtoint i32** %b_00000285F37FC098. to i64
  %25 = add i64 %b_00000285F37FC098.13, 0
  %26 = inttoptr i64 %25 to i32**
  %R12 = load i32*, i32** %26
  %R1214 = ptrtoint i32* %R12 to i64
  %27 = add i64 %R1214, 4
  %28 = inttoptr i64 %27 to i32*
  %R13 = load i32, i32* %28
  %b_00000285F37FC098.15 = ptrtoint i32** %b_00000285F37FC098. to i64
  %29 = add i64 %b_00000285F37FC098.15, 0
  %30 = inttoptr i64 %29 to i32**
  %R14 = load i32*, i32** %30
  %R1416 = ptrtoint i32* %R14 to i64
  %31 = add i64 %R1416, 8
  %32 = inttoptr i64 %31 to i32*
  %R15 = load i32, i32* %32
  %b_00000285F37FC098.17 = ptrtoint i32** %b_00000285F37FC098. to i64
  %33 = add i64 %b_00000285F37FC098.17, 0
  %34 = inttoptr i64 %33 to i32**
  %R16 = load i32*, i32** %34
  %R1618 = ptrtoint i32* %R16 to i64
  %35 = add i64 %R1618, 12
  %36 = inttoptr i64 %35 to i32*
  %R17 = load i32, i32* %36
  %R18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 %R11, i32 %R13, i32 %R15, i32 %R17)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %37 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
