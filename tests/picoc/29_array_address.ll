; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [7 x i8] c"abcdef\00"
@.str.1 = private constant [4 x i8] c"%s\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %a_000002C67535DB28. = alloca [10 x i8]
  %0 = alloca i32
  %R1 = bitcast [10 x i8]* %a_000002C67535DB28. to i8*
  %R3 = call i8* @strcpy(i8* %R1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0))
  %R5 = bitcast [10 x i8]* %a_000002C67535DB28. to i8*
  %R51 = ptrtoint i8* %R5 to i64
  %R6 = add i64 %R51, 1
  %R62 = inttoptr i64 %R6 to i8*
  %R7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* %R62)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %1 = load i32, i32* %0
  ret i32 0
}

declare i8* @strcpy(i8*, i8*)

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
