; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [9 x i8] c"argc %d\0A\00"

define internal void @variadic(i32 %ARG1, ...) {
L0:
  %R3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 %ARG1)
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L1:
  call void (i32, ...) @variadic(i32 1, i32 2, i32 3)
  ret i32 0
}
