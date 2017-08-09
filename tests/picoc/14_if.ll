; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [11 x i8] c"a is true\0A\00"
@.str.1 = private constant [12 x i8] c"b is false\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define i32 @main() {
L0:
  %b_0000020BD289C858. = alloca i32
  %a_0000020BD289C778. = alloca i32
  %0 = alloca i32
  store i32 1, i32* %a_0000020BD289C778.
  %a_0000020BD289C778.1 = ptrtoint i32* %a_0000020BD289C778. to i64
  %1 = add i64 %a_0000020BD289C778.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 1, i32* %2
  br label %L1

L1:                                               ; preds = %L0
  %R2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0))
  br label %L2

L2:                                               ; preds = %L1
  store i32 0, i32* %b_0000020BD289C858.
  %b_0000020BD289C858.2 = ptrtoint i32* %b_0000020BD289C858. to i64
  %3 = add i64 %b_0000020BD289C858.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 0, i32* %4
  br label %L3

L3:                                               ; preds = %L2
  %R8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0))
  br label %L4

L4:                                               ; preds = %L3
  store i32 0, i32* %0
  br label %L5

L5:                                               ; preds = %L4
  %5 = load i32, i32* %0
  ret i32 0
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
