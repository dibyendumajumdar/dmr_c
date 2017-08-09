; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [25 x i8] c"%d %d %d %d %d %d %d %d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"
@.str.2 = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %frod_00000231BA4BDA38. = alloca i32
  %0 = alloca i32
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i32 0, i32 1, i32 2, i32 3, i32 54, i32 73, i32 74, i32 75)
  %frod_00000231BA4BDA38.1 = ptrtoint i32* %frod_00000231BA4BDA38. to i64
  %1 = add i64 %frod_00000231BA4BDA38.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 12, i32* %2
  %frod_00000231BA4BDA38.2 = ptrtoint i32* %frod_00000231BA4BDA38. to i64
  %3 = add i64 %frod_00000231BA4BDA38.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R4 = load i32, i32* %4
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %R4)
  %frod_00000231BA4BDA38.3 = ptrtoint i32* %frod_00000231BA4BDA38. to i64
  %5 = add i64 %frod_00000231BA4BDA38.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 54, i32* %6
  %frod_00000231BA4BDA38.4 = ptrtoint i32* %frod_00000231BA4BDA38. to i64
  %7 = add i64 %frod_00000231BA4BDA38.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R8 = load i32, i32* %8
  %R10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %R8)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %9 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
