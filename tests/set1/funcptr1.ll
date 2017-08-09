; ModuleID = 'out.bc'
source_filename = "dmrC"

@f = private global i32 (i32)* null, align 8

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @testfunc(i32 %ARG1) {
L0:
  %i_00000252467BD998. = alloca i32
  %0 = alloca i32
  %i_00000252467BD998.1 = ptrtoint i32* %i_00000252467BD998. to i64
  %1 = add i64 %i_00000252467BD998.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %i_00000252467BD998.2 = ptrtoint i32* %i_00000252467BD998. to i64
  %3 = add i64 %i_00000252467BD998.2, 0
  %4 = inttoptr i64 %3 to i32*
  %R1 = load i32, i32* %4
  %R2 = sub i32 %R1, 6
  store i32 %R2, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %5 = load i32, i32* %0
  ret i32 %R2
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L2:
  %argv_00000252467BE178. = alloca i8**
  %argc_00000252467BE098. = alloca i32
  %0 = alloca i32
  %argc_00000252467BE098.1 = ptrtoint i32* %argc_00000252467BE098. to i64
  %1 = add i64 %argc_00000252467BE098.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %argv_00000252467BE178.2 = ptrtoint i8*** %argv_00000252467BE178. to i64
  %3 = add i64 %argv_00000252467BE178.2, 0
  %4 = inttoptr i64 %3 to i8***
  store i8** %ARG2, i8*** %4
  store i32 (i32)* @testfunc, i32 (i32)** @f
  %R5 = load i32 (i32)*, i32 (i32)** @f
  %cond = icmp ne i32 (i32)* %R5, null
  br i1 %cond, label %L3, label %L4

L3:                                               ; preds = %L2
  %R6 = load i32 (i32)*, i32 (i32)** @f
  %R7 = bitcast i32 (i32)* %R6 to i8*
  %R73 = bitcast i8* %R7 to i32 (i32)*
  %R74 = call i32 %R73(i32 6)
  store i32 %R74, i32* %0
  br label %L5

L4:                                               ; preds = %L2
  store i32 1, i32* %0
  br label %L5

L5:                                               ; preds = %L4, %L3
  %5 = load i32, i32* %0
  ret i32 %5
}

attributes #0 = { argmemonly nounwind }
