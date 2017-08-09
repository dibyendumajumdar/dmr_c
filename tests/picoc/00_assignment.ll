; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [4 x i8] c"%d\0A\00"
@.str.1 = private constant [4 x i8] c"%d\0A\00"
@.str.2 = private constant [8 x i8] c"%d, %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %d_0000021C3EB8F768. = alloca i32
  %c_0000021C3EB8F688. = alloca i32
  %b_0000021C3EB8F5A8. = alloca i32
  %a_0000021C3EB8F4C8. = alloca i32
  %0 = alloca i32
  %a_0000021C3EB8F4C8.1 = ptrtoint i32* %a_0000021C3EB8F4C8. to i64
  %1 = add i64 %a_0000021C3EB8F4C8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 42, i32* %2
  %a_0000021C3EB8F4C8.2 = ptrtoint i32* %a_0000021C3EB8F4C8. to i64
  %3 = add i64 %a_0000021C3EB8F4C8.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R2 = load i32, i32* %4
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %R2)
  store i32 64, i32* %b_0000021C3EB8F5A8.
  %b_0000021C3EB8F5A8.3 = ptrtoint i32* %b_0000021C3EB8F5A8. to i64
  %5 = add i64 %b_0000021C3EB8F5A8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 64, i32* %6
  %R5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 64)
  store i32 12, i32* %c_0000021C3EB8F688.
  %c_0000021C3EB8F688.4 = ptrtoint i32* %c_0000021C3EB8F688. to i64
  %7 = add i64 %c_0000021C3EB8F688.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 12, i32* %8
  store i32 34, i32* %d_0000021C3EB8F768.
  %d_0000021C3EB8F768.5 = ptrtoint i32* %d_0000021C3EB8F768. to i64
  %9 = add i64 %d_0000021C3EB8F768.5, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 34, i32* %10
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 12, i32 34)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %11 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
