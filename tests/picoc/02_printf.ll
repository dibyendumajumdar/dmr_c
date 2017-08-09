; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [13 x i8] c"Hello world\0A\00"
@.str.1 = private constant [12 x i8] c"Count = %d\0A\00"
@.str.2 = private constant [39 x i8] c"String 'hello', 'there' is '%s', '%s'\0A\00"
@.str.3 = private constant [6 x i8] c"hello\00"
@.str.4 = private constant [6 x i8] c"there\00"
@.str.5 = private constant [23 x i8] c"Character 'A' is '%c'\0A\00"
@.str.6 = private constant [23 x i8] c"Character 'a' is '%c'\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %Count_000001C8317DC038. = alloca i32
  %0 = alloca i32
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  %Count_000001C8317DC038.1 = ptrtoint i32* %Count_000001C8317DC038. to i64
  %1 = add i64 %Count_000001C8317DC038.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 -5, i32* %2
  br label %L1

L1:                                               ; preds = %L3, %L0
  %Count_000001C8317DC038.2 = ptrtoint i32* %Count_000001C8317DC038. to i64
  %3 = add i64 %Count_000001C8317DC038.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R3 = load i32, i32* %4
  %R4 = icmp sle i32 %R3, 5
  %R43 = zext i1 %R4 to i32
  %cond = icmp ne i32 %R43, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %Count_000001C8317DC038.4 = ptrtoint i32* %Count_000001C8317DC038. to i64
  %5 = add i64 %Count_000001C8317DC038.4, 0
  %6 = inttoptr i64 %5 to i32*
  %R6 = load i32, i32* %6
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 %R6)
  br label %L3

L3:                                               ; preds = %L2
  %Count_000001C8317DC038.5 = ptrtoint i32* %Count_000001C8317DC038. to i64
  %7 = add i64 %Count_000001C8317DC038.5, 0
  %8 = inttoptr i64 %7 to i32*
  %R8 = load i32, i32* %8
  %R9 = add i32 %R8, 1
  %Count_000001C8317DC038.6 = ptrtoint i32* %Count_000001C8317DC038. to i64
  %9 = add i64 %Count_000001C8317DC038.6, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 %R9, i32* %10
  br label %L1

L4:                                               ; preds = %L1
  %R13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0))
  %R15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i32 65)
  %R17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.6, i64 0, i64 0), i32 97)
  store i32 0, i32* %0
  br label %L5

L5:                                               ; preds = %L4
  %11 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
