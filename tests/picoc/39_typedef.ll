; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.FunStruct = type { i32, i32 }

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [7 x i8] c"%d,%d\0A\00"
@.str.2 = private constant [7 x i8] c"%d,%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %c_000002546C8CCF08. = alloca %struct.FunStruct*
  %b_000002546C8CCE28. = alloca %struct.FunStruct
  %a_000002546C8CCD48. = alloca i32
  %0 = alloca i32
  %a_000002546C8CCD48.1 = ptrtoint i32* %a_000002546C8CCD48. to i64
  %1 = add i64 %a_000002546C8CCD48.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 1, i32* %2
  %a_000002546C8CCD48.2 = ptrtoint i32* %a_000002546C8CCD48. to i64
  %3 = add i64 %a_000002546C8CCD48.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R2 = load i32, i32* %4
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R2)
  %b_000002546C8CCE28.3 = ptrtoint %struct.FunStruct* %b_000002546C8CCE28. to i64
  %5 = add i64 %b_000002546C8CCE28.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 12, i32* %6
  %b_000002546C8CCE28.4 = ptrtoint %struct.FunStruct* %b_000002546C8CCE28. to i64
  %7 = add i64 %b_000002546C8CCE28.4, 4
  %8 = inttoptr i64 %7 to i32*
  store i32 34, i32* %8
  %b_000002546C8CCE28.5 = ptrtoint %struct.FunStruct* %b_000002546C8CCE28. to i64
  %9 = add i64 %b_000002546C8CCE28.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R5 = load i32, i32* %10
  %b_000002546C8CCE28.6 = ptrtoint %struct.FunStruct* %b_000002546C8CCE28. to i64
  %11 = add i64 %b_000002546C8CCE28.6, 4
  %12 = inttoptr i64 %11 to i32*
  %R6 = load i32, i32* %12
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 %R5, i32 %R6)
  %c_000002546C8CCF08.7 = ptrtoint %struct.FunStruct** %c_000002546C8CCF08. to i64
  %13 = add i64 %c_000002546C8CCF08.7, 0
  %14 = inttoptr i64 %13 to %struct.FunStruct**
  store %struct.FunStruct* %b_000002546C8CCE28., %struct.FunStruct** %14
  %c_000002546C8CCF08.8 = ptrtoint %struct.FunStruct** %c_000002546C8CCF08. to i64
  %15 = add i64 %c_000002546C8CCF08.8, 0
  %16 = inttoptr i64 %15 to %struct.FunStruct**
  %R10 = load %struct.FunStruct*, %struct.FunStruct** %16
  %R109 = ptrtoint %struct.FunStruct* %R10 to i64
  %17 = add i64 %R109, 0
  %18 = inttoptr i64 %17 to i32*
  %R11 = load i32, i32* %18
  %c_000002546C8CCF08.10 = ptrtoint %struct.FunStruct** %c_000002546C8CCF08. to i64
  %19 = add i64 %c_000002546C8CCF08.10, 0
  %20 = inttoptr i64 %19 to %struct.FunStruct**
  %R12 = load %struct.FunStruct*, %struct.FunStruct** %20
  %R1211 = ptrtoint %struct.FunStruct* %R12 to i64
  %21 = add i64 %R1211, 4
  %22 = inttoptr i64 %21 to i32*
  %R13 = load i32, i32* %22
  %R14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i32 %R11, i32 %R13)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %23 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
