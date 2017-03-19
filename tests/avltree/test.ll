; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.allocator_st = type { %struct.buffer_type_st*, %struct.link_st*, i8*, i8*, i32, i32 }
%struct.buffer_type_st = type { %struct.buffer_type_st*, i8* }
%struct.link_st = type { %struct.link_st* }
%struct.AVLNode_st = type { %struct.AVLNode_st*, %struct.AVLNode_st*, %struct.AVLNode_st*, i32 }
%struct.avltree = type { %struct.avl_vtbl*, i8*, i32, i32, %struct.allocator_st* }
%struct.avl_vtbl = type { i32 (i8*, i8*)*, void (i8*, i8*)*, void (i8*, i8*)*, void (i8*)* }
%struct.record = type { i32 }

@A = private global %struct.allocator_st zeroinitializer, align 8
@Memory = private global [65536 x i8] zeroinitializer, align 1
@Node = private global %struct.buffer_type_st zeroinitializer, align 8
@once = private global i32 0, align 4
@.str = private constant [15 x i8] c"out of memory\0A\00"
@.str.1 = private constant [15 x i8] c"out of memory\0A\00"
@"<noident>" = private global [20 x i8] c"agqwewbxklpfgytuorz\00", align 1
@randomletters = private global [20 x i8]* @"<noident>", align 8
@.str.2 = private constant [4 x i8] c"%d\0A\00"

define internal i8* @memcpy(i8* %ARG1, i8* %ARG2, i32 %ARG3) {
L0:
  %0 = alloca i32
  %1 = alloca i8*
  %2 = alloca i8*
  store i32 %ARG3, i32* %0
  store i8* %ARG1, i8** %2
  store i8* %ARG2, i8** %1
  br label %L1

L1:                                               ; preds = %L2, %L0
  %3 = load i32, i32* %0
  %R6 = add i32 %3, -1
  %R7 = icmp sgt i32 %3, 0
  %R71 = zext i1 %R7 to i32
  store i32 %R6, i32* %0
  %cond = icmp ne i32 %R71, 0
  br i1 %cond, label %L2, label %L3

L2:                                               ; preds = %L1
  %4 = load i8*, i8** %1
  %5 = getelementptr inbounds i8, i8* %4, inttoptr (i64 1 to i8*)
  %6 = getelementptr inbounds i8, i8* %4, i64 0
  %load_target = load i8, i8* %6
  %7 = load i8*, i8** %2
  %8 = getelementptr inbounds i8, i8* %7, inttoptr (i64 1 to i8*)
  %9 = getelementptr inbounds i8, i8* %7, i64 0
  store i8 %load_target, i8* %9
  store i8* %8, i8** %2
  store i8* %5, i8** %1
  br label %L1

L3:                                               ; preds = %L1
  ret i8* %ARG1
}

define %struct.allocator_st* @new_allocator(i32 %ARG1, i32 %ARG2) {
L4:
  %R17 = mul i32 %ARG1, %ARG2
  %R18 = sext i32 %R17 to i64
  %R19 = icmp ugt i64 %R18, 65536
  %R191 = zext i1 %R19 to i32
  %cond = icmp ne i32 %R191, 0
  br i1 %cond, label %L5, label %L6

L5:                                               ; preds = %L4
  %R21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 1)
  br label %L6

L6:                                               ; preds = %L5, %L4
  store %struct.buffer_type_st* null, %struct.buffer_type_st** getelementptr inbounds (%struct.allocator_st, %struct.allocator_st* @A, i32 0, i32 0)
  store %struct.link_st* null, %struct.link_st** bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.allocator_st* @A to i8*), i64 8) to %struct.link_st**)
  store i8* null, i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.allocator_st* @A to i8*), i64 16) to i8**)
  store i8* null, i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.allocator_st* @A to i8*), i64 24) to i8**)
  store i32 %ARG1, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.allocator_st* @A to i8*), i64 32) to i32*)
  store i32 %ARG2, i32* bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.allocator_st* @A to i8*), i64 36) to i32*)
  ret %struct.allocator_st* @A
}

declare i32 @printf(i8*, ...)

declare void @exit(i32)

define void @grow_allocator(%struct.allocator_st* %ARG1) {
L7:
  %load_target = load i32, i32* @once
  %cond = icmp ne i32 %load_target, 0
  br i1 %cond, label %L8, label %L9

L8:                                               ; preds = %L7
  %R35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0))
  call void @exit(i32 1)
  br label %L10

L9:                                               ; preds = %L7
  store i32 1, i32* @once
  br label %L10

L10:                                              ; preds = %L9, %L8
  store i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @Memory, i32 0, i32 0), i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.buffer_type_st* @Node to i8*), i64 8) to i8**)
  %0 = bitcast %struct.allocator_st* %ARG1 to %struct.buffer_type_st**
  %1 = bitcast %struct.buffer_type_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to %struct.buffer_type_st**
  %load_target1 = load %struct.buffer_type_st*, %struct.buffer_type_st** %3
  store %struct.buffer_type_st* %load_target1, %struct.buffer_type_st** getelementptr inbounds (%struct.buffer_type_st, %struct.buffer_type_st* @Node, i32 0, i32 0)
  %4 = bitcast %struct.allocator_st* %ARG1 to %struct.buffer_type_st**
  %5 = bitcast %struct.buffer_type_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to %struct.buffer_type_st**
  store %struct.buffer_type_st* @Node, %struct.buffer_type_st** %7
  %load_target2 = load i8*, i8** bitcast (i8* getelementptr inbounds (i8, i8* bitcast (%struct.buffer_type_st* @Node to i8*), i64 8) to i8**)
  %8 = bitcast %struct.allocator_st* %ARG1 to i8**
  %9 = bitcast i8** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 16
  %11 = bitcast i8* %10 to i8**
  store i8* %load_target2, i8** %11
  %12 = bitcast %struct.allocator_st* %ARG1 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 32
  %15 = bitcast i8* %14 to i32*
  %load_target3 = load i32, i32* %15
  %16 = bitcast %struct.allocator_st* %ARG1 to i32*
  %17 = bitcast i32* %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 36
  %19 = bitcast i8* %18 to i32*
  %load_target4 = load i32, i32* %19
  %R54 = mul i32 %load_target3, %load_target4
  %R55 = sext i32 %R54 to i64
  %20 = getelementptr inbounds i8, i8* %load_target2, i64 %R55
  %21 = bitcast %struct.allocator_st* %ARG1 to i8**
  %22 = bitcast i8** %21 to i8*
  %23 = getelementptr inbounds i8, i8* %22, i64 24
  %24 = bitcast i8* %23 to i8**
  store i8* %20, i8** %24
  ret void
}

define i8* @alloc_node(%struct.allocator_st* %ARG1) {
L11:
  %0 = alloca i8*
  %1 = bitcast %struct.allocator_st* %ARG1 to %struct.link_st**
  %2 = bitcast %struct.link_st** %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 8
  %4 = bitcast i8* %3 to %struct.link_st**
  %load_target = load %struct.link_st*, %struct.link_st** %4
  %cond = icmp ne %struct.link_st* %load_target, null
  br i1 %cond, label %L12, label %L13

L12:                                              ; preds = %L11
  %5 = bitcast %struct.link_st* %load_target to %struct.link_st**
  %6 = bitcast %struct.link_st** %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = bitcast i8* %7 to %struct.link_st**
  %load_target1 = load %struct.link_st*, %struct.link_st** %8
  %9 = bitcast %struct.allocator_st* %ARG1 to %struct.link_st**
  %10 = bitcast %struct.link_st** %9 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 8
  %12 = bitcast i8* %11 to %struct.link_st**
  store %struct.link_st* %load_target1, %struct.link_st** %12
  %R68 = bitcast %struct.link_st* %load_target to i8*
  store i8* %R68, i8** %0
  br label %L16

L13:                                              ; preds = %L11
  %13 = bitcast %struct.allocator_st* %ARG1 to i8**
  %14 = bitcast i8** %13 to i8*
  %15 = getelementptr inbounds i8, i8* %14, i64 16
  %16 = bitcast i8* %15 to i8**
  %load_target2 = load i8*, i8** %16
  %17 = bitcast %struct.allocator_st* %ARG1 to i8**
  %18 = bitcast i8** %17 to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 24
  %20 = bitcast i8* %19 to i8**
  %load_target3 = load i8*, i8** %20
  %21 = ptrtoint i8* %load_target2 to i64
  %22 = ptrtoint i8* %load_target3 to i64
  %R74 = icmp eq i64 %21, %22
  %R744 = zext i1 %R74 to i32
  %cond5 = icmp ne i32 %R744, 0
  br i1 %cond5, label %L14, label %L15

L14:                                              ; preds = %L13
  call void @grow_allocator(%struct.allocator_st* %ARG1)
  br label %L15

L15:                                              ; preds = %L14, %L13
  %23 = bitcast %struct.allocator_st* %ARG1 to i8**
  %24 = bitcast i8** %23 to i8*
  %25 = getelementptr inbounds i8, i8* %24, i64 16
  %26 = bitcast i8* %25 to i8**
  %load_target6 = load i8*, i8** %26
  %27 = bitcast %struct.allocator_st* %ARG1 to i32*
  %28 = bitcast i32* %27 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 32
  %30 = bitcast i8* %29 to i32*
  %load_target7 = load i32, i32* %30
  %R81 = sext i32 %load_target7 to i64
  %R84 = ptrtoint i8* %load_target6 to i64
  %R85 = add i64 %R84, %R81
  %R86 = inttoptr i64 %R85 to i8*
  %31 = bitcast %struct.allocator_st* %ARG1 to i8**
  %32 = bitcast i8** %31 to i8*
  %33 = getelementptr inbounds i8, i8* %32, i64 16
  %34 = bitcast i8* %33 to i8**
  store i8* %R86, i8** %34
  store i8* %load_target6, i8** %0
  br label %L16

L16:                                              ; preds = %L15, %L12
  %35 = load i8*, i8** %0
  ret i8* %35
}

define void @dealloc_node(%struct.allocator_st* %ARG1, i8* %ARG2) {
L17:
  %0 = bitcast %struct.allocator_st* %ARG1 to %struct.link_st**
  %1 = bitcast %struct.link_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to %struct.link_st**
  %load_target = load %struct.link_st*, %struct.link_st** %3
  %R91 = bitcast i8* %ARG2 to %struct.link_st*
  %4 = bitcast %struct.link_st* %R91 to %struct.link_st**
  %5 = bitcast %struct.link_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to %struct.link_st**
  store %struct.link_st* %load_target, %struct.link_st** %7
  %8 = bitcast %struct.allocator_st* %ARG1 to %struct.link_st**
  %9 = bitcast %struct.link_st** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 8
  %11 = bitcast i8* %10 to %struct.link_st**
  store %struct.link_st* %R91, %struct.link_st** %11
  ret void
}

define void @destroy_allocator(%struct.allocator_st* %ARG1) {
L18:
  ret void
}

define void @AVL_SetRight(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %ARG2) {
L19:
  %0 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %1 = bitcast %struct.AVLNode_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 16
  %3 = bitcast i8* %2 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG2, %struct.AVLNode_st** %3
  %cond = icmp ne %struct.AVLNode_st* %ARG2, null
  br i1 %cond, label %L20, label %L21

L20:                                              ; preds = %L19
  %4 = bitcast %struct.AVLNode_st* %ARG2 to %struct.AVLNode_st**
  %5 = bitcast %struct.AVLNode_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %7
  br label %L21

L21:                                              ; preds = %L20, %L19
  ret void
}

define void @AVL_SetLeft(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %ARG2) {
L22:
  %0 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %1 = bitcast %struct.AVLNode_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG2, %struct.AVLNode_st** %3
  %cond = icmp ne %struct.AVLNode_st* %ARG2, null
  br i1 %cond, label %L23, label %L24

L23:                                              ; preds = %L22
  %4 = bitcast %struct.AVLNode_st* %ARG2 to %struct.AVLNode_st**
  %5 = bitcast %struct.AVLNode_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %7
  br label %L24

L24:                                              ; preds = %L23, %L22
  ret void
}

