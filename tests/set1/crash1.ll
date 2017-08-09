; ModuleID = 'out.bc'
source_filename = "dmrC"

@"<noident>" = private global [20 x i8] c"agqwewbxklpfgytuorz\00", align 1
@randomletters = private global [20 x i8]* @"<noident>", align 8
@.str = private constant [14 x i8] c"Inserting %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %key_0000025094BCC908. = alloca i32
  %i_0000025094BCC668. = alloca i32
  %0 = alloca i32
  %i_0000025094BCC668.1 = ptrtoint i32* %i_0000025094BCC668. to i64
  %1 = add i64 %i_0000025094BCC668.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 0, i32* %2
  br label %L1

L1:                                               ; preds = %L3, %L0
  %i_0000025094BCC668.2 = ptrtoint i32* %i_0000025094BCC668. to i64
  %3 = add i64 %i_0000025094BCC668.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = icmp slt i32 %R1, 20
  %R23 = zext i1 %R2 to i32
  %cond = icmp ne i32 %R23, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %R3 = load i8*, i8** bitcast ([20 x i8]** @randomletters to i8**)
  %i_0000025094BCC668.4 = ptrtoint i32* %i_0000025094BCC668. to i64
  %5 = add i64 %i_0000025094BCC668.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R4 = load i32, i32* %6
  %R5 = sext i32 %R4 to i64
  %R35 = ptrtoint i8* %R3 to i64
  %R6 = add i64 %R35, %R5
  %R66 = inttoptr i64 %R6 to i8*
  %R667 = ptrtoint i8* %R66 to i64
  %7 = add i64 %R667, 0
  %8 = inttoptr i64 %7 to i8*
  %R7 = load i8, i8* %8
  %R8 = sext i8 %R7 to i32
  %key_0000025094BCC908.8 = ptrtoint i32* %key_0000025094BCC908. to i64
  %9 = add i64 %key_0000025094BCC908.8, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 %R8, i32* %10
  %key_0000025094BCC908.9 = ptrtoint i32* %key_0000025094BCC908. to i64
  %11 = add i64 %key_0000025094BCC908.9, 0
  %12 = inttoptr i64 %11 to i32*
  %R10 = load i32, i32* %12
  %R11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i32 %R10)
  br label %L3

L3:                                               ; preds = %L2
  %i_0000025094BCC668.10 = ptrtoint i32* %i_0000025094BCC668. to i64
  %13 = add i64 %i_0000025094BCC668.10, 0
  %14 = inttoptr i64 %13 to i32*
  %R12 = load i32, i32* %14
  %R13 = add i32 %R12, 1
  %i_0000025094BCC668.11 = ptrtoint i32* %i_0000025094BCC668. to i64
  %15 = add i64 %i_0000025094BCC668.11, 0
  %16 = inttoptr i64 %15 to i32*
  store i32 %R13, i32* %16
  br label %L1

L4:                                               ; preds = %L1
  store i32 0, i32* %0
  br label %L5

L5:                                               ; preds = %L4
  %17 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
