; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [7 x i8] c"%d %d\0A\00"
@.str.1 = private constant [7 x i8] c"%d %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %0 = alloca i32
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 1, i32 1)
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0), i32 2, i32 2)
  store i32 0, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %1 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