define %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1) {
L25:
  %0 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %1 = bitcast %struct.AVLNode_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 16
  %3 = bitcast i8* %2 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %4 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %5 = bitcast %struct.AVLNode_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %cond = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond, label %L26, label %L29

L26:                                              ; preds = %L25
  %8 = bitcast %struct.AVLNode_st* %load_target1 to %struct.AVLNode_st**
  %9 = bitcast %struct.AVLNode_st** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 8
  %11 = bitcast i8* %10 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %11
  %12 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %13 = ptrtoint %struct.AVLNode_st* %load_target2 to i64
  %R114 = icmp eq i64 %12, %13
  %R1143 = zext i1 %R114 to i32
  %cond4 = icmp ne i32 %R1143, 0
  br i1 %cond4, label %L27, label %L28

L27:                                              ; preds = %L26
  call void @AVL_SetLeft(%struct.AVLNode_st* %load_target1, %struct.AVLNode_st* %load_target)
  br label %L30

L28:                                              ; preds = %L26
  call void @AVL_SetRight(%struct.AVLNode_st* %load_target1, %struct.AVLNode_st* %load_target)
  br label %L30

L29:                                              ; preds = %L25
  %14 = bitcast %struct.AVLNode_st* %load_target to %struct.AVLNode_st**
  %15 = bitcast %struct.AVLNode_st** %14 to i8*
  %16 = getelementptr inbounds i8, i8* %15, i64 0
  %17 = bitcast i8* %16 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %17
  br label %L30

L30:                                              ; preds = %L29, %L28, %L27
  %18 = bitcast %struct.AVLNode_st* %load_target to %struct.AVLNode_st**
  %19 = bitcast %struct.AVLNode_st** %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 8
  %21 = bitcast i8* %20 to %struct.AVLNode_st**
  %load_target5 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  call void @AVL_SetRight(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %load_target5)
  call void @AVL_SetLeft(%struct.AVLNode_st* %load_target, %struct.AVLNode_st* %ARG1)
  ret %struct.AVLNode_st* %load_target
}

define %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1) {
L31:
  %0 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %1 = bitcast %struct.AVLNode_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %4 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %5 = bitcast %struct.AVLNode_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %cond = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond, label %L32, label %L35

L32:                                              ; preds = %L31
  %8 = bitcast %struct.AVLNode_st* %load_target1 to %struct.AVLNode_st**
  %9 = bitcast %struct.AVLNode_st** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 8
  %11 = bitcast i8* %10 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %11
  %12 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %13 = ptrtoint %struct.AVLNode_st* %load_target2 to i64
  %R138 = icmp eq i64 %12, %13
  %R1383 = zext i1 %R138 to i32
  %cond4 = icmp ne i32 %R1383, 0
  br i1 %cond4, label %L33, label %L34

L33:                                              ; preds = %L32
  call void @AVL_SetLeft(%struct.AVLNode_st* %load_target1, %struct.AVLNode_st* %load_target)
  br label %L36

L34:                                              ; preds = %L32
  call void @AVL_SetRight(%struct.AVLNode_st* %load_target1, %struct.AVLNode_st* %load_target)
  br label %L36

L35:                                              ; preds = %L31
  %14 = bitcast %struct.AVLNode_st* %load_target to %struct.AVLNode_st**
  %15 = bitcast %struct.AVLNode_st** %14 to i8*
  %16 = getelementptr inbounds i8, i8* %15, i64 0
  %17 = bitcast i8* %16 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %17
  br label %L36

L36:                                              ; preds = %L35, %L34, %L33
  %18 = bitcast %struct.AVLNode_st* %load_target to %struct.AVLNode_st**
  %19 = bitcast %struct.AVLNode_st** %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 16
  %21 = bitcast i8* %20 to %struct.AVLNode_st**
  %load_target5 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  call void @AVL_SetLeft(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %load_target5)
  call void @AVL_SetRight(%struct.AVLNode_st* %load_target, %struct.AVLNode_st* %ARG1)
  ret %struct.AVLNode_st* %load_target
}

define %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %ARG1) {
L37:
  %0 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %1 = bitcast %struct.AVLNode_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %4 = bitcast %struct.AVLNode_st* %load_target to %struct.AVLNode_st**
  %5 = bitcast %struct.AVLNode_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 16
  %7 = bitcast i8* %6 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %8 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %9 = bitcast i32* %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 24
  %11 = bitcast i8* %10 to i32*
  %load_target2 = load i32, i32* %11
  switch i32 %load_target2, label %L41 [
    i32 0, label %L39
    i32 1, label %L40
    i32 2, label %L38
  ]

L38:                                              ; preds = %L37
  %12 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 24
  %15 = bitcast i8* %14 to i32*
  store i32 0, i32* %15
  %16 = bitcast %struct.AVLNode_st* %load_target to i32*
  %17 = bitcast i32* %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 24
  %19 = bitcast i8* %18 to i32*
  store i32 1, i32* %19
  br label %L41

L39:                                              ; preds = %L37
  %20 = bitcast %struct.AVLNode_st* %load_target to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 24
  %23 = bitcast i8* %22 to i32*
  store i32 0, i32* %23
  %24 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %25 = bitcast i32* %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 24
  %27 = bitcast i8* %26 to i32*
  store i32 0, i32* %27
  br label %L41

L40:                                              ; preds = %L37
  %28 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %29 = bitcast i32* %28 to i8*
  %30 = getelementptr inbounds i8, i8* %29, i64 24
  %31 = bitcast i8* %30 to i32*
  store i32 2, i32* %31
  %32 = bitcast %struct.AVLNode_st* %load_target to i32*
  %33 = bitcast i32* %32 to i8*
  %34 = getelementptr inbounds i8, i8* %33, i64 24
  %35 = bitcast i8* %34 to i32*
  store i32 0, i32* %35
  br label %L41

L41:                                              ; preds = %L40, %L39, %L38, %L37
  %36 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %37 = bitcast i32* %36 to i8*
  %38 = getelementptr inbounds i8, i8* %37, i64 24
  %39 = bitcast i8* %38 to i32*
  store i32 0, i32* %39
  %R168 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %load_target)
  call void @AVL_SetLeft(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %R168)
  %R170 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1)
  ret %struct.AVLNode_st* %R170
}

define %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %ARG1) {
L42:
  %0 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %1 = bitcast %struct.AVLNode_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 16
  %3 = bitcast i8* %2 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %4 = bitcast %struct.AVLNode_st* %load_target to %struct.AVLNode_st**
  %5 = bitcast %struct.AVLNode_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 8
  %7 = bitcast i8* %6 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %8 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %9 = bitcast i32* %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 24
  %11 = bitcast i8* %10 to i32*
  %load_target2 = load i32, i32* %11
  switch i32 %load_target2, label %L46 [
    i32 0, label %L44
    i32 1, label %L45
    i32 2, label %L43
  ]

L43:                                              ; preds = %L42
  %12 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 24
  %15 = bitcast i8* %14 to i32*
  store i32 1, i32* %15
  %16 = bitcast %struct.AVLNode_st* %load_target to i32*
  %17 = bitcast i32* %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 24
  %19 = bitcast i8* %18 to i32*
  store i32 0, i32* %19
  br label %L46

L44:                                              ; preds = %L42
  %20 = bitcast %struct.AVLNode_st* %load_target to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 24
  %23 = bitcast i8* %22 to i32*
  store i32 0, i32* %23
  %24 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %25 = bitcast i32* %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 24
  %27 = bitcast i8* %26 to i32*
  store i32 0, i32* %27
  br label %L46

L45:                                              ; preds = %L42
  %28 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %29 = bitcast i32* %28 to i8*
  %30 = getelementptr inbounds i8, i8* %29, i64 24
  %31 = bitcast i8* %30 to i32*
  store i32 0, i32* %31
  %32 = bitcast %struct.AVLNode_st* %load_target to i32*
  %33 = bitcast i32* %32 to i8*
  %34 = getelementptr inbounds i8, i8* %33, i64 24
  %35 = bitcast i8* %34 to i32*
  store i32 2, i32* %35
  br label %L46

L46:                                              ; preds = %L45, %L44, %L43, %L42
  %36 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %37 = bitcast i32* %36 to i8*
  %38 = getelementptr inbounds i8, i8* %37, i64 24
  %39 = bitcast i8* %38 to i32*
  store i32 0, i32* %39
  %R188 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %load_target)
  call void @AVL_SetRight(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %R188)
  %R190 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1)
  ret %struct.AVLNode_st* %R190
}

define %struct.AVLNode_st* @AVL_RebalanceHeavierLeft(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L47:
  %0 = alloca %struct.AVLNode_st*
  %1 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %2 = bitcast i32* %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 24
  %4 = bitcast i8* %3 to i32*
  %load_target = load i32, i32* %4
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target, label %L54 [
    i32 0, label %L49
    i32 1, label %L50
    i32 2, label %L48
  ]

L48:                                              ; preds = %L47
  %5 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 24
  %8 = bitcast i8* %7 to i32*
  store i32 0, i32* %8
  %9 = bitcast i32* %ARG2 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = bitcast i8* %10 to i32*
  store i32 0, i32* %11
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L54

L49:                                              ; preds = %L47
  %12 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 24
  %15 = bitcast i8* %14 to i32*
  store i32 1, i32* %15
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L54

L50:                                              ; preds = %L47
  %16 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %17 = bitcast %struct.AVLNode_st** %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 8
  %19 = bitcast i8* %18 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  %20 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 24
  %23 = bitcast i8* %22 to i32*
  %load_target2 = load i32, i32* %23
  switch i32 %load_target2, label %L53 [
    i32 1, label %L51
    i32 2, label %L52
  ]

L51:                                              ; preds = %L50
  %24 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %25 = bitcast i32* %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 24
  %27 = bitcast i8* %26 to i32*
  store i32 0, i32* %27
  %28 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %29 = bitcast i32* %28 to i8*
  %30 = getelementptr inbounds i8, i8* %29, i64 24
  %31 = bitcast i8* %30 to i32*
  store i32 0, i32* %31
  %R206 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R206, %struct.AVLNode_st** %0
  br label %L53

L52:                                              ; preds = %L50
  %R208 = call %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R208, %struct.AVLNode_st** %0
  br label %L53

L53:                                              ; preds = %L52, %L51, %L50
  %32 = bitcast i32* %ARG2 to i8*
  %33 = getelementptr inbounds i8, i8* %32, i64 0
  %34 = bitcast i8* %33 to i32*
  store i32 0, i32* %34
  br label %L54

L54:                                              ; preds = %L53, %L49, %L48, %L47
  %35 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %35
}

define %struct.AVLNode_st* @AVL_RebalanceHeavierRight(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L55:
  %0 = alloca %struct.AVLNode_st*
  %1 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %2 = bitcast i32* %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 24
  %4 = bitcast i8* %3 to i32*
  %load_target = load i32, i32* %4
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target, label %L62 [
    i32 0, label %L57
    i32 1, label %L56
    i32 2, label %L58
  ]

L56:                                              ; preds = %L55
  %5 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 24
  %8 = bitcast i8* %7 to i32*
  store i32 0, i32* %8
  %9 = bitcast i32* %ARG2 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = bitcast i8* %10 to i32*
  store i32 0, i32* %11
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L62

L57:                                              ; preds = %L55
  %12 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 24
  %15 = bitcast i8* %14 to i32*
  store i32 2, i32* %15
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L62

L58:                                              ; preds = %L55
  %16 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %17 = bitcast %struct.AVLNode_st** %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 16
  %19 = bitcast i8* %18 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  %20 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 24
  %23 = bitcast i8* %22 to i32*
  %load_target2 = load i32, i32* %23
  switch i32 %load_target2, label %L61 [
    i32 1, label %L60
    i32 2, label %L59
  ]

L59:                                              ; preds = %L58
  %24 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %25 = bitcast i32* %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 24
  %27 = bitcast i8* %26 to i32*
  store i32 0, i32* %27
  %28 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %29 = bitcast i32* %28 to i8*
  %30 = getelementptr inbounds i8, i8* %29, i64 24
  %31 = bitcast i8* %30 to i32*
  store i32 0, i32* %31
  %R225 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R225, %struct.AVLNode_st** %0
  br label %L61

L60:                                              ; preds = %L58
  %R227 = call %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R227, %struct.AVLNode_st** %0
  br label %L61

L61:                                              ; preds = %L60, %L59, %L58
  %32 = bitcast i32* %ARG2 to i8*
  %33 = getelementptr inbounds i8, i8* %32, i64 0
  %34 = bitcast i8* %33 to i32*
  store i32 0, i32* %34
  br label %L62

L62:                                              ; preds = %L61, %L57, %L56, %L55
  %35 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %35
}

define %struct.AVLNode_st* @AVL_RebalanceShorterLeft(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L63:
  %0 = alloca %struct.AVLNode_st*
  %1 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %2 = bitcast i32* %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 24
  %4 = bitcast i8* %3 to i32*
  %load_target = load i32, i32* %4
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target, label %L70 [
    i32 0, label %L64
    i32 1, label %L65
    i32 2, label %L66
  ]

L64:                                              ; preds = %L63
  %5 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 24
  %8 = bitcast i8* %7 to i32*
  store i32 2, i32* %8
  %9 = bitcast i32* %ARG2 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = bitcast i8* %10 to i32*
  store i32 0, i32* %11
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L70

L65:                                              ; preds = %L63
  %12 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 24
  %15 = bitcast i8* %14 to i32*
  store i32 0, i32* %15
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L70

L66:                                              ; preds = %L63
  %16 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %17 = bitcast %struct.AVLNode_st** %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 16
  %19 = bitcast i8* %18 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  %20 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 24
  %23 = bitcast i8* %22 to i32*
  %load_target2 = load i32, i32* %23
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target2, label %L70 [
    i32 0, label %L67
    i32 1, label %L69
    i32 2, label %L68
  ]

L67:                                              ; preds = %L66
  %24 = bitcast i32* %ARG2 to i8*
  %25 = getelementptr inbounds i8, i8* %24, i64 0
  %26 = bitcast i8* %25 to i32*
  store i32 0, i32* %26
  %27 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %28 = bitcast i32* %27 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 24
  %30 = bitcast i8* %29 to i32*
  store i32 1, i32* %30
  %R244 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R244, %struct.AVLNode_st** %0
  br label %L70

L68:                                              ; preds = %L66
  %31 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %32 = bitcast i32* %31 to i8*
  %33 = getelementptr inbounds i8, i8* %32, i64 24
  %34 = bitcast i8* %33 to i32*
  store i32 0, i32* %34
  %35 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %36 = bitcast i32* %35 to i8*
  %37 = getelementptr inbounds i8, i8* %36, i64 24
  %38 = bitcast i8* %37 to i32*
  store i32 0, i32* %38
  %R248 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R248, %struct.AVLNode_st** %0
  br label %L70

L69:                                              ; preds = %L66
  %R250 = call %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R250, %struct.AVLNode_st** %0
  br label %L70

L70:                                              ; preds = %L69, %L68, %L67, %L66, %L65, %L64, %L63
  %39 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %39
}

