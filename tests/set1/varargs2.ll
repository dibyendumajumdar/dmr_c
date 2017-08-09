; ModuleID = 'out.bc'
source_filename = "dmrC"

@.str = private constant [9 x i8] c"argc %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @variadic(i32 %ARG1, ...) {
L0:
  %argc_0000028E0FB7CAB8. = alloca i32
  %argc_0000028E0FB7CAB8.1 = ptrtoint i32* %argc_0000028E0FB7CAB8. to i64
  %0 = add i64 %argc_0000028E0FB7CAB8.1, 0
  %1 = inttoptr i64 %0 to i32*
  store i32 %ARG1, i32* %1
  %argc_0000028E0FB7CAB8.2 = ptrtoint i32* %argc_0000028E0FB7CAB8. to i64
  %2 = add i64 %argc_0000028E0FB7CAB8.2, 0
  %3 = inttoptr i64 %2 to i32*
  %R2 = load i32, i32* %3
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 %R2)
  br label %L1

L1:                                               ; preds = %L0
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L2:
  %0 = alloca i32
  call void (i32, ...) @variadic(i32 1, i32 2, i32 3)
  store i32 0, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %1 = load i32, i32* %0
  ret i32 0
}

attributes #0 = { argmemonly nounwind }
