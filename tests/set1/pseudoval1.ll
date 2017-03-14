; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.avl_node = type { %struct.avl_node*, %struct.avl_node* }

define internal i32 @test_null_comp(i32 %ARG1, %struct.avl_node* %ARG2) {
L0:
  %0 = ptrtoint %struct.avl_node* %ARG2 to i64
  %R2 = icmp ne i64 %0, 0
  %R21 = zext i1 %R2 to i32
  %1 = icmp ne i32 %R21, 0
  %2 = icmp ne i32 %ARG1, 0
  %R4 = and i1 %1, %2
  %R42 = zext i1 %R4 to i32
  ret i32 %R42
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L1:
  %R6 = call i32 @test_null_comp(i32 1, %struct.avl_node* null)
  ret i32 %R6
}