define %struct.AVLNode_st* @AVL_RebalanceShorterRight(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L71:
  %0 = alloca %struct.AVLNode_st*
  %1 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %2 = bitcast i32* %1 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 24
  %4 = bitcast i8* %3 to i32*
  %load_target = load i32, i32* %4
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target, label %L78 [
    i32 0, label %L72
    i32 1, label %L74
    i32 2, label %L73
  ]

L72:                                              ; preds = %L71
  %5 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %6 = bitcast i32* %5 to i8*
  %7 = getelementptr inbounds i8, i8* %6, i64 24
  %8 = bitcast i8* %7 to i32*
  store i32 1, i32* %8
  %9 = bitcast i32* %ARG2 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = bitcast i8* %10 to i32*
  store i32 0, i32* %11
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L78

L73:                                              ; preds = %L71
  %12 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 24
  %15 = bitcast i8* %14 to i32*
  store i32 0, i32* %15
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L78

L74:                                              ; preds = %L71
  %16 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %17 = bitcast %struct.AVLNode_st** %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 8
  %19 = bitcast i8* %18 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  %20 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 24
  %23 = bitcast i8* %22 to i32*
  %load_target2 = load i32, i32* %23
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target2, label %L78 [
    i32 0, label %L75
    i32 1, label %L76
    i32 2, label %L77
  ]

L75:                                              ; preds = %L74
  %24 = bitcast i32* %ARG2 to i8*
  %25 = getelementptr inbounds i8, i8* %24, i64 0
  %26 = bitcast i8* %25 to i32*
  store i32 0, i32* %26
  %27 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %28 = bitcast i32* %27 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 24
  %30 = bitcast i8* %29 to i32*
  store i32 2, i32* %30
  %R266 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R266, %struct.AVLNode_st** %0
  br label %L78

L76:                                              ; preds = %L74
  %31 = bitcast %struct.AVLNode_st* %load_target1 to i32*
  %32 = bitcast i32* %31 to i8*
  %33 = getelementptr inbounds i8, i8* %32, i64 24
  %34 = bitcast i8* %33 to i32*
  store i32 0, i32* %34
  %35 = bitcast %struct.AVLNode_st* %ARG1 to i32*
  %36 = bitcast i32* %35 to i8*
  %37 = getelementptr inbounds i8, i8* %36, i64 24
  %38 = bitcast i8* %37 to i32*
  store i32 0, i32* %38
  %R270 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R270, %struct.AVLNode_st** %0
  br label %L78

L77:                                              ; preds = %L74
  %R272 = call %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R272, %struct.AVLNode_st** %0
  br label %L78

L78:                                              ; preds = %L77, %L76, %L75, %L74, %L73, %L72, %L71
  %39 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %39
}

define i32 @AVL_Height(%struct.AVLNode_st* %ARG1) {
L79:
  %0 = alloca i32
  %1 = alloca i32
  %2 = alloca i32
  %3 = alloca i32
  store i32 0, i32* %0
  store i32 0, i32* %1
  %cond = icmp ne %struct.AVLNode_st* %ARG1, null
  br i1 %cond, label %L81, label %L80

L80:                                              ; preds = %L79
  store i32 0, i32* %3
  br label %L89

L81:                                              ; preds = %L79
  %4 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %5 = bitcast %struct.AVLNode_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 8
  %7 = bitcast i8* %6 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %cond1 = icmp ne %struct.AVLNode_st* %load_target, null
  br i1 %cond1, label %L82, label %L83

L82:                                              ; preds = %L81
  %R282 = call i32 @AVL_Height(%struct.AVLNode_st* %load_target)
  store i32 %R282, i32* %0
  br label %L83

L83:                                              ; preds = %L82, %L81
  %8 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %9 = bitcast %struct.AVLNode_st** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 16
  %11 = bitcast i8* %10 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %11
  %cond3 = icmp ne %struct.AVLNode_st* %load_target2, null
  br i1 %cond3, label %L84, label %L85

L84:                                              ; preds = %L83
  %R287 = call i32 @AVL_Height(%struct.AVLNode_st* %load_target2)
  store i32 %R287, i32* %1
  br label %L85

L85:                                              ; preds = %L84, %L83
  %12 = load i32, i32* %0
  %13 = load i32, i32* %1
  %R290 = icmp sgt i32 %12, %13
  %R2904 = zext i1 %R290 to i32
  %cond5 = icmp ne i32 %R2904, 0
  br i1 %cond5, label %L86, label %L87

L86:                                              ; preds = %L85
  %R292 = add i32 %12, 1
  store i32 %R292, i32* %2
  br label %L88

L87:                                              ; preds = %L85
  %R298 = add i32 %13, 1
  store i32 %R298, i32* %2
  br label %L88

L88:                                              ; preds = %L87, %L86
  %14 = load i32, i32* %2
  store i32 %14, i32* %3
  br label %L89

L89:                                              ; preds = %L88, %L80
  %15 = load i32, i32* %3
  ret i32 %15
}

define i8* @AVLTree_FindFirst(%struct.avltree* %ARG1) {
L90:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca i8*
  %2 = bitcast %struct.avltree* %ARG1 to i8**
  %3 = bitcast i8** %2 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 8
  %5 = bitcast i8* %4 to i8**
  %load_target = load i8*, i8** %5
  %cond = icmp ne i8* %load_target, null
  br i1 %cond, label %L91, label %L95

L91:                                              ; preds = %L90
  %R308 = bitcast i8* %load_target to %struct.AVLNode_st*
  store %struct.AVLNode_st* %R308, %struct.AVLNode_st** %0
  br label %L92

L92:                                              ; preds = %L93, %L91
  %6 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %7 = bitcast %struct.AVLNode_st* %6 to %struct.AVLNode_st**
  %8 = bitcast %struct.AVLNode_st** %7 to i8*
  %9 = getelementptr inbounds i8, i8* %8, i64 8
  %10 = bitcast i8* %9 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %cond2 = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond2, label %L93, label %L94

L93:                                              ; preds = %L92
  store %struct.AVLNode_st* %load_target1, %struct.AVLNode_st** %0
  br label %L92

L94:                                              ; preds = %L92
  %11 = bitcast %struct.AVLNode_st* %6 to i8*
  %12 = getelementptr inbounds i8, i8* %11, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %13 = bitcast i8* %12 to %struct.AVLNode_st*
  %R316 = bitcast %struct.AVLNode_st* %13 to i8*
  store i8* %R316, i8** %1
  br label %L96

L95:                                              ; preds = %L90
  store i8* null, i8** %1
  br label %L96

L96:                                              ; preds = %L95, %L94
  %14 = load i8*, i8** %1
  ret i8* %14
}

define i8* @AVLTree_FindLast(%struct.avltree* %ARG1) {
L97:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca i8*
  %2 = bitcast %struct.avltree* %ARG1 to i8**
  %3 = bitcast i8** %2 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 8
  %5 = bitcast i8* %4 to i8**
  %load_target = load i8*, i8** %5
  %cond = icmp ne i8* %load_target, null
  br i1 %cond, label %L98, label %L102

L98:                                              ; preds = %L97
  %R322 = bitcast i8* %load_target to %struct.AVLNode_st*
  store %struct.AVLNode_st* %R322, %struct.AVLNode_st** %0
  br label %L99

L99:                                              ; preds = %L100, %L98
  %6 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %7 = bitcast %struct.AVLNode_st* %6 to %struct.AVLNode_st**
  %8 = bitcast %struct.AVLNode_st** %7 to i8*
  %9 = getelementptr inbounds i8, i8* %8, i64 16
  %10 = bitcast i8* %9 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %cond2 = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond2, label %L100, label %L101

L100:                                             ; preds = %L99
  store %struct.AVLNode_st* %load_target1, %struct.AVLNode_st** %0
  br label %L99

L101:                                             ; preds = %L99
  %11 = bitcast %struct.AVLNode_st* %6 to i8*
  %12 = getelementptr inbounds i8, i8* %11, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %13 = bitcast i8* %12 to %struct.AVLNode_st*
  %R330 = bitcast %struct.AVLNode_st* %13 to i8*
  store i8* %R330, i8** %1
  br label %L103

L102:                                             ; preds = %L97
  store i8* null, i8** %1
  br label %L103

L103:                                             ; preds = %L102, %L101
  %14 = load i8*, i8** %1
  ret i8* %14
}

define i8* @AVLTree_FindNext(%struct.avltree* %ARG1, i8* %ARG2) {
L104:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca %struct.AVLNode_st*
  %2 = alloca %struct.AVLNode_st*
  %3 = alloca %struct.AVLNode_st*
  %4 = alloca i8*
  %R333 = bitcast i8* %ARG2 to %struct.AVLNode_st*
  store %struct.AVLNode_st* %R333, %struct.AVLNode_st** %3
  %cond = icmp ne %struct.AVLNode_st* %R333, null
  br i1 %cond, label %L105, label %L113

L105:                                             ; preds = %L104
  %5 = bitcast %struct.AVLNode_st* %R333 to i8*
  %6 = getelementptr inbounds i8, i8* %5, %struct.AVLNode_st* inttoptr (i64 -32 to %struct.AVLNode_st*)
  %7 = bitcast i8* %6 to %struct.AVLNode_st*
  %8 = bitcast %struct.AVLNode_st* %R333 to %struct.AVLNode_st**
  %9 = bitcast %struct.AVLNode_st** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 -16
  %11 = bitcast i8* %10 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %11
  %cond1 = icmp ne %struct.AVLNode_st* %load_target, null
  br i1 %cond1, label %L106, label %L109

L106:                                             ; preds = %L105
  store %struct.AVLNode_st* %load_target, %struct.AVLNode_st** %0
  br label %L107

L107:                                             ; preds = %L108, %L106
  %12 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %13 = bitcast %struct.AVLNode_st* %12 to %struct.AVLNode_st**
  %14 = bitcast %struct.AVLNode_st** %13 to i8*
  %15 = getelementptr inbounds i8, i8* %14, i64 8
  %16 = bitcast i8* %15 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  store %struct.AVLNode_st* %12, %struct.AVLNode_st** %3
  %cond3 = icmp ne %struct.AVLNode_st* %load_target2, null
  br i1 %cond3, label %L108, label %L113

L108:                                             ; preds = %L107
  store %struct.AVLNode_st* %load_target2, %struct.AVLNode_st** %0
  br label %L107

L109:                                             ; preds = %L105
  %17 = bitcast %struct.AVLNode_st* %R333 to %struct.AVLNode_st**
  %18 = bitcast %struct.AVLNode_st** %17 to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 -32
  %20 = bitcast i8* %19 to %struct.AVLNode_st**
  %load_target4 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  store %struct.AVLNode_st* %load_target4, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %7, %struct.AVLNode_st** %2
  br label %L110

L110:                                             ; preds = %L112, %L109
  %21 = load %struct.AVLNode_st*, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %21, %struct.AVLNode_st** %3
  %cond5 = icmp ne %struct.AVLNode_st* %21, null
  br i1 %cond5, label %L111, label %L113

L111:                                             ; preds = %L110
  %22 = bitcast %struct.AVLNode_st* %21 to %struct.AVLNode_st**
  %23 = bitcast %struct.AVLNode_st** %22 to i8*
  %24 = getelementptr inbounds i8, i8* %23, i64 16
  %25 = bitcast i8* %24 to %struct.AVLNode_st**
  %load_target6 = load %struct.AVLNode_st*, %struct.AVLNode_st** %25
  %26 = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %27 = ptrtoint %struct.AVLNode_st* %load_target6 to i64
  %28 = ptrtoint %struct.AVLNode_st* %26 to i64
  %R353 = icmp eq i64 %27, %28
  %R3537 = zext i1 %R353 to i32
  store %struct.AVLNode_st* %21, %struct.AVLNode_st** %3
  %cond8 = icmp ne i32 %R3537, 0
  br i1 %cond8, label %L112, label %L113

L112:                                             ; preds = %L111
  %29 = bitcast %struct.AVLNode_st* %21 to %struct.AVLNode_st**
  %30 = bitcast %struct.AVLNode_st** %29 to i8*
  %31 = getelementptr inbounds i8, i8* %30, i64 0
  %32 = bitcast i8* %31 to %struct.AVLNode_st**
  %load_target9 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  store %struct.AVLNode_st* %load_target9, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %21, %struct.AVLNode_st** %2
  br label %L110

L113:                                             ; preds = %L111, %L110, %L107, %L104
  %33 = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %cond10 = icmp ne %struct.AVLNode_st* %33, null
  br i1 %cond10, label %L114, label %L115

L114:                                             ; preds = %L113
  %34 = bitcast %struct.AVLNode_st* %33 to i8*
  %35 = getelementptr inbounds i8, i8* %34, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %36 = bitcast i8* %35 to %struct.AVLNode_st*
  %R360 = bitcast %struct.AVLNode_st* %36 to i8*
  store i8* %R360, i8** %4
  br label %L116

L115:                                             ; preds = %L113
  store i8* null, i8** %4
  br label %L116

L116:                                             ; preds = %L115, %L114
  %37 = load i8*, i8** %4
  ret i8* %37
}

