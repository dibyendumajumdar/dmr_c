; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.avl_node = type { %struct.avl_node*, %struct.avl_node* }

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i32 @test_null_comp(i32 %ARG1, %struct.avl_node* %ARG2) {
L0:
  %node_0000023EB1A5CA98. = alloca %struct.avl_node*
  %height_changed_0000023EB1A5C9B8. = alloca i32
  %0 = alloca i32
  %height_changed_0000023EB1A5C9B8.1 = ptrtoint i32* %height_changed_0000023EB1A5C9B8. to i64
  %1 = add i64 %height_changed_0000023EB1A5C9B8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %node_0000023EB1A5CA98.2 = ptrtoint %struct.avl_node** %node_0000023EB1A5CA98. to i64
  %3 = add i64 %node_0000023EB1A5CA98.2, 0
  %4 = inttoptr i64 %3 to %struct.avl_node**
  store %struct.avl_node* %ARG2, %struct.avl_node** %4
  %node_0000023EB1A5CA98.3 = ptrtoint %struct.avl_node** %node_0000023EB1A5CA98. to i64
  %5 = add i64 %node_0000023EB1A5CA98.3, 0
  %6 = inttoptr i64 %5 to %struct.avl_node**
  %R1 = load %struct.avl_node*, %struct.avl_node** %6
  %7 = ptrtoint %struct.avl_node* %R1 to i64
  %R2 = icmp ne i64 %7, 0
  %R24 = zext i1 %R2 to i32
  %height_changed_0000023EB1A5C9B8.5 = ptrtoint i32* %height_changed_0000023EB1A5C9B8. to i64
  %8 = add i64 %height_changed_0000023EB1A5C9B8.5, 0
  %9 = inttoptr i64 %8 to i32*
  %R3 = load i32, i32* %9
  %10 = icmp ne i32 %R24, 0
  %11 = icmp ne i32 %R3, 0
  %R4 = and i1 %10, %11
  %R46 = zext i1 %R4 to i32
  store i32 %R46, i32* %0
  br label %L1

L1:                                               ; preds = %L0
  %12 = load i32, i32* %0
  ret i32 %R46
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L2:
  %argv_0000023EB1A5D198. = alloca i8**
  %argc_0000023EB1A5D0B8. = alloca i32
  %0 = alloca i32
  %argc_0000023EB1A5D0B8.1 = ptrtoint i32* %argc_0000023EB1A5D0B8. to i64
  %1 = add i64 %argc_0000023EB1A5D0B8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %argv_0000023EB1A5D198.2 = ptrtoint i8*** %argv_0000023EB1A5D198. to i64
  %3 = add i64 %argv_0000023EB1A5D198.2, 0
  %4 = inttoptr i64 %3 to i8***
  store i8** %ARG2, i8*** %4
  %R6 = call i32 @test_null_comp(i32 1, %struct.avl_node* null)
  store i32 %R6, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %5 = load i32, i32* %0
  ret i32 %R6
}

attributes #0 = { argmemonly nounwind }
