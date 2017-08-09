; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [6 x i8] c"a=%d\0A\00"
@.str.1 = private constant [9 x i8] c"qfunc()\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"
@.str.3 = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @myfunc(i32 %ARG1) {
L0:
  %x_0000022CBFCAF048. = alloca i32
  %0 = alloca i32
  %x_0000022CBFCAF048.1 = ptrtoint i32* %x_0000022CBFCAF048. to i64
  %1 = add i64 %x_0000022CBFCAF048.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %x_0000022CBFCAF048.2 = ptrtoint i32* %x_0000022CBFCAF048. to i64
  %3 = add i64 %x_0000022CBFCAF048.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %x_0000022CBFCAF048.3 = ptrtoint i32* %x_0000022CBFCAF048. to i64
  %5 = add i64 %x_0000022CBFCAF048.3, 0
  %6 = inttoptr i64 %5 to i32*
  %R2 = load i32, i32* %6
  %R3 = mul i32 %R1, %R2
  store i32 %R3, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %7 = load i32, i32* %0
  ret i32 %R3
}

define internal void @vfunc(i32 %ARG1) {
L2:
  %a_0000022CBFCAF3C8. = alloca i32
  %a_0000022CBFCAF3C8.1 = ptrtoint i32* %a_0000022CBFCAF3C8. to i64
  %0 = add i64 %a_0000022CBFCAF3C8.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %a_0000022CBFCAF3C8.2 = ptrtoint i32* %a_0000022CBFCAF3C8. to i64
  %2 = add i64 %a_0000022CBFCAF3C8.2, 0
  %3 = inttoptr i64 %2 to i32*
  %R6 = load i32, i32* %3
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i32 %R6)
  br label %L3

L3:                                               ; preds = %L2
  ret void
}

declare i32 @printf(i8*, ...)

define internal void @qfunc() {
L4:
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0))
  br label %L5

L5:                                               ; preds = %L4
  ret void
}

define i32 @main() {
L6:
  %0 = alloca i32
  %R11 = call i32 @myfunc(i32 3)
  %R12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %R11)
  %R14 = call i32 @myfunc(i32 4)
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 %R14)
  call void @vfunc(i32 1234)
  call void @qfunc()
  store i32 0, i32* %0
  br label %L7

L7:                                               ; preds = %L6
  %1 = load i32, i32* %0
  ret i32 0
}

attributes #0 = { argmemonly nounwind }
