; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [10 x i8] c"value %d\0A\00"

define internal i32 @print(i32* %ARG1) {
L0:
  %0 = ptrtoint i32* %ARG1 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  %load_target = load i32, i32* %2
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %load_target)
  %3 = ptrtoint i32* %ARG1 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i32*
  %load_target1 = load i32, i32* %5
  ret i32 %load_target1
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L1:
  %escapelist_000001F23FDCDBA8 = alloca i32
  store i32 -1, i32* %escapelist_000001F23FDCDBA8
  %0 = ptrtoint i32* %escapelist_000001F23FDCDBA8 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 -1, i32* %2
  %R9 = call i32 @print(i32* %escapelist_000001F23FDCDBA8)
  %R11 = icmp ne i32 %R9, -1
  %R111 = zext i1 %R11 to i32
  ret i32 %R111
}