define i8* @AVLTree_FindPrevious(%struct.avltree* %ARG1, i8* %ARG2) {
L117:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca %struct.AVLNode_st*
  %2 = alloca %struct.AVLNode_st*
  %3 = alloca %struct.AVLNode_st*
  %4 = alloca i8*
  %R363 = bitcast i8* %ARG2 to %struct.AVLNode_st*
  store %struct.AVLNode_st* %R363, %struct.AVLNode_st** %3
  %cond = icmp ne %struct.AVLNode_st* %R363, null
  br i1 %cond, label %L118, label %L126

L118:                                             ; preds = %L117
  %5 = bitcast %struct.AVLNode_st* %R363 to i8*
  %6 = getelementptr inbounds i8, i8* %5, %struct.AVLNode_st* inttoptr (i64 -32 to %struct.AVLNode_st*)
  %7 = bitcast i8* %6 to %struct.AVLNode_st*
  %8 = bitcast %struct.AVLNode_st* %R363 to %struct.AVLNode_st**
  %9 = bitcast %struct.AVLNode_st** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 -24
  %11 = bitcast i8* %10 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %11
  %cond1 = icmp ne %struct.AVLNode_st* %load_target, null
  br i1 %cond1, label %L119, label %L122

L119:                                             ; preds = %L118
  store %struct.AVLNode_st* %load_target, %struct.AVLNode_st** %0
  br label %L120

L120:                                             ; preds = %L121, %L119
  %12 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %13 = bitcast %struct.AVLNode_st* %12 to %struct.AVLNode_st**
  %14 = bitcast %struct.AVLNode_st** %13 to i8*
  %15 = getelementptr inbounds i8, i8* %14, i64 16
  %16 = bitcast i8* %15 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  store %struct.AVLNode_st* %12, %struct.AVLNode_st** %3
  %cond3 = icmp ne %struct.AVLNode_st* %load_target2, null
  br i1 %cond3, label %L121, label %L126

L121:                                             ; preds = %L120
  store %struct.AVLNode_st* %load_target2, %struct.AVLNode_st** %0
  br label %L120

L122:                                             ; preds = %L118
  %17 = bitcast %struct.AVLNode_st* %R363 to %struct.AVLNode_st**
  %18 = bitcast %struct.AVLNode_st** %17 to i8*
  %19 = getelementptr inbounds i8, i8* %18, i64 -32
  %20 = bitcast i8* %19 to %struct.AVLNode_st**
  %load_target4 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  store %struct.AVLNode_st* %load_target4, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %7, %struct.AVLNode_st** %2
  br label %L123

L123:                                             ; preds = %L125, %L122
  %21 = load %struct.AVLNode_st*, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %21, %struct.AVLNode_st** %3
  %cond5 = icmp ne %struct.AVLNode_st* %21, null
  br i1 %cond5, label %L124, label %L126

L124:                                             ; preds = %L123
  %22 = bitcast %struct.AVLNode_st* %21 to %struct.AVLNode_st**
  %23 = bitcast %struct.AVLNode_st** %22 to i8*
  %24 = getelementptr inbounds i8, i8* %23, i64 8
  %25 = bitcast i8* %24 to %struct.AVLNode_st**
  %load_target6 = load %struct.AVLNode_st*, %struct.AVLNode_st** %25
  %26 = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %27 = ptrtoint %struct.AVLNode_st* %load_target6 to i64
  %28 = ptrtoint %struct.AVLNode_st* %26 to i64
  %R383 = icmp eq i64 %27, %28
  %R3837 = zext i1 %R383 to i32
  store %struct.AVLNode_st* %21, %struct.AVLNode_st** %3
  %cond8 = icmp ne i32 %R3837, 0
  br i1 %cond8, label %L125, label %L126

L125:                                             ; preds = %L124
  %29 = bitcast %struct.AVLNode_st* %21 to %struct.AVLNode_st**
  %30 = bitcast %struct.AVLNode_st** %29 to i8*
  %31 = getelementptr inbounds i8, i8* %30, i64 0
  %32 = bitcast i8* %31 to %struct.AVLNode_st**
  %load_target9 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  store %struct.AVLNode_st* %load_target9, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %21, %struct.AVLNode_st** %2
  br label %L123

L126:                                             ; preds = %L124, %L123, %L120, %L117
  %33 = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %cond10 = icmp ne %struct.AVLNode_st* %33, null
  br i1 %cond10, label %L127, label %L128

L127:                                             ; preds = %L126
  %34 = bitcast %struct.AVLNode_st* %33 to i8*
  %35 = getelementptr inbounds i8, i8* %34, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %36 = bitcast i8* %35 to %struct.AVLNode_st*
  %R390 = bitcast %struct.AVLNode_st* %36 to i8*
  store i8* %R390, i8** %4
  br label %L129

L128:                                             ; preds = %L126
  store i8* null, i8** %4
  br label %L129

L129:                                             ; preds = %L128, %L127
  %37 = load i8*, i8** %4
  ret i8* %37
}

define i32 @AVLTree_Height(%struct.avltree* %ARG1) {
L130:
  %0 = bitcast %struct.avltree* %ARG1 to i8**
  %1 = bitcast i8** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to i8**
  %load_target = load i8*, i8** %3
  %R394 = bitcast i8* %load_target to %struct.AVLNode_st*
  %R395 = call i32 @AVL_Height(%struct.AVLNode_st* %R394)
  ret i32 %R395
}

define void @AVLTree_BackwardApply(%struct.AVLNode_st* %ARG1, void (i8*)* %ARG2) {
L131:
  %cond = icmp ne %struct.AVLNode_st* %ARG1, null
  br i1 %cond, label %L132, label %L133

L132:                                             ; preds = %L131
  %0 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %1 = bitcast %struct.AVLNode_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 16
  %3 = bitcast i8* %2 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %load_target, void (i8*)* %ARG2)
  %4 = bitcast %struct.AVLNode_st* %ARG1 to i8*
  %5 = getelementptr inbounds i8, i8* %4, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %6 = bitcast i8* %5 to %struct.AVLNode_st*
  %R404 = bitcast %struct.AVLNode_st* %6 to i8*
  %7 = bitcast void (i8*)* %ARG2 to i8*
  %8 = bitcast i8* %7 to void (i8*)*
  call void %8(i8* %R404)
  %9 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %10 = bitcast %struct.AVLNode_st** %9 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 8
  %12 = bitcast i8* %11 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %12
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %load_target1, void (i8*)* %ARG2)
  br label %L133

L133:                                             ; preds = %L132, %L131
  ret void
}

define void @AVLTree_Backeach(%struct.avltree* %ARG1, void (i8*)* %ARG2) {
L134:
  %0 = bitcast %struct.avltree* %ARG1 to i8**
  %1 = bitcast i8** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to i8**
  %load_target = load i8*, i8** %3
  %R411 = bitcast i8* %load_target to %struct.AVLNode_st*
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %R411, void (i8*)* %ARG2)
  ret void
}

define void @AVLTree_ForwardApply(%struct.AVLNode_st* %ARG1, void (i8*)* %ARG2) {
L135:
  %cond = icmp ne %struct.AVLNode_st* %ARG1, null
  br i1 %cond, label %L136, label %L137

L136:                                             ; preds = %L135
  %0 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %1 = bitcast %struct.AVLNode_st** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %load_target, void (i8*)* %ARG2)
  %4 = bitcast %struct.AVLNode_st* %ARG1 to i8*
  %5 = getelementptr inbounds i8, i8* %4, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %6 = bitcast i8* %5 to %struct.AVLNode_st*
  %R420 = bitcast %struct.AVLNode_st* %6 to i8*
  %7 = bitcast void (i8*)* %ARG2 to i8*
  %8 = bitcast i8* %7 to void (i8*)*
  call void %8(i8* %R420)
  %9 = bitcast %struct.AVLNode_st* %ARG1 to %struct.AVLNode_st**
  %10 = bitcast %struct.AVLNode_st** %9 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 16
  %12 = bitcast i8* %11 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %12
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %load_target1, void (i8*)* %ARG2)
  br label %L137

L137:                                             ; preds = %L136, %L135
  ret void
}

define void @AVLTree_Foreach(%struct.avltree* %ARG1, void (i8*)* %ARG2) {
L138:
  %0 = bitcast %struct.avltree* %ARG1 to i8**
  %1 = bitcast i8** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to i8**
  %load_target = load i8*, i8** %3
  %R427 = bitcast i8* %load_target to %struct.AVLNode_st*
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %R427, void (i8*)* %ARG2)
  ret void
}

define %struct.AVLNode_st* @AVL_new(%struct.avltree* %ARG1, i8* %ARG2) {
L139:
  %0 = bitcast %struct.avltree* %ARG1 to %struct.avl_vtbl**
  %1 = bitcast %struct.avl_vtbl** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to %struct.avl_vtbl**
  %load_target = load %struct.avl_vtbl*, %struct.avl_vtbl** %3
  %4 = bitcast %struct.avltree* %ARG1 to %struct.allocator_st**
  %5 = bitcast %struct.allocator_st** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 24
  %7 = bitcast i8* %6 to %struct.allocator_st**
  %load_target1 = load %struct.allocator_st*, %struct.allocator_st** %7
  %R433 = call i8* @alloc_node(%struct.allocator_st* %load_target1)
  %R434 = bitcast i8* %R433 to %struct.AVLNode_st*
  %cond = icmp ne %struct.AVLNode_st* %R434, null
  br i1 %cond, label %L141, label %L140

L140:                                             ; preds = %L139
  call void @exit(i32 -1)
  br label %L141

L141:                                             ; preds = %L140, %L139
  %8 = bitcast %struct.AVLNode_st* %R434 to %struct.AVLNode_st**
  %9 = bitcast %struct.AVLNode_st** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = bitcast i8* %10 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %11
  %12 = bitcast %struct.AVLNode_st* %R434 to %struct.AVLNode_st**
  %13 = bitcast %struct.AVLNode_st** %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 16
  %15 = bitcast i8* %14 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %15
  %16 = bitcast %struct.AVLNode_st* %R434 to %struct.AVLNode_st**
  %17 = bitcast %struct.AVLNode_st** %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 8
  %19 = bitcast i8* %18 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %19
  %20 = bitcast %struct.AVLNode_st* %R434 to i32*
  %21 = bitcast i32* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, i64 24
  %23 = bitcast i8* %22 to i32*
  store i32 0, i32* %23
  %24 = bitcast %struct.avl_vtbl* %load_target to void (i8*, i8*)**
  %25 = bitcast void (i8*, i8*)** %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 8
  %27 = bitcast i8* %26 to void (i8*, i8*)**
  %load_target2 = load void (i8*, i8*)*, void (i8*, i8*)** %27
  %cond3 = icmp ne void (i8*, i8*)* %load_target2, null
  br i1 %cond3, label %L142, label %L143

L142:                                             ; preds = %L141
  %28 = bitcast %struct.AVLNode_st* %R434 to i8*
  %29 = getelementptr inbounds i8, i8* %28, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %30 = bitcast i8* %29 to %struct.AVLNode_st*
  %R446 = bitcast %struct.AVLNode_st* %30 to i8*
  %31 = bitcast void (i8*, i8*)* %load_target2 to i8*
  %32 = bitcast i8* %31 to void (i8*, i8*)*
  call void %32(i8* %R446, i8* %ARG2)
  br label %L143

L143:                                             ; preds = %L142, %L141
  ret %struct.AVLNode_st* %R434
}

