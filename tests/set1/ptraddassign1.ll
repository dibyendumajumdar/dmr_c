; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [6 x i8] c"abcde\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i8* @incr(i8* %ARG1) {
L0:
  %tmp_0000021FD795B9B8. = alloca i8*
  %p_0000021FD795B718. = alloca i8*
  %0 = alloca i8*
  %p_0000021FD795B718.1 = ptrtoint i8** %p_0000021FD795B718. to i64
  %1 = add i64 %p_0000021FD795B718.1, 0
  %2 = inttoptr i64 %1 to i8**
  store i8* %ARG1, i8** %2
  %p_0000021FD795B718.2 = ptrtoint i8** %p_0000021FD795B718. to i64
  %3 = add i64 %p_0000021FD795B718.2, 0
  %4 = inttoptr i64 %3 to i8**
  %R1 = load i8*, i8** %4
  %tmp_0000021FD795B9B8.3 = ptrtoint i8** %tmp_0000021FD795B9B8. to i64
  %5 = add i64 %tmp_0000021FD795B9B8.3, 0
  %6 = inttoptr i64 %5 to i8**
  store i8* %R1, i8** %6
  %tmp_0000021FD795B9B8.4 = ptrtoint i8** %tmp_0000021FD795B9B8. to i64
  %7 = add i64 %tmp_0000021FD795B9B8.4, 0
  %8 = inttoptr i64 %7 to i8**
  %R2 = load i8*, i8** %8
  %R3 = ptrtoint i8* %R2 to i64
  %R4 = add i64 %R3, 4
  %R5 = inttoptr i64 %R4 to i8*
  %tmp_0000021FD795B9B8.5 = ptrtoint i8** %tmp_0000021FD795B9B8. to i64
  %9 = add i64 %tmp_0000021FD795B9B8.5, 0
  %10 = inttoptr i64 %9 to i8**
  store i8* %R5, i8** %10
  %tmp_0000021FD795B9B8.6 = ptrtoint i8** %tmp_0000021FD795B9B8. to i64
  %11 = add i64 %tmp_0000021FD795B9B8.6, 0
  %12 = inttoptr i64 %11 to i8**
  %R6 = load i8*, i8** %12
  store i8* %R6, i8** %0
  br label %L1

L1:                                               ; preds = %L0
  %13 = load i8*, i8** %0
  ret i8* %R6
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L2:
  %p_0000021FD795C358. = alloca i8*
  %text_0000021FD795C198. = alloca i8*
  %argv_0000021FD795BE18. = alloca i8**
  %argc_0000021FD795BD38. = alloca i32
  %0 = alloca i32
  %argc_0000021FD795BD38.1 = ptrtoint i32* %argc_0000021FD795BD38. to i64
  %1 = add i64 %argc_0000021FD795BD38.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %argv_0000021FD795BE18.2 = ptrtoint i8*** %argv_0000021FD795BE18. to i64
  %3 = add i64 %argv_0000021FD795BE18.2, 0
  %4 = inttoptr i64 %3 to i8***
  store i8** %ARG2, i8*** %4
  %text_0000021FD795C198.3 = ptrtoint i8** %text_0000021FD795C198. to i64
  %5 = add i64 %text_0000021FD795C198.3, 0
  %6 = inttoptr i64 %5 to i8**
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %6
  %text_0000021FD795C198.4 = ptrtoint i8** %text_0000021FD795C198. to i64
  %7 = add i64 %text_0000021FD795C198.4, 0
  %8 = inttoptr i64 %7 to i8**
  %R9 = load i8*, i8** %8
  %R10 = call i8* @incr(i8* %R9)
  %p_0000021FD795C358.5 = ptrtoint i8** %p_0000021FD795C358. to i64
  %9 = add i64 %p_0000021FD795C358.5, 0
  %10 = inttoptr i64 %9 to i8**
  store i8* %R10, i8** %10
  %p_0000021FD795C358.6 = ptrtoint i8** %p_0000021FD795C358. to i64
  %11 = add i64 %p_0000021FD795C358.6, 0
  %12 = inttoptr i64 %11 to i8**
  %R11 = load i8*, i8** %12
  %R117 = ptrtoint i8* %R11 to i64
  %13 = add i64 %R117, 0
  %14 = inttoptr i64 %13 to i8*
  %R12 = load i8, i8* %14
  %R13 = sext i8 %R12 to i32
  %R14 = icmp eq i32 %R13, 101
  %R148 = zext i1 %R14 to i32
  %cond = icmp ne i32 %R148, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %15 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
