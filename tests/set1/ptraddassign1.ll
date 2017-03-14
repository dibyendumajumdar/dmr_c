; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [6 x i8] c"abcde\00"

define internal i8* @incr(i8* %ARG1) {
L0:
  %R3 = ptrtoint i8* %ARG1 to i64
  %R4 = add i64 %R3, 4
  %R5 = inttoptr i64 %R4 to i8*
  ret i8* %R5
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L1:
  %R10 = call i8* @incr(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0))
  %0 = getelementptr inbounds i8, i8* %R10, i64 0
  %load_target = load i8, i8* %0
  %R13 = sext i8 %load_target to i32
  %R15 = icmp ne i32 %R13, 101
  %R151 = zext i1 %R15 to i32
  ret i32 %R151
}