define i8* @AVLTree_Insert(%struct.avltree* %ARG1, i8* %ARG2) {
L144:
  %height_changed_0000027B4C9BF7C8 = alloca i32
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca %struct.AVLNode_st*
  %2 = alloca %struct.AVLNode_st*
  %3 = alloca %struct.AVLNode_st*
  %4 = alloca %struct.AVLNode_st*
  %5 = alloca %struct.AVLNode_st*
  %6 = alloca %struct.AVLNode_st*
  %7 = alloca %struct.AVLNode_st*
  %8 = alloca i8*
  %9 = bitcast %struct.avltree* %ARG1 to i8**
  %10 = bitcast i8** %9 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 8
  %12 = bitcast i8* %11 to i8**
  %load_target = load i8*, i8** %12
  %R454 = bitcast i8* %load_target to %struct.AVLNode_st*
  %13 = bitcast %struct.avltree* %ARG1 to %struct.avl_vtbl**
  %14 = bitcast %struct.avl_vtbl** %13 to i8*
  %15 = getelementptr inbounds i8, i8* %14, i64 0
  %16 = bitcast i8* %15 to %struct.avl_vtbl**
  %load_target1 = load %struct.avl_vtbl*, %struct.avl_vtbl** %16
  %cond = icmp ne %struct.AVLNode_st* %R454, null
  br i1 %cond, label %L146, label %L145

L145:                                             ; preds = %L144
  %R461 = call %struct.AVLNode_st* @AVL_new(%struct.avltree* %ARG1, i8* %ARG2)
  store %struct.AVLNode_st* %R461, %struct.AVLNode_st** %6
  store %struct.AVLNode_st* %R461, %struct.AVLNode_st** %7
  br label %L164

L146:                                             ; preds = %L144
  %17 = bitcast i32* %height_changed_0000027B4C9BF7C8 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 0
  %19 = bitcast i8* %18 to i32*
  store i32 0, i32* %19
  store %struct.AVLNode_st* %R454, %struct.AVLNode_st** %6
  store %struct.AVLNode_st* %R454, %struct.AVLNode_st** %0
  br label %L147

L147:                                             ; preds = %L152, %L146
  %20 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %21 = bitcast %struct.AVLNode_st* %20 to i8*
  %22 = getelementptr inbounds i8, i8* %21, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %23 = bitcast i8* %22 to %struct.AVLNode_st*
  %R467 = bitcast %struct.AVLNode_st* %23 to i8*
  %24 = bitcast %struct.avl_vtbl* %load_target1 to i32 (i8*, i8*)**
  %25 = bitcast i32 (i8*, i8*)** %24 to i8*
  %26 = getelementptr inbounds i8, i8* %25, i64 0
  %27 = bitcast i8* %26 to i32 (i8*, i8*)**
  %load_target2 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %27
  %R470 = bitcast i32 (i8*, i8*)* %load_target2 to i8*
  %R4703 = bitcast i8* %R470 to i32 (i8*, i8*)*
  %R4704 = call i32 %R4703(i8* %ARG2, i8* %R467)
  %R472 = icmp slt i32 %R4704, 0
  %R4725 = zext i1 %R472 to i32
  %cond6 = icmp ne i32 %R4725, 0
  br i1 %cond6, label %L148, label %L149

L148:                                             ; preds = %L147
  %28 = bitcast %struct.AVLNode_st* %20 to %struct.AVLNode_st**
  %29 = bitcast %struct.AVLNode_st** %28 to i8*
  %30 = getelementptr inbounds i8, i8* %29, i64 8
  %31 = bitcast i8* %30 to %struct.AVLNode_st**
  %load_target7 = load %struct.AVLNode_st*, %struct.AVLNode_st** %31
  store %struct.AVLNode_st* %load_target7, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %load_target7, %struct.AVLNode_st** %0
  br label %L152

L149:                                             ; preds = %L147
  %R476 = icmp sgt i32 %R4704, 0
  %R4768 = zext i1 %R476 to i32
  %cond9 = icmp ne i32 %R4768, 0
  br i1 %cond9, label %L150, label %L151

L150:                                             ; preds = %L149
  %32 = bitcast %struct.AVLNode_st* %20 to %struct.AVLNode_st**
  %33 = bitcast %struct.AVLNode_st** %32 to i8*
  %34 = getelementptr inbounds i8, i8* %33, i64 16
  %35 = bitcast i8* %34 to %struct.AVLNode_st**
  %load_target10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %35
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %0
  br label %L152

L151:                                             ; preds = %L149
  store i8* %R467, i8** %8
  br label %L165

L152:                                             ; preds = %L150, %L148
  %36 = load %struct.AVLNode_st*, %struct.AVLNode_st** %1
  %cond11 = icmp ne %struct.AVLNode_st* %36, null
  br i1 %cond11, label %L147, label %L153

L153:                                             ; preds = %L152
  %R487 = call %struct.AVLNode_st* @AVL_new(%struct.avltree* %ARG1, i8* %ARG2)
  %R491 = bitcast %struct.AVLNode_st* %23 to i8*
  %37 = bitcast %struct.avl_vtbl* %load_target1 to i32 (i8*, i8*)**
  %38 = bitcast i32 (i8*, i8*)** %37 to i8*
  %39 = getelementptr inbounds i8, i8* %38, i64 0
  %40 = bitcast i8* %39 to i32 (i8*, i8*)**
  %load_target12 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %40
  %R494 = bitcast i32 (i8*, i8*)* %load_target12 to i8*
  %R49413 = bitcast i8* %R494 to i32 (i8*, i8*)*
  %R49414 = call i32 %R49413(i8* %ARG2, i8* %R491)
  %R495 = icmp slt i32 %R49414, 0
  %R49515 = zext i1 %R495 to i32
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %7
  %cond16 = icmp ne i32 %R49515, 0
  br i1 %cond16, label %L154, label %L155

L154:                                             ; preds = %L153
  call void @AVL_SetLeft(%struct.AVLNode_st* %20, %struct.AVLNode_st* %R487)
  store %struct.AVLNode_st* %20, %struct.AVLNode_st** %2
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %3
  br label %L156

L155:                                             ; preds = %L153
  call void @AVL_SetRight(%struct.AVLNode_st* %20, %struct.AVLNode_st* %R487)
  store %struct.AVLNode_st* %20, %struct.AVLNode_st** %2
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %3
  br label %L156

L156:                                             ; preds = %L155, %L154
  %41 = bitcast i32* %height_changed_0000027B4C9BF7C8 to i8*
  %42 = getelementptr inbounds i8, i8* %41, i64 0
  %43 = bitcast i8* %42 to i32*
  store i32 1, i32* %43
  br label %L157

L157:                                             ; preds = %L161, %L156
  %44 = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %45 = ptrtoint %struct.AVLNode_st* %44 to i64
  %R501 = icmp ne i64 %45, 0
  %R50117 = zext i1 %R501 to i32
  %46 = bitcast i32* %height_changed_0000027B4C9BF7C8 to i8*
  %47 = getelementptr inbounds i8, i8* %46, i64 0
  %48 = bitcast i8* %47 to i32*
  %load_target18 = load i32, i32* %48
  %49 = icmp ne i32 %R50117, 0
  %50 = icmp ne i32 %load_target18, 0
  %R503 = and i1 %49, %50
  %R50319 = zext i1 %R503 to i32
  %cond20 = icmp ne i32 %R50319, 0
  br i1 %cond20, label %L158, label %L162

L158:                                             ; preds = %L157
  %51 = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %52 = bitcast %struct.AVLNode_st* %44 to %struct.AVLNode_st**
  %53 = bitcast %struct.AVLNode_st** %52 to i8*
  %54 = getelementptr inbounds i8, i8* %53, i64 8
  %55 = bitcast i8* %54 to %struct.AVLNode_st**
  %load_target21 = load %struct.AVLNode_st*, %struct.AVLNode_st** %55
  %56 = ptrtoint %struct.AVLNode_st* %51 to i64
  %57 = ptrtoint %struct.AVLNode_st* %load_target21 to i64
  %R507 = icmp eq i64 %56, %57
  %R50722 = zext i1 %R507 to i32
  %cond23 = icmp ne i32 %R50722, 0
  br i1 %cond23, label %L159, label %L160

L159:                                             ; preds = %L158
  %R510 = call %struct.AVLNode_st* @AVL_RebalanceHeavierLeft(%struct.AVLNode_st* %44, i32* %height_changed_0000027B4C9BF7C8)
  store %struct.AVLNode_st* %R510, %struct.AVLNode_st** %4
  br label %L161

L160:                                             ; preds = %L158
  %R513 = call %struct.AVLNode_st* @AVL_RebalanceHeavierRight(%struct.AVLNode_st* %44, i32* %height_changed_0000027B4C9BF7C8)
  store %struct.AVLNode_st* %R513, %struct.AVLNode_st** %4
  br label %L161

L161:                                             ; preds = %L160, %L159
  %58 = load %struct.AVLNode_st*, %struct.AVLNode_st** %4
  %59 = bitcast %struct.AVLNode_st* %58 to %struct.AVLNode_st**
  %60 = bitcast %struct.AVLNode_st** %59 to i8*
  %61 = getelementptr inbounds i8, i8* %60, i64 0
  %62 = bitcast i8* %61 to %struct.AVLNode_st**
  %load_target24 = load %struct.AVLNode_st*, %struct.AVLNode_st** %62
  store %struct.AVLNode_st* %load_target24, %struct.AVLNode_st** %2
  store %struct.AVLNode_st* %58, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %58, %struct.AVLNode_st** %3
  br label %L157

L162:                                             ; preds = %L157
  %cond25 = icmp ne %struct.AVLNode_st* %44, null
  br i1 %cond25, label %L164, label %L163

L163:                                             ; preds = %L162
  %63 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %63, %struct.AVLNode_st** %6
  br label %L164

L164:                                             ; preds = %L163, %L162, %L145
  %64 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %R521 = bitcast %struct.AVLNode_st* %64 to i8*
  %65 = bitcast %struct.avltree* %ARG1 to i8**
  %66 = bitcast i8** %65 to i8*
  %67 = getelementptr inbounds i8, i8* %66, i64 8
  %68 = bitcast i8* %67 to i8**
  store i8* %R521, i8** %68
  %69 = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %70 = bitcast %struct.AVLNode_st* %69 to i8*
  %71 = getelementptr inbounds i8, i8* %70, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %72 = bitcast i8* %71 to %struct.AVLNode_st*
  %R525 = bitcast %struct.AVLNode_st* %72 to i8*
  store i8* %R525, i8** %8
  br label %L165

L165:                                             ; preds = %L164, %L151
  %73 = load i8*, i8** %8
  ret i8* %73
}

