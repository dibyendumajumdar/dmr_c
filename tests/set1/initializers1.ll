; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.foo = type { i64, i64 }

@.str = private constant [30 x i8] c"foo->i = %lld, foo->j = %lld\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @dosomething(%struct.foo* %ARG1) {
L0:
  %foo_000001E160EBCA88. = alloca %struct.foo*
  %foo_000001E160EBCA88.1 = ptrtoint %struct.foo** %foo_000001E160EBCA88. to i64
  %0 = add i64 %foo_000001E160EBCA88.1, 0
  %1 = inttoptr i64 %0 to %struct.foo**
  store %struct.foo* %ARG1, %struct.foo** %1
  %foo_000001E160EBCA88.2 = ptrtoint %struct.foo** %foo_000001E160EBCA88. to i64
  %2 = add i64 %foo_000001E160EBCA88.2, 0
  %3 = inttoptr i64 %2 to %struct.foo**
  %R2 = load %struct.foo*, %struct.foo** %3
  %R23 = ptrtoint %struct.foo* %R2 to i64
  %4 = add i64 %R23, 0
  %5 = inttoptr i64 %4 to i64*
  %R3 = load i64, i64* %5
  %foo_000001E160EBCA88.4 = ptrtoint %struct.foo** %foo_000001E160EBCA88. to i64
  %6 = add i64 %foo_000001E160EBCA88.4, 0
  %7 = inttoptr i64 %6 to %struct.foo**
  %R4 = load %struct.foo*, %struct.foo** %7
  %R45 = ptrtoint %struct.foo* %R4 to i64
  %8 = add i64 %R45, 8
  %9 = inttoptr i64 %8 to i64*
  %R5 = load i64, i64* %9
  %R6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i64 0, i64 0), i64 %R3, i64 %R5)
  br label %L1

L1:                                               ; preds = %L0
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L2:
  %bar_000001E160EBD188. = alloca %struct.foo
  %foo_000001E160EBD0A8. = alloca %struct.foo
  %0 = alloca i32
  %foo_000001E160EBD0A8.1 = bitcast %struct.foo* %foo_000001E160EBD0A8. to i8*
  call void @llvm.memset.p0i8.i32(i8* %foo_000001E160EBD0A8.1, i8 0, i32 16, i32 8, i1 false)
  %foo_000001E160EBD0A8.2 = ptrtoint %struct.foo* %foo_000001E160EBD0A8. to i64
  %1 = add i64 %foo_000001E160EBD0A8.2, 0
  %2 = inttoptr i64 %1 to i64*
  store i64 1, i64* %2
  %foo_000001E160EBD0A8.3 = ptrtoint %struct.foo* %foo_000001E160EBD0A8. to i64
  %3 = add i64 %foo_000001E160EBD0A8.3, 8
  %4 = inttoptr i64 %3 to i64*
  store i64 2, i64* %4
  %bar_000001E160EBD188.4 = bitcast %struct.foo* %bar_000001E160EBD188. to i8*
  call void @llvm.memset.p0i8.i32(i8* %bar_000001E160EBD188.4, i8 0, i32 16, i32 8, i1 false)
  %bar_000001E160EBD188.5 = ptrtoint %struct.foo* %bar_000001E160EBD188. to i64
  %5 = add i64 %bar_000001E160EBD188.5, 0
  %6 = inttoptr i64 %5 to i64*
  store i64 99, i64* %6
  call void @dosomething(%struct.foo* %foo_000001E160EBD0A8.)
  call void @dosomething(%struct.foo* %bar_000001E160EBD188.)
  store i32 0, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %7 = load i32, i32* %0
  ret i32 0
}

attributes #0 = { argmemonly nounwind }
