; ModuleID = 'out.bc'
source_filename = "sparse"

define i32 @main() {
L0:
  %buf_000002312B9CB588 = alloca [5 x i8]
  %R1 = bitcast [5 x i8]* %buf_000002312B9CB588 to i8*
  %0 = getelementptr inbounds i8, i8* %R1, inttoptr (i64 3 to i8*)
  %1 = getelementptr inbounds i8, i8* %R1, i64 3
  %2 = ptrtoint i8* %0 to i64
  %3 = ptrtoint i8* %1 to i64
  %R9 = icmp ne i64 %2, %3
  %R91 = zext i1 %R9 to i32
  ret i32 %R91
}