define i32 @AVLTree_DeleteObject(%struct.avltree* %ARG1, i8* %ARG2) {
L166:
  %height_changed_0000027B4C9C9AA8 = alloca i32
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca %struct.AVLNode_st*
  %2 = alloca i32
  %3 = alloca %struct.AVLNode_st*
  %4 = alloca %struct.AVLNode_st*
  %5 = alloca %struct.AVLNode_st*
  %6 = alloca %struct.AVLNode_st*
  %7 = alloca i32
  %R530 = bitcast i8* %ARG2 to %struct.AVLNode_st*
  %8 = bitcast i32* %height_changed_0000027B4C9C9AA8 to i8*
  %9 = getelementptr inbounds i8, i8* %8, i64 0
  %10 = bitcast i8* %9 to i32*
  store i32 0, i32* %10
  %11 = bitcast %struct.avltree* %ARG1 to %struct.avl_vtbl**
  %12 = bitcast %struct.avl_vtbl** %11 to i8*
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = bitcast i8* %13 to %struct.avl_vtbl**
  %load_target = load %struct.avl_vtbl*, %struct.avl_vtbl** %14
  store i32 0, i32* %2
  %cond = icmp ne %struct.AVLNode_st* %R530, null
  br i1 %cond, label %L168, label %L167

L167:                                             ; preds = %L166
  store i32 -1, i32* %7
  br label %L203

L168:                                             ; preds = %L166
  %15 = bitcast %struct.AVLNode_st* %R530 to i8*
  %16 = getelementptr inbounds i8, i8* %15, %struct.AVLNode_st* inttoptr (i64 -32 to %struct.AVLNode_st*)
  %17 = bitcast i8* %16 to %struct.AVLNode_st*
  %18 = bitcast %struct.AVLNode_st* %R530 to %struct.AVLNode_st**
  %19 = bitcast %struct.AVLNode_st** %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 -24
  %21 = bitcast i8* %20 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  %cond2 = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond2, label %L169, label %L181

L169:                                             ; preds = %L168
  store %struct.AVLNode_st* %load_target1, %struct.AVLNode_st** %0
  br label %L170

L170:                                             ; preds = %L171, %L169
  %22 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %23 = bitcast %struct.AVLNode_st* %22 to %struct.AVLNode_st**
  %24 = bitcast %struct.AVLNode_st** %23 to i8*
  %25 = getelementptr inbounds i8, i8* %24, i64 16
  %26 = bitcast i8* %25 to %struct.AVLNode_st**
  %load_target3 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  %cond4 = icmp ne %struct.AVLNode_st* %load_target3, null
  br i1 %cond4, label %L171, label %L172

L171:                                             ; preds = %L170
  store %struct.AVLNode_st* %load_target3, %struct.AVLNode_st** %0
  br label %L170

L172:                                             ; preds = %L170
  %27 = bitcast %struct.avl_vtbl* %load_target to void (i8*, i8*)**
  %28 = bitcast void (i8*, i8*)** %27 to i8*
  %29 = getelementptr inbounds i8, i8* %28, i64 16
  %30 = bitcast i8* %29 to void (i8*, i8*)**
  %load_target5 = load void (i8*, i8*)*, void (i8*, i8*)** %30
  %cond6 = icmp ne void (i8*, i8*)* %load_target5, null
  br i1 %cond6, label %L173, label %L174

L173:                                             ; preds = %L172
  %31 = bitcast %struct.AVLNode_st* %17 to i8*
  %32 = getelementptr inbounds i8, i8* %31, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %33 = bitcast i8* %32 to %struct.AVLNode_st*
  %R554 = bitcast %struct.AVLNode_st* %33 to i8*
  %34 = bitcast %struct.AVLNode_st* %22 to i8*
  %35 = getelementptr inbounds i8, i8* %34, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %36 = bitcast i8* %35 to %struct.AVLNode_st*
  %R557 = bitcast %struct.AVLNode_st* %36 to i8*
  %37 = bitcast void (i8*, i8*)* %load_target5 to i8*
  %38 = bitcast i8* %37 to void (i8*, i8*)*
  call void %38(i8* %R554, i8* %R557)
  br label %L177

L174:                                             ; preds = %L172
  %39 = bitcast %struct.avl_vtbl* %load_target to void (i8*)**
  %40 = bitcast void (i8*)** %39 to i8*
  %41 = getelementptr inbounds i8, i8* %40, i64 24
  %42 = bitcast i8* %41 to void (i8*)**
  %load_target7 = load void (i8*)*, void (i8*)** %42
  %cond8 = icmp ne void (i8*)* %load_target7, null
  br i1 %cond8, label %L175, label %L176

L175:                                             ; preds = %L174
  %43 = bitcast %struct.AVLNode_st* %17 to i8*
  %44 = getelementptr inbounds i8, i8* %43, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %45 = bitcast i8* %44 to %struct.AVLNode_st*
  %R565 = bitcast %struct.AVLNode_st* %45 to i8*
  %46 = bitcast void (i8*)* %load_target7 to i8*
  %47 = bitcast i8* %46 to void (i8*)*
  call void %47(i8* %R565)
  br label %L176

L176:                                             ; preds = %L175, %L174
  %48 = bitcast %struct.AVLNode_st* %17 to i8*
  %49 = getelementptr inbounds i8, i8* %48, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %50 = bitcast i8* %49 to %struct.AVLNode_st*
  %R570 = bitcast %struct.AVLNode_st* %50 to i8*
  %51 = bitcast %struct.AVLNode_st* %22 to i8*
  %52 = getelementptr inbounds i8, i8* %51, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %53 = bitcast i8* %52 to %struct.AVLNode_st*
  %R573 = bitcast %struct.AVLNode_st* %53 to i8*
  %54 = bitcast %struct.avltree* %ARG1 to i32*
  %55 = bitcast i32* %54 to i8*
  %56 = getelementptr inbounds i8, i8* %55, i64 20
  %57 = bitcast i8* %56 to i32*
  %load_target9 = load i32, i32* %57
  %R576 = call i8* @memcpy(i8* %R570, i8* %R573, i32 %load_target9)
  br label %L177

L177:                                             ; preds = %L176, %L173
  %58 = bitcast %struct.AVLNode_st* %22 to %struct.AVLNode_st**
  %59 = bitcast %struct.AVLNode_st** %58 to i8*
  %60 = getelementptr inbounds i8, i8* %59, i64 0
  %61 = bitcast i8* %60 to %struct.AVLNode_st**
  %load_target10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %61
  %62 = bitcast %struct.AVLNode_st* %load_target10 to %struct.AVLNode_st**
  %63 = bitcast %struct.AVLNode_st** %62 to i8*
  %64 = getelementptr inbounds i8, i8* %63, i64 8
  %65 = bitcast i8* %64 to %struct.AVLNode_st**
  %load_target11 = load %struct.AVLNode_st*, %struct.AVLNode_st** %65
  %66 = ptrtoint %struct.AVLNode_st* %22 to i64
  %67 = ptrtoint %struct.AVLNode_st* %load_target11 to i64
  %R582 = icmp eq i64 %66, %67
  %R58212 = zext i1 %R582 to i32
  %cond13 = icmp ne i32 %R58212, 0
  br i1 %cond13, label %L178, label %L179

L178:                                             ; preds = %L177
  %68 = bitcast %struct.AVLNode_st* %22 to %struct.AVLNode_st**
  %69 = bitcast %struct.AVLNode_st** %68 to i8*
  %70 = getelementptr inbounds i8, i8* %69, i64 8
  %71 = bitcast i8* %70 to %struct.AVLNode_st**
  %load_target14 = load %struct.AVLNode_st*, %struct.AVLNode_st** %71
  call void @AVL_SetLeft(%struct.AVLNode_st* %load_target10, %struct.AVLNode_st* %load_target14)
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %1
  store i32 1, i32* %2
  br label %L180

L179:                                             ; preds = %L177
  %72 = bitcast %struct.AVLNode_st* %22 to %struct.AVLNode_st**
  %73 = bitcast %struct.AVLNode_st** %72 to i8*
  %74 = getelementptr inbounds i8, i8* %73, i64 8
  %75 = bitcast i8* %74 to %struct.AVLNode_st**
  %load_target15 = load %struct.AVLNode_st*, %struct.AVLNode_st** %75
  call void @AVL_SetRight(%struct.AVLNode_st* %load_target10, %struct.AVLNode_st* %load_target15)
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %1
  br label %L180

L180:                                             ; preds = %L179, %L178
  store %struct.AVLNode_st* %22, %struct.AVLNode_st** %6
  store %struct.AVLNode_st* %22, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %22, %struct.AVLNode_st** %3
  br label %L193

L181:                                             ; preds = %L168
  %76 = bitcast %struct.AVLNode_st* %R530 to %struct.AVLNode_st**
  %77 = bitcast %struct.AVLNode_st** %76 to i8*
  %78 = getelementptr inbounds i8, i8* %77, i64 -32
  %79 = bitcast i8* %78 to %struct.AVLNode_st**
  %load_target16 = load %struct.AVLNode_st*, %struct.AVLNode_st** %79
  %cond17 = icmp ne %struct.AVLNode_st* %load_target16, null
  br i1 %cond17, label %L182, label %L188

L182:                                             ; preds = %L181
  %80 = bitcast %struct.AVLNode_st* %load_target16 to %struct.AVLNode_st**
  %81 = bitcast %struct.AVLNode_st** %80 to i8*
  %82 = getelementptr inbounds i8, i8* %81, i64 8
  %83 = bitcast i8* %82 to %struct.AVLNode_st**
  %load_target18 = load %struct.AVLNode_st*, %struct.AVLNode_st** %83
  %84 = ptrtoint %struct.AVLNode_st* %17 to i64
  %85 = ptrtoint %struct.AVLNode_st* %load_target18 to i64
  %R597 = icmp eq i64 %84, %85
  %R59719 = zext i1 %R597 to i32
  %cond20 = icmp ne i32 %R59719, 0
  br i1 %cond20, label %L183, label %L184

L183:                                             ; preds = %L182
  %86 = bitcast %struct.AVLNode_st* %R530 to %struct.AVLNode_st**
  %87 = bitcast %struct.AVLNode_st** %86 to i8*
  %88 = getelementptr inbounds i8, i8* %87, i64 -16
  %89 = bitcast i8* %88 to %struct.AVLNode_st**
  %load_target21 = load %struct.AVLNode_st*, %struct.AVLNode_st** %89
  call void @AVL_SetLeft(%struct.AVLNode_st* %load_target16, %struct.AVLNode_st* %load_target21)
  store %struct.AVLNode_st* %load_target16, %struct.AVLNode_st** %1
  store i32 1, i32* %2
  br label %L185

L184:                                             ; preds = %L182
  %90 = bitcast %struct.AVLNode_st* %R530 to %struct.AVLNode_st**
  %91 = bitcast %struct.AVLNode_st** %90 to i8*
  %92 = getelementptr inbounds i8, i8* %91, i64 -16
  %93 = bitcast i8* %92 to %struct.AVLNode_st**
  %load_target22 = load %struct.AVLNode_st*, %struct.AVLNode_st** %93
  call void @AVL_SetRight(%struct.AVLNode_st* %load_target16, %struct.AVLNode_st* %load_target22)
  store %struct.AVLNode_st* %load_target16, %struct.AVLNode_st** %1
  br label %L185

L185:                                             ; preds = %L184, %L183
  %94 = bitcast %struct.avl_vtbl* %load_target to void (i8*)**
  %95 = bitcast void (i8*)** %94 to i8*
  %96 = getelementptr inbounds i8, i8* %95, i64 24
  %97 = bitcast i8* %96 to void (i8*)**
  %load_target23 = load void (i8*)*, void (i8*)** %97
  %cond24 = icmp ne void (i8*)* %load_target23, null
  br i1 %cond24, label %L186, label %L187

L186:                                             ; preds = %L185
  %98 = bitcast %struct.AVLNode_st* %17 to i8*
  %99 = getelementptr inbounds i8, i8* %98, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %100 = bitcast i8* %99 to %struct.AVLNode_st*
  %R609 = bitcast %struct.AVLNode_st* %100 to i8*
  %101 = bitcast void (i8*)* %load_target23 to i8*
  %102 = bitcast i8* %101 to void (i8*)*
  call void %102(i8* %R609)
  br label %L187

L187:                                             ; preds = %L186, %L185
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %6
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %3
  br label %L193

L188:                                             ; preds = %L181
  %103 = bitcast %struct.AVLNode_st* %R530 to %struct.AVLNode_st**
  %104 = bitcast %struct.AVLNode_st** %103 to i8*
  %105 = getelementptr inbounds i8, i8* %104, i64 -16
  %106 = bitcast i8* %105 to %struct.AVLNode_st**
  %load_target25 = load %struct.AVLNode_st*, %struct.AVLNode_st** %106
  %cond26 = icmp ne %struct.AVLNode_st* %load_target25, null
  br i1 %cond26, label %L189, label %L190

L189:                                             ; preds = %L188
  %107 = bitcast %struct.AVLNode_st* %load_target25 to %struct.AVLNode_st**
  %108 = bitcast %struct.AVLNode_st** %107 to i8*
  %109 = getelementptr inbounds i8, i8* %108, i64 0
  %110 = bitcast i8* %109 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %110
  br label %L190

L190:                                             ; preds = %L189, %L188
  %111 = bitcast %struct.avl_vtbl* %load_target to void (i8*)**
  %112 = bitcast void (i8*)** %111 to i8*
  %113 = getelementptr inbounds i8, i8* %112, i64 24
  %114 = bitcast i8* %113 to void (i8*)**
  %load_target27 = load void (i8*)*, void (i8*)** %114
  %cond28 = icmp ne void (i8*)* %load_target27, null
  br i1 %cond28, label %L191, label %L192

L191:                                             ; preds = %L190
  %115 = bitcast %struct.AVLNode_st* %17 to i8*
  %116 = getelementptr inbounds i8, i8* %115, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %117 = bitcast i8* %116 to %struct.AVLNode_st*
  %R623 = bitcast %struct.AVLNode_st* %117 to i8*
  %118 = bitcast void (i8*)* %load_target27 to i8*
  %119 = bitcast i8* %118 to void (i8*)*
  call void %119(i8* %R623)
  br label %L192

L192:                                             ; preds = %L191, %L190
  %120 = bitcast %struct.avltree* %ARG1 to %struct.allocator_st**
  %121 = bitcast %struct.allocator_st** %120 to i8*
  %122 = getelementptr inbounds i8, i8* %121, i64 24
  %123 = bitcast i8* %122 to %struct.allocator_st**
  %load_target29 = load %struct.allocator_st*, %struct.allocator_st** %123
  %R629 = bitcast %struct.AVLNode_st* %17 to i8*
  call void @dealloc_node(%struct.allocator_st* %load_target29, i8* %R629)
  %R631 = bitcast %struct.AVLNode_st* %load_target25 to i8*
  %124 = bitcast %struct.avltree* %ARG1 to i8**
  %125 = bitcast i8** %124 to i8*
  %126 = getelementptr inbounds i8, i8* %125, i64 8
  %127 = bitcast i8* %126 to i8**
  store i8* %R631, i8** %127
  store i32 0, i32* %7
  br label %L203

L193:                                             ; preds = %L187, %L180
  %128 = bitcast i32* %height_changed_0000027B4C9C9AA8 to i8*
  %129 = getelementptr inbounds i8, i8* %128, i64 0
  %130 = bitcast i8* %129 to i32*
  store i32 1, i32* %130
  br label %L194

L194:                                             ; preds = %L199, %L193
  %131 = load %struct.AVLNode_st*, %struct.AVLNode_st** %1
  %132 = ptrtoint %struct.AVLNode_st* %131 to i64
  %R634 = icmp ne i64 %132, 0
  %R63430 = zext i1 %R634 to i32
  %133 = bitcast i32* %height_changed_0000027B4C9C9AA8 to i8*
  %134 = getelementptr inbounds i8, i8* %133, i64 0
  %135 = bitcast i8* %134 to i32*
  %load_target31 = load i32, i32* %135
  %136 = icmp ne i32 %R63430, 0
  %137 = icmp ne i32 %load_target31, 0
  %R636 = and i1 %136, %137
  %R63632 = zext i1 %R636 to i32
  %cond33 = icmp ne i32 %R63632, 0
  br i1 %cond33, label %L195, label %L200

L195:                                             ; preds = %L194
  %138 = load i32, i32* %2
  %cond34 = icmp ne i32 %138, 0
  br i1 %cond34, label %L197, label %L196

L196:                                             ; preds = %L195
  %139 = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %140 = bitcast %struct.AVLNode_st* %131 to %struct.AVLNode_st**
  %141 = bitcast %struct.AVLNode_st** %140 to i8*
  %142 = getelementptr inbounds i8, i8* %141, i64 8
  %143 = bitcast i8* %142 to %struct.AVLNode_st**
  %load_target35 = load %struct.AVLNode_st*, %struct.AVLNode_st** %143
  %144 = ptrtoint %struct.AVLNode_st* %139 to i64
  %145 = ptrtoint %struct.AVLNode_st* %load_target35 to i64
  %R641 = icmp eq i64 %144, %145
  %R64136 = zext i1 %R641 to i32
  %cond37 = icmp ne i32 %R64136, 0
  br i1 %cond37, label %L197, label %L198

L197:                                             ; preds = %L196, %L195
  %R644 = call %struct.AVLNode_st* @AVL_RebalanceShorterLeft(%struct.AVLNode_st* %131, i32* %height_changed_0000027B4C9C9AA8)
  store %struct.AVLNode_st* %R644, %struct.AVLNode_st** %4
  store i32 0, i32* %2
  br label %L199

L198:                                             ; preds = %L196
  %R647 = call %struct.AVLNode_st* @AVL_RebalanceShorterRight(%struct.AVLNode_st* %131, i32* %height_changed_0000027B4C9C9AA8)
  store %struct.AVLNode_st* %R647, %struct.AVLNode_st** %4
  br label %L199

L199:                                             ; preds = %L198, %L197
  %146 = load %struct.AVLNode_st*, %struct.AVLNode_st** %4
  %147 = bitcast %struct.AVLNode_st* %146 to %struct.AVLNode_st**
  %148 = bitcast %struct.AVLNode_st** %147 to i8*
  %149 = getelementptr inbounds i8, i8* %148, i64 0
  %150 = bitcast i8* %149 to %struct.AVLNode_st**
  %load_target38 = load %struct.AVLNode_st*, %struct.AVLNode_st** %150
  store %struct.AVLNode_st* %load_target38, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %146, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %146, %struct.AVLNode_st** %3
  br label %L194

L200:                                             ; preds = %L194
  %cond39 = icmp ne %struct.AVLNode_st* %131, null
  br i1 %cond39, label %L202, label %L201

L201:                                             ; preds = %L200
  %151 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %R654 = bitcast %struct.AVLNode_st* %151 to i8*
  %152 = bitcast %struct.avltree* %ARG1 to i8**
  %153 = bitcast i8** %152 to i8*
  %154 = getelementptr inbounds i8, i8* %153, i64 8
  %155 = bitcast i8* %154 to i8**
  store i8* %R654, i8** %155
  br label %L202

L202:                                             ; preds = %L201, %L200
  %156 = bitcast %struct.avltree* %ARG1 to %struct.allocator_st**
  %157 = bitcast %struct.allocator_st** %156 to i8*
  %158 = getelementptr inbounds i8, i8* %157, i64 24
  %159 = bitcast i8* %158 to %struct.allocator_st**
  %load_target40 = load %struct.allocator_st*, %struct.allocator_st** %159
  %160 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %R659 = bitcast %struct.AVLNode_st* %160 to i8*
  call void @dealloc_node(%struct.allocator_st* %load_target40, i8* %R659)
  store i32 0, i32* %7
  br label %L203

L203:                                             ; preds = %L202, %L192, %L167
  %161 = load i32, i32* %7
  ret i32 %161
}

