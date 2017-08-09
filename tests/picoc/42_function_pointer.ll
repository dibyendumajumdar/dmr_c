; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [7 x i8] c"yo %d\0A\00"
@f = private global i32 (i32)* null, align 8
@.str.1 = private constant [4 x i8] c"%d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @fred(i32 %ARG1) {
L0:
  %p_0000020CFA12C668. = alloca i32
  %0 = alloca i32
  %p_0000020CFA12C668.1 = ptrtoint i32* %p_0000020CFA12C668. to i64
  %1 = add i64 %p_0000020CFA12C668.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %p_0000020CFA12C668.2 = ptrtoint i32* %p_0000020CFA12C668. to i64
  %3 = add i64 %p_0000020CFA12C668.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R2 = load i32, i32* %4
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 %R2)
  store i32 42, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %5 = load i32, i32* %0
  ret i32 42
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L2:
  %0 = alloca i32
  store i32 (i32)* @fred, i32 (i32)** @f
  %R7 = load i32 (i32)*, i32 (i32)** @f
  %R8 = bitcast i32 (i32)* %R7 to i8*
  %R81 = bitcast i8* %R8 to i32 (i32)*
  %R82 = call i32 %R81(i32 24)
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %R82)
  store i32 0, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %1 = load i32, i32* %0
  ret i32 0
}

attributes #0 = { argmemonly nounwind }
