; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [24 x i8] c"Hello world!, from %s%c\00"
@.str.1 = private constant [7 x i8] c"Sparse\00"
@.str.2 = private constant [24 x i8] c"A very long value %lld\0A\00"
@.str.3 = private constant [16 x i8] c"A int value %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main(i32 %ARG1, i8** %ARG2) {
L0:
  %n_0000020C054CBF38. = alloca i32
  %argv_0000020C054CBBB8. = alloca i8**
  %argc_0000020C054CBAD8. = alloca i32
  %0 = alloca i32
  %argc_0000020C054CBAD8.1 = ptrtoint i32* %argc_0000020C054CBAD8. to i64
  %1 = add i64 %argc_0000020C054CBAD8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %argv_0000020C054CBBB8.2 = ptrtoint i8*** %argv_0000020C054CBBB8. to i64
  %3 = add i64 %argv_0000020C054CBBB8.2, 0
  %4 = inttoptr i64 %3 to i8***
  store i8** %ARG2, i8*** %4
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 10)
  %n_0000020C054CBF38.3 = ptrtoint i32* %n_0000020C054CBF38. to i64
  %5 = add i64 %n_0000020C054CBF38.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 %R3, i32* %6
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i64 918181788818181)
  %n_0000020C054CBF38.4 = ptrtoint i32* %n_0000020C054CBF38. to i64
  %7 = add i64 %n_0000020C054CBF38.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R6 = load i32, i32* %8
  %R8 = add i32 %R6, %R5
  %n_0000020C054CBF38.5 = ptrtoint i32* %n_0000020C054CBF38. to i64
  %9 = add i64 %n_0000020C054CBF38.5, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 %R8, i32* %10
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 1000000)
  %n_0000020C054CBF38.6 = ptrtoint i32* %n_0000020C054CBF38. to i64
  %11 = add i64 %n_0000020C054CBF38.6, 0
  %12 = inttoptr i64 %11 to i32*
  %R12 = load i32, i32* %12
  %R14 = add i32 %R12, %R11
  %n_0000020C054CBF38.7 = ptrtoint i32* %n_0000020C054CBF38. to i64
  %13 = add i64 %n_0000020C054CBF38.7, 0
  %14 = inttoptr i64 %13 to i32*
  store i32 %R14, i32* %14
  %n_0000020C054CBF38.8 = ptrtoint i32* %n_0000020C054CBF38. to i64
  %15 = add i64 %n_0000020C054CBF38.8, 0
  %16 = inttoptr i64 %15 to i32*
  %R16 = load i32, i32* %16
  %R17 = icmp eq i32 %R16, 80
  %R179 = zext i1 %R17 to i32
  %cond = icmp ne i32 %R179, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %17 = load i32, i32* %0
  ret i32 %select
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