define i32 @AVLTree_Delete(%struct.avltree* %ARG1, i8* %ARG2) {
L204:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca i32
  %2 = bitcast %struct.avltree* %ARG1 to i8**
  %3 = bitcast i8** %2 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 8
  %5 = bitcast i8* %4 to i8**
  %load_target = load i8*, i8** %5
  %R662 = bitcast i8* %load_target to %struct.AVLNode_st*
  %6 = bitcast %struct.avltree* %ARG1 to %struct.avl_vtbl**
  %7 = bitcast %struct.avl_vtbl** %6 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 0
  %9 = bitcast i8* %8 to %struct.avl_vtbl**
  %load_target1 = load %struct.avl_vtbl*, %struct.avl_vtbl** %9
  %cond = icmp ne %struct.AVLNode_st* %R662, null
  br i1 %cond, label %L206, label %L205

L205:                                             ; preds = %L204
  store i32 -1, i32* %1
  br label %L215

L206:                                             ; preds = %L204
  store %struct.AVLNode_st* %R662, %struct.AVLNode_st** %0
  br label %L207

L207:                                             ; preds = %L211, %L209, %L206
  %10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %cond2 = icmp ne %struct.AVLNode_st* %10, null
  br i1 %cond2, label %L208, label %L213

L208:                                             ; preds = %L207
  %11 = bitcast %struct.AVLNode_st* %10 to i8*
  %12 = getelementptr inbounds i8, i8* %11, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %13 = bitcast i8* %12 to %struct.AVLNode_st*
  %R674 = bitcast %struct.AVLNode_st* %13 to i8*
  %14 = bitcast %struct.avl_vtbl* %load_target1 to i32 (i8*, i8*)**
  %15 = bitcast i32 (i8*, i8*)** %14 to i8*
  %16 = getelementptr inbounds i8, i8* %15, i64 0
  %17 = bitcast i8* %16 to i32 (i8*, i8*)**
  %load_target3 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %17
  %R677 = bitcast i32 (i8*, i8*)* %load_target3 to i8*
  %R6774 = bitcast i8* %R677 to i32 (i8*, i8*)*
  %R6775 = call i32 %R6774(i8* %ARG2, i8* %R674)
  %R679 = icmp slt i32 %R6775, 0
  %R6796 = zext i1 %R679 to i32
  %cond7 = icmp ne i32 %R6796, 0
  br i1 %cond7, label %L209, label %L210

L209:                                             ; preds = %L208
  %18 = bitcast %struct.AVLNode_st* %10 to %struct.AVLNode_st**
  %19 = bitcast %struct.AVLNode_st** %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 8
  %21 = bitcast i8* %20 to %struct.AVLNode_st**
  %load_target8 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  store %struct.AVLNode_st* %load_target8, %struct.AVLNode_st** %0
  br label %L207

L210:                                             ; preds = %L208
  %R683 = icmp sgt i32 %R6775, 0
  %R6839 = zext i1 %R683 to i32
  %cond10 = icmp ne i32 %R6839, 0
  br i1 %cond10, label %L211, label %L212

L211:                                             ; preds = %L210
  %22 = bitcast %struct.AVLNode_st* %10 to %struct.AVLNode_st**
  %23 = bitcast %struct.AVLNode_st** %22 to i8*
  %24 = getelementptr inbounds i8, i8* %23, i64 16
  %25 = bitcast i8* %24 to %struct.AVLNode_st**
  %load_target11 = load %struct.AVLNode_st*, %struct.AVLNode_st** %25
  store %struct.AVLNode_st* %load_target11, %struct.AVLNode_st** %0
  br label %L207

L212:                                             ; preds = %L210
  %cond12 = icmp ne %struct.AVLNode_st* %10, null
  br i1 %cond12, label %L214, label %L213

L213:                                             ; preds = %L212, %L207
  store i32 -1, i32* %1
  br label %L215

L214:                                             ; preds = %L212
  %R692 = call i32 @AVLTree_DeleteObject(%struct.avltree* %ARG1, i8* %R674)
  store i32 0, i32* %1
  br label %L215

L215:                                             ; preds = %L214, %L213, %L205
  %26 = load i32, i32* %1
  ret i32 %26
}

define i8* @AVLTree_Search(%struct.avltree* %ARG1, i8* %ARG2) {
L216:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca i8*
  %2 = bitcast %struct.avltree* %ARG1 to i8**
  %3 = bitcast i8** %2 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 8
  %5 = bitcast i8* %4 to i8**
  %load_target = load i8*, i8** %5
  %R695 = bitcast i8* %load_target to %struct.AVLNode_st*
  %6 = bitcast %struct.avltree* %ARG1 to %struct.avl_vtbl**
  %7 = bitcast %struct.avl_vtbl** %6 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 0
  %9 = bitcast i8* %8 to %struct.avl_vtbl**
  %load_target1 = load %struct.avl_vtbl*, %struct.avl_vtbl** %9
  %cond = icmp ne %struct.AVLNode_st* %R695, null
  br i1 %cond, label %L217, label %L224

L217:                                             ; preds = %L216
  store %struct.AVLNode_st* %R695, %struct.AVLNode_st** %0
  br label %L218

L218:                                             ; preds = %L223, %L222, %L217
  %10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %cond2 = icmp ne %struct.AVLNode_st* %10, null
  br i1 %cond2, label %L219, label %L224

L219:                                             ; preds = %L218
  %11 = bitcast %struct.AVLNode_st* %10 to i8*
  %12 = getelementptr inbounds i8, i8* %11, %struct.AVLNode_st* inttoptr (i64 32 to %struct.AVLNode_st*)
  %13 = bitcast i8* %12 to %struct.AVLNode_st*
  %R704 = bitcast %struct.AVLNode_st* %13 to i8*
  %14 = bitcast %struct.avl_vtbl* %load_target1 to i32 (i8*, i8*)**
  %15 = bitcast i32 (i8*, i8*)** %14 to i8*
  %16 = getelementptr inbounds i8, i8* %15, i64 0
  %17 = bitcast i8* %16 to i32 (i8*, i8*)**
  %load_target3 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %17
  %R707 = bitcast i32 (i8*, i8*)* %load_target3 to i8*
  %R7074 = bitcast i8* %R707 to i32 (i8*, i8*)*
  %R7075 = call i32 %R7074(i8* %ARG2, i8* %R704)
  %cond6 = icmp ne i32 %R7075, 0
  br i1 %cond6, label %L221, label %L220

L220:                                             ; preds = %L219
  store i8* %R704, i8** %1
  br label %L225

L221:                                             ; preds = %L219
  %R715 = icmp slt i32 %R7075, 0
  %R7157 = zext i1 %R715 to i32
  %cond8 = icmp ne i32 %R7157, 0
  br i1 %cond8, label %L222, label %L223

L222:                                             ; preds = %L221
  %18 = bitcast %struct.AVLNode_st* %10 to %struct.AVLNode_st**
  %19 = bitcast %struct.AVLNode_st** %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 8
  %21 = bitcast i8* %20 to %struct.AVLNode_st**
  %load_target9 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  store %struct.AVLNode_st* %load_target9, %struct.AVLNode_st** %0
  br label %L218

L223:                                             ; preds = %L221
  %22 = bitcast %struct.AVLNode_st* %10 to %struct.AVLNode_st**
  %23 = bitcast %struct.AVLNode_st** %22 to i8*
  %24 = getelementptr inbounds i8, i8* %23, i64 16
  %25 = bitcast i8* %24 to %struct.AVLNode_st**
  %load_target10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %25
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %0
  br label %L218

L224:                                             ; preds = %L218, %L216
  store i8* null, i8** %1
  br label %L225

L225:                                             ; preds = %L224, %L220
  %26 = load i8*, i8** %1
  ret i8* %26
}

define %struct.avltree* @AVLTree_New(%struct.avltree* %ARG1, %struct.avl_vtbl* %ARG2, i32 %ARG3, i32 %ARG4) {
L226:
  %0 = bitcast %struct.avltree* %ARG1 to i8**
  %1 = bitcast i8** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 8
  %3 = bitcast i8* %2 to i8**
  store i8* null, i8** %3
  %4 = bitcast %struct.avltree* %ARG1 to %struct.avl_vtbl**
  %5 = bitcast %struct.avl_vtbl** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %ARG2, %struct.avl_vtbl** %7
  %8 = bitcast %struct.avltree* %ARG1 to i32*
  %9 = bitcast i32* %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 20
  %11 = bitcast i8* %10 to i32*
  store i32 %ARG3, i32* %11
  %12 = bitcast %struct.avltree* %ARG1 to i32*
  %13 = bitcast i32* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 16
  %15 = bitcast i8* %14 to i32*
  store i32 0, i32* %15
  %R727 = sext i32 %ARG3 to i64
  %R728 = add i64 %R727, 32
  %R729 = trunc i64 %R728 to i32
  %R731 = call %struct.allocator_st* @new_allocator(i32 %R729, i32 %ARG4)
  %16 = bitcast %struct.avltree* %ARG1 to %struct.allocator_st**
  %17 = bitcast %struct.allocator_st** %16 to i8*
  %18 = getelementptr inbounds i8, i8* %17, i64 24
  %19 = bitcast i8* %18 to %struct.allocator_st**
  store %struct.allocator_st* %R731, %struct.allocator_st** %19
  ret %struct.avltree* %ARG1
}

