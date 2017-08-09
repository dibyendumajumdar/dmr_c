; ModuleID = 'out.bc'
source_filename = "dmrC"

@once = private global i32 1, align 4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @value(i32* %ARG1) {
L0:
  %p_0000012F81E6C4F8. = alloca i32*
  %0 = alloca i32
  %p_0000012F81E6C4F8.1 = ptrtoint i32** %p_0000012F81E6C4F8. to i64
  %1 = add i64 %p_0000012F81E6C4F8.1, 0
  %2 = inttoptr i64 %1 to i32**
  store i32* %ARG1, i32** %2
  %p_0000012F81E6C4F8.2 = ptrtoint i32** %p_0000012F81E6C4F8. to i64
  %3 = add i64 %p_0000012F81E6C4F8.2, 0
  %4 = inttoptr i64 %3 to i32**
  %R1 = load i32*, i32** %4
  %R13 = ptrtoint i32* %R1 to i64
  %5 = add i64 %R13, 0
  %6 = inttoptr i64 %5 to i32*
  %R2 = load i32, i32* %6
  store i32 %R2, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %7 = load i32, i32* %0
  ret i32 %R2
}

define i32 @main() {
L2:
  %0 = alloca i32
  %R5 = call i32 @value(i32* @once)
  %R6 = icmp eq i32 %R5, 1
  %R61 = zext i1 %R6 to i32
  %cond = icmp ne i32 %R61, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %1 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
