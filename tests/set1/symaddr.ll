; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [10 x i8] c"value %d\0A\00"

define internal i32 @print(i32* %ARG1) {
L0:
  %0 = bitcast i32* %ARG1 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 0
  %2 = bitcast i8* %1 to i32*
  %load_target = load i32, i32* %2
  %R4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 %load_target)
  %3 = bitcast i32* %ARG1 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %5 = bitcast i8* %4 to i32*
  %load_target1 = load i32, i32* %5
  ret i32 %load_target1
}

declare i32 @printf(i8*, ...)

define i32 @main() {
L1:
  %escapelist_000001EEF1E69378 = alloca i32
  store i32 -1, i32* %escapelist_000001EEF1E69378
  %0 = bitcast i32* %escapelist_000001EEF1E69378 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 0
  %2 = bitcast i8* %1 to i32*
  store i32 -1, i32* %2
  %R9 = call i32 @print(i32* %escapelist_000001EEF1E69378)
  %R11 = icmp ne i32 %R9, -1
  %R111 = zext i1 %R11 to i32
  ret i32 %R111
}