define void @AVLTree_Destroy(%struct.avltree* %ARG1) {
L227:
  %0 = bitcast %struct.avltree* %ARG1 to %struct.avl_vtbl**
  %1 = bitcast %struct.avl_vtbl** %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to %struct.avl_vtbl**
  %load_target = load %struct.avl_vtbl*, %struct.avl_vtbl** %3
  %4 = bitcast %struct.avl_vtbl* %load_target to void (i8*)**
  %5 = bitcast void (i8*)** %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 24
  %7 = bitcast i8* %6 to void (i8*)**
  %load_target1 = load void (i8*)*, void (i8*)** %7
  %cond = icmp ne void (i8*)* %load_target1, null
  br i1 %cond, label %L228, label %L229

L228:                                             ; preds = %L227
  %8 = bitcast %struct.avltree* %ARG1 to i8**
  %9 = bitcast i8** %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 8
  %11 = bitcast i8* %10 to i8**
  %load_target2 = load i8*, i8** %11
  %R741 = bitcast i8* %load_target2 to %struct.AVLNode_st*
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %R741, void (i8*)* %load_target1)
  br label %L229

L229:                                             ; preds = %L228, %L227
  %12 = bitcast %struct.avltree* %ARG1 to %struct.allocator_st**
  %13 = bitcast %struct.allocator_st** %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 24
  %15 = bitcast i8* %14 to %struct.allocator_st**
  %load_target3 = load %struct.allocator_st*, %struct.allocator_st** %15
  call void @destroy_allocator(%struct.allocator_st* %load_target3)
  ret void
}

define internal i32 @comparekeys(i8* %ARG1, i8* %ARG2) {
L230:
  %R748 = bitcast i8* %ARG1 to i32*
  %R750 = bitcast i8* %ARG2 to %struct.record*
  %0 = bitcast i32* %R748 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 0
  %2 = bitcast i8* %1 to i32*
  %load_target = load i32, i32* %2
  %3 = bitcast %struct.record* %R750 to i32*
  %4 = bitcast i32* %3 to i8*
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %6 = bitcast i8* %5 to i32*
  %load_target1 = load i32, i32* %6
  %R755 = sub i32 %load_target, %load_target1
  ret i32 %R755
}

define internal void @createobject(i8* %ARG1, i8* %ARG2) {
L231:
  %R758 = bitcast i8* %ARG2 to i32*
  %R760 = bitcast i8* %ARG1 to %struct.record*
  %0 = bitcast i32* %R758 to i8*
  %1 = getelementptr inbounds i8, i8* %0, i64 0
  %2 = bitcast i8* %1 to i32*
  %load_target = load i32, i32* %2
  %3 = bitcast %struct.record* %R760 to i32*
  %4 = bitcast i32* %3 to i8*
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %6 = bitcast i8* %5 to i32*
  store i32 %load_target, i32* %6
  ret void
}

define internal void @destroyobject(i8* %ARG1) {
L232:
  ret void
}

define internal void @assignobject(i8* %ARG1, i8* %ARG2) {
L233:
  %R765 = bitcast i8* %ARG1 to %struct.record*
  %R767 = bitcast i8* %ARG2 to %struct.record*
  %0 = bitcast %struct.record* %R767 to i32*
  %1 = bitcast i32* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to i32*
  %load_target = load i32, i32* %3
  %4 = bitcast %struct.record* %R765 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to i32*
  store i32 %load_target, i32* %7
  ret void
}

define i32 @main() {
L234:
  %key_0000027B4C9E41E8 = alloca i32
  %tree_0000027B4C9E3CA8 = alloca %struct.avltree
  %vtable_0000027B4C9E3D88 = alloca %struct.avl_vtbl
  %testdata_0000027B4C9E3AE8 = alloca [20 x i32]
  %0 = alloca i32
  %1 = alloca %struct.record*
  store i32 0, i32* @once
  %2 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %3 = bitcast i32* %2 to i8*
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %5 = bitcast i8* %4 to i32*
  store i32 97, i32* %5
  %6 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %7 = bitcast i32* %6 to i8*
  %8 = getelementptr inbounds i8, i8* %7, i64 4
  %9 = bitcast i8* %8 to i32*
  store i32 103, i32* %9
  %10 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %11 = bitcast i32* %10 to i8*
  %12 = getelementptr inbounds i8, i8* %11, i64 8
  %13 = bitcast i8* %12 to i32*
  store i32 113, i32* %13
  %14 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %15 = bitcast i32* %14 to i8*
  %16 = getelementptr inbounds i8, i8* %15, i64 12
  %17 = bitcast i8* %16 to i32*
  store i32 119, i32* %17
  %18 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %19 = bitcast i32* %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 16
  %21 = bitcast i8* %20 to i32*
  store i32 101, i32* %21
  %22 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %23 = bitcast i32* %22 to i8*
  %24 = getelementptr inbounds i8, i8* %23, i64 20
  %25 = bitcast i8* %24 to i32*
  store i32 102, i32* %25
  %26 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %27 = bitcast i32* %26 to i8*
  %28 = getelementptr inbounds i8, i8* %27, i64 24
  %29 = bitcast i8* %28 to i32*
  store i32 98, i32* %29
  %30 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %31 = bitcast i32* %30 to i8*
  %32 = getelementptr inbounds i8, i8* %31, i64 28
  %33 = bitcast i8* %32 to i32*
  store i32 120, i32* %33
  %34 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %35 = bitcast i32* %34 to i8*
  %36 = getelementptr inbounds i8, i8* %35, i64 32
  %37 = bitcast i8* %36 to i32*
  store i32 107, i32* %37
  %38 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %39 = bitcast i32* %38 to i8*
  %40 = getelementptr inbounds i8, i8* %39, i64 36
  %41 = bitcast i8* %40 to i32*
  store i32 108, i32* %41
  %42 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %43 = bitcast i32* %42 to i8*
  %44 = getelementptr inbounds i8, i8* %43, i64 40
  %45 = bitcast i8* %44 to i32*
  store i32 112, i32* %45
  %46 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %47 = bitcast i32* %46 to i8*
  %48 = getelementptr inbounds i8, i8* %47, i64 44
  %49 = bitcast i8* %48 to i32*
  store i32 109, i32* %49
  %50 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %51 = bitcast i32* %50 to i8*
  %52 = getelementptr inbounds i8, i8* %51, i64 48
  %53 = bitcast i8* %52 to i32*
  store i32 115, i32* %53
  %54 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %55 = bitcast i32* %54 to i8*
  %56 = getelementptr inbounds i8, i8* %55, i64 52
  %57 = bitcast i8* %56 to i32*
  store i32 121, i32* %57
  %58 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %59 = bitcast i32* %58 to i8*
  %60 = getelementptr inbounds i8, i8* %59, i64 56
  %61 = bitcast i8* %60 to i32*
  store i32 116, i32* %61
  %62 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %63 = bitcast i32* %62 to i8*
  %64 = getelementptr inbounds i8, i8* %63, i64 60
  %65 = bitcast i8* %64 to i32*
  store i32 117, i32* %65
  %66 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %67 = bitcast i32* %66 to i8*
  %68 = getelementptr inbounds i8, i8* %67, i64 64
  %69 = bitcast i8* %68 to i32*
  store i32 111, i32* %69
  %70 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %71 = bitcast i32* %70 to i8*
  %72 = getelementptr inbounds i8, i8* %71, i64 68
  %73 = bitcast i8* %72 to i32*
  store i32 114, i32* %73
  %74 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %75 = bitcast i32* %74 to i8*
  %76 = getelementptr inbounds i8, i8* %75, i64 72
  %77 = bitcast i8* %76 to i32*
  store i32 106, i32* %77
  %78 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %79 = bitcast i32* %78 to i8*
  %80 = getelementptr inbounds i8, i8* %79, i64 76
  %81 = bitcast i8* %80 to i32*
  store i32 48, i32* %81
  %82 = bitcast %struct.avl_vtbl* %vtable_0000027B4C9E3D88 to i32 (i8*, i8*)**
  %83 = bitcast i32 (i8*, i8*)** %82 to i8*
  %84 = getelementptr inbounds i8, i8* %83, i64 0
  %85 = bitcast i8* %84 to i32 (i8*, i8*)**
  store i32 (i8*, i8*)* @comparekeys, i32 (i8*, i8*)** %85
  %86 = bitcast %struct.avl_vtbl* %vtable_0000027B4C9E3D88 to void (i8*, i8*)**
  %87 = bitcast void (i8*, i8*)** %86 to i8*
  %88 = getelementptr inbounds i8, i8* %87, i64 8
  %89 = bitcast i8* %88 to void (i8*, i8*)**
  store void (i8*, i8*)* @createobject, void (i8*, i8*)** %89
  %90 = bitcast %struct.avl_vtbl* %vtable_0000027B4C9E3D88 to void (i8*)**
  %91 = bitcast void (i8*)** %90 to i8*
  %92 = getelementptr inbounds i8, i8* %91, i64 24
  %93 = bitcast i8* %92 to void (i8*)**
  store void (i8*)* @destroyobject, void (i8*)** %93
  %94 = bitcast %struct.avl_vtbl* %vtable_0000027B4C9E3D88 to void (i8*, i8*)**
  %95 = bitcast void (i8*, i8*)** %94 to i8*
  %96 = getelementptr inbounds i8, i8* %95, i64 16
  %97 = bitcast i8* %96 to void (i8*, i8*)**
  store void (i8*, i8*)* @assignobject, void (i8*, i8*)** %97
  %R777 = call %struct.avltree* @AVLTree_New(%struct.avltree* %tree_0000027B4C9E3CA8, %struct.avl_vtbl* %vtable_0000027B4C9E3D88, i32 4, i32 1000)
  store i32 0, i32* %0
  br label %L235

L235:                                             ; preds = %L236, %L234
  %98 = load i32, i32* %0
  %R779 = icmp slt i32 %98, 20
  %R7791 = zext i1 %R779 to i32
  %cond = icmp ne i32 %R7791, 0
  br i1 %cond, label %L236, label %L237

L236:                                             ; preds = %L235
  %R780 = bitcast [20 x i32]* %testdata_0000027B4C9E3AE8 to i32*
  %R782 = sext i32 %98 to i64
  %R783 = mul i64 %R782, 4
  %99 = bitcast i32* %R780 to i8*
  %100 = getelementptr inbounds i8, i8* %99, i64 %R783
  %101 = bitcast i8* %100 to i32*
  %102 = bitcast i32* %101 to i8*
  %103 = getelementptr inbounds i8, i8* %102, i64 0
  %104 = bitcast i8* %103 to i32*
  %load_target = load i32, i32* %104
  %105 = bitcast i32* %key_0000027B4C9E41E8 to i8*
  %106 = getelementptr inbounds i8, i8* %105, i64 0
  %107 = bitcast i8* %106 to i32*
  store i32 %load_target, i32* %107
  %R788 = bitcast i32* %key_0000027B4C9E41E8 to i8*
  %R789 = call i8* @AVLTree_Insert(%struct.avltree* %tree_0000027B4C9E3CA8, i8* %R788)
  %R791 = add i32 %98, 1
  store i32 %R791, i32* %0
  br label %L235

L237:                                             ; preds = %L235
  %R793 = call i8* @AVLTree_FindFirst(%struct.avltree* %tree_0000027B4C9E3CA8)
  %R794 = bitcast i8* %R793 to %struct.record*
  store %struct.record* %R794, %struct.record** %1
  br label %L238

L238:                                             ; preds = %L239, %L237
  %108 = load %struct.record*, %struct.record** %1
  %cond2 = icmp ne %struct.record* %108, null
  br i1 %cond2, label %L239, label %L240

L239:                                             ; preds = %L238
  %109 = bitcast %struct.record* %108 to i32*
  %110 = bitcast i32* %109 to i8*
  %111 = getelementptr inbounds i8, i8* %110, i64 0
  %112 = bitcast i8* %111 to i32*
  %load_target3 = load i32, i32* %112
  %R800 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %load_target3)
  %R803 = bitcast %struct.record* %108 to i8*
  %R804 = call i8* @AVLTree_FindNext(%struct.avltree* %tree_0000027B4C9E3CA8, i8* %R803)
  %R805 = bitcast i8* %R804 to %struct.record*
  store %struct.record* %R805, %struct.record** %1
  br label %L238

L240:                                             ; preds = %L238
  call void @AVLTree_Destroy(%struct.avltree* %tree_0000027B4C9E3CA8)
  ret i32 0
}
