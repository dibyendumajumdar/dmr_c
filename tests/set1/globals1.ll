; ModuleID = 'out.bc'
source_filename = "sparse"

@once = private global i32 1, align 4

define internal i32 @value(i32* %ARG1) {
L0:
  %0 = bitcast i32* %ARG1 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 0
  %2 = bitcast i8* %1 to i32*
  %load_target = load i32, i32* %2
  ret i32 %load_target
}

define i32 @main() {
L1:
  %R5 = call i32 @value(i32* @once)
  %R7 = icmp ne i32 %R5, 1
  %R71 = zext i1 %R7 to i32
  ret i32 %R71
}
