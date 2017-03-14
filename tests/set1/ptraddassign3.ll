; ModuleID = 'out.bc'
source_filename = "sparse"

@.str = private constant [7 x i8] c"%p %p\0A\00"

define i32 @main() {
L0:
  %buf_000001676001B248 = alloca [5 x i8]
  %R1 = bitcast [5 x i8]* %buf_000001676001B248 to i8*
  %0 = getelementptr inbounds i8, i8* %R1, inttoptr (i64 3 to i8*)
  %1 = getelementptr inbounds i8, i8* %R1, i64 4
  %R9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i8* %1, i8* %0)
  %2 = getelementptr inbounds i8, i8* %R1, i64 3
  %3 = ptrtoint i8* %0 to i64
  %4 = ptrtoint i8* %2 to i64
  %R14 = icmp ne i64 %3, %4
  %R141 = zext i1 %R14 to i32
  ret i32 %R141
}

declare i32 @printf(i8*, ...)
