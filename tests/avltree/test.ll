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
  %5 = ptrtoint i8* %4 to i64
  %R9 = add i64 %5, 1
  %6 = inttoptr i64 %R9 to i8*
  %7 = ptrtoint i8* %4 to i64
  %8 = add i64 %7, 0
  %9 = inttoptr i64 %8 to i8*
  %load_target = load i8, i8* %9
  %10 = load i8*, i8** %2
  %11 = ptrtoint i8* %10 to i64
  %R12 = add i64 %11, 1
  %12 = inttoptr i64 %R12 to i8*
  %13 = ptrtoint i8* %10 to i64
  %14 = add i64 %13, 0
  %15 = inttoptr i64 %14 to i8*
  store i8 %load_target, i8* %15
  store i8* %12, i8** %2
  store i8* %6, i8** %1
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
  store %struct.link_st* null, %struct.link_st** inttoptr (i64 add (i64 ptrtoint (%struct.allocator_st* @A to i64), i64 8) to %struct.link_st**)
  store i8* null, i8** inttoptr (i64 add (i64 ptrtoint (%struct.allocator_st* @A to i64), i64 16) to i8**)
  store i8* null, i8** inttoptr (i64 add (i64 ptrtoint (%struct.allocator_st* @A to i64), i64 24) to i8**)
  store i32 %ARG1, i32* inttoptr (i64 add (i64 ptrtoint (%struct.allocator_st* @A to i64), i64 32) to i32*)
  store i32 %ARG2, i32* inttoptr (i64 add (i64 ptrtoint (%struct.allocator_st* @A to i64), i64 36) to i32*)
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
  store i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @Memory, i32 0, i32 0), i8** inttoptr (i64 add (i64 ptrtoint (%struct.buffer_type_st* @Node to i64), i64 8) to i8**)
  %0 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to %struct.buffer_type_st**
  %load_target1 = load %struct.buffer_type_st*, %struct.buffer_type_st** %2
  store %struct.buffer_type_st* %load_target1, %struct.buffer_type_st** getelementptr inbounds (%struct.buffer_type_st, %struct.buffer_type_st* @Node, i32 0, i32 0)
  %3 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to %struct.buffer_type_st**
  store %struct.buffer_type_st* @Node, %struct.buffer_type_st** %5
  %load_target2 = load i8*, i8** inttoptr (i64 add (i64 ptrtoint (%struct.buffer_type_st* @Node to i64), i64 8) to i8**)
  %6 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %7 = add i64 %6, 16
  %8 = inttoptr i64 %7 to i8**
  store i8* %load_target2, i8** %8
  %9 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %10 = add i64 %9, 32
  %11 = inttoptr i64 %10 to i32*
  %load_target3 = load i32, i32* %11
  %12 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %13 = add i64 %12, 36
  %14 = inttoptr i64 %13 to i32*
  %load_target4 = load i32, i32* %14
  %R54 = mul i32 %load_target3, %load_target4
  %R55 = sext i32 %R54 to i64
  %15 = ptrtoint i8* %load_target2 to i64
  %R56 = add i64 %15, %R55
  %16 = inttoptr i64 %R56 to i8*
  %17 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %18 = add i64 %17, 24
  %19 = inttoptr i64 %18 to i8**
  store i8* %16, i8** %19
  ret void
}

define i8* @alloc_node(%struct.allocator_st* %ARG1) {
L11:
  %0 = alloca i8*
  %1 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %2 = add i64 %1, 8
  %3 = inttoptr i64 %2 to %struct.link_st**
  %load_target = load %struct.link_st*, %struct.link_st** %3
  %cond = icmp ne %struct.link_st* %load_target, null
  br i1 %cond, label %L12, label %L13

L12:                                              ; preds = %L11
  %4 = ptrtoint %struct.link_st* %load_target to i64
  %5 = add i64 %4, 0
  %6 = inttoptr i64 %5 to %struct.link_st**
  %load_target1 = load %struct.link_st*, %struct.link_st** %6
  %7 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %8 = add i64 %7, 8
  %9 = inttoptr i64 %8 to %struct.link_st**
  store %struct.link_st* %load_target1, %struct.link_st** %9
  %R68 = bitcast %struct.link_st* %load_target to i8*
  store i8* %R68, i8** %0
  br label %L16

L13:                                              ; preds = %L11
  %10 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %11 = add i64 %10, 16
  %12 = inttoptr i64 %11 to i8**
  %load_target2 = load i8*, i8** %12
  %13 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %14 = add i64 %13, 24
  %15 = inttoptr i64 %14 to i8**
  %load_target3 = load i8*, i8** %15
  %16 = ptrtoint i8* %load_target2 to i64
  %17 = ptrtoint i8* %load_target3 to i64
  %R74 = icmp eq i64 %16, %17
  %R744 = zext i1 %R74 to i32
  %cond5 = icmp ne i32 %R744, 0
  br i1 %cond5, label %L14, label %L15

L14:                                              ; preds = %L13
  call void @grow_allocator(%struct.allocator_st* %ARG1)
  br label %L15

L15:                                              ; preds = %L14, %L13
  %18 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %19 = add i64 %18, 16
  %20 = inttoptr i64 %19 to i8**
  %load_target6 = load i8*, i8** %20
  %21 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %22 = add i64 %21, 32
  %23 = inttoptr i64 %22 to i32*
  %load_target7 = load i32, i32* %23
  %R81 = sext i32 %load_target7 to i64
  %R84 = ptrtoint i8* %load_target6 to i64
  %R85 = add i64 %R84, %R81
  %R86 = inttoptr i64 %R85 to i8*
  %24 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %25 = add i64 %24, 16
  %26 = inttoptr i64 %25 to i8**
  store i8* %R86, i8** %26
  store i8* %load_target6, i8** %0
  br label %L16

L16:                                              ; preds = %L15, %L12
  %27 = load i8*, i8** %0
  ret i8* %27
}

define void @dealloc_node(%struct.allocator_st* %ARG1, i8* %ARG2) {
L17:
  %0 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to %struct.link_st**
  %load_target = load %struct.link_st*, %struct.link_st** %2
  %R91 = bitcast i8* %ARG2 to %struct.link_st*
  %3 = ptrtoint %struct.link_st* %R91 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to %struct.link_st**
  store %struct.link_st* %load_target, %struct.link_st** %5
  %6 = ptrtoint %struct.allocator_st* %ARG1 to i64
  %7 = add i64 %6, 8
  %8 = inttoptr i64 %7 to %struct.link_st**
  store %struct.link_st* %R91, %struct.link_st** %8
  ret void
}

define void @destroy_allocator(%struct.allocator_st* %ARG1) {
L18:
  ret void
}

define void @AVL_SetRight(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %ARG2) {
L19:
  %0 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %1 = add i64 %0, 16
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG2, %struct.AVLNode_st** %2
  %cond = icmp ne %struct.AVLNode_st* %ARG2, null
  br i1 %cond, label %L20, label %L21

L20:                                              ; preds = %L19
  %3 = ptrtoint %struct.AVLNode_st* %ARG2 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %5
  br label %L21

L21:                                              ; preds = %L20, %L19
  ret void
}

define void @AVL_SetLeft(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %ARG2) {
L22:
  %0 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG2, %struct.AVLNode_st** %2
  %cond = icmp ne %struct.AVLNode_st* %ARG2, null
  br i1 %cond, label %L23, label %L24

L23:                                              ; preds = %L22
  %3 = ptrtoint %struct.AVLNode_st* %ARG2 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %5
  br label %L24

L24:                                              ; preds = %L23, %L22
  ret void
}

define %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1) {
L25:
  %0 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %1 = add i64 %0, 16
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %3 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %cond = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond, label %L26, label %L29

L26:                                              ; preds = %L25
  %6 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %7 = add i64 %6, 8
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %8
  %9 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %10 = ptrtoint %struct.AVLNode_st* %load_target2 to i64
  %R114 = icmp eq i64 %9, %10
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
  %11 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %13
  br label %L30

L30:                                              ; preds = %L29, %L28, %L27
  %14 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %15 = add i64 %14, 8
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %load_target5 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  call void @AVL_SetRight(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %load_target5)
  call void @AVL_SetLeft(%struct.AVLNode_st* %load_target, %struct.AVLNode_st* %ARG1)
  ret %struct.AVLNode_st* %load_target
}

define %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1) {
L31:
  %0 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %3 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %cond = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond, label %L32, label %L35

L32:                                              ; preds = %L31
  %6 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %7 = add i64 %6, 8
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %8
  %9 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %10 = ptrtoint %struct.AVLNode_st* %load_target2 to i64
  %R138 = icmp eq i64 %9, %10
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
  %11 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %13
  br label %L36

L36:                                              ; preds = %L35, %L34, %L33
  %14 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %15 = add i64 %14, 16
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %load_target5 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  call void @AVL_SetLeft(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %load_target5)
  call void @AVL_SetRight(%struct.AVLNode_st* %load_target, %struct.AVLNode_st* %ARG1)
  ret %struct.AVLNode_st* %load_target
}

define %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %ARG1) {
L37:
  %0 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %3 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %4 = add i64 %3, 16
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %6 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %7 = add i64 %6, 24
  %8 = inttoptr i64 %7 to i32*
  %load_target2 = load i32, i32* %8
  switch i32 %load_target2, label %L41 [
    i32 0, label %L39
    i32 1, label %L40
    i32 2, label %L38
  ]

L38:                                              ; preds = %L37
  %9 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %10 = add i64 %9, 24
  %11 = inttoptr i64 %10 to i32*
  store i32 0, i32* %11
  %12 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %13 = add i64 %12, 24
  %14 = inttoptr i64 %13 to i32*
  store i32 1, i32* %14
  br label %L41

L39:                                              ; preds = %L37
  %15 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %16 = add i64 %15, 24
  %17 = inttoptr i64 %16 to i32*
  store i32 0, i32* %17
  %18 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %19 = add i64 %18, 24
  %20 = inttoptr i64 %19 to i32*
  store i32 0, i32* %20
  br label %L41

L40:                                              ; preds = %L37
  %21 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %22 = add i64 %21, 24
  %23 = inttoptr i64 %22 to i32*
  store i32 2, i32* %23
  %24 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %25 = add i64 %24, 24
  %26 = inttoptr i64 %25 to i32*
  store i32 0, i32* %26
  br label %L41

L41:                                              ; preds = %L40, %L39, %L38, %L37
  %27 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %28 = add i64 %27, 24
  %29 = inttoptr i64 %28 to i32*
  store i32 0, i32* %29
  %R168 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %load_target)
  call void @AVL_SetLeft(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %R168)
  %R170 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1)
  ret %struct.AVLNode_st* %R170
}

define %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %ARG1) {
L42:
  %0 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %1 = add i64 %0, 16
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %3 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %4 = add i64 %3, 8
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %6 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %7 = add i64 %6, 24
  %8 = inttoptr i64 %7 to i32*
  %load_target2 = load i32, i32* %8
  switch i32 %load_target2, label %L46 [
    i32 0, label %L44
    i32 1, label %L45
    i32 2, label %L43
  ]

L43:                                              ; preds = %L42
  %9 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %10 = add i64 %9, 24
  %11 = inttoptr i64 %10 to i32*
  store i32 1, i32* %11
  %12 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %13 = add i64 %12, 24
  %14 = inttoptr i64 %13 to i32*
  store i32 0, i32* %14
  br label %L46

L44:                                              ; preds = %L42
  %15 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %16 = add i64 %15, 24
  %17 = inttoptr i64 %16 to i32*
  store i32 0, i32* %17
  %18 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %19 = add i64 %18, 24
  %20 = inttoptr i64 %19 to i32*
  store i32 0, i32* %20
  br label %L46

L45:                                              ; preds = %L42
  %21 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %22 = add i64 %21, 24
  %23 = inttoptr i64 %22 to i32*
  store i32 0, i32* %23
  %24 = ptrtoint %struct.AVLNode_st* %load_target to i64
  %25 = add i64 %24, 24
  %26 = inttoptr i64 %25 to i32*
  store i32 2, i32* %26
  br label %L46

L46:                                              ; preds = %L45, %L44, %L43, %L42
  %27 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %28 = add i64 %27, 24
  %29 = inttoptr i64 %28 to i32*
  store i32 0, i32* %29
  %R188 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %load_target)
  call void @AVL_SetRight(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %R188)
  %R190 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1)
  ret %struct.AVLNode_st* %R190
}

define %struct.AVLNode_st* @AVL_RebalanceHeavierLeft(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L47:
  %0 = alloca %struct.AVLNode_st*
  %1 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %2 = add i64 %1, 24
  %3 = inttoptr i64 %2 to i32*
  %load_target = load i32, i32* %3
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target, label %L54 [
    i32 0, label %L49
    i32 1, label %L50
    i32 2, label %L48
  ]

L48:                                              ; preds = %L47
  %4 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %5 = add i64 %4, 24
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  %7 = ptrtoint i32* %ARG2 to i64
  %8 = add i64 %7, 0
  %9 = inttoptr i64 %8 to i32*
  store i32 0, i32* %9
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L54

L49:                                              ; preds = %L47
  %10 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %11 = add i64 %10, 24
  %12 = inttoptr i64 %11 to i32*
  store i32 1, i32* %12
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L54

L50:                                              ; preds = %L47
  %13 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %14 = add i64 %13, 8
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %16 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %17 = add i64 %16, 24
  %18 = inttoptr i64 %17 to i32*
  %load_target2 = load i32, i32* %18
  switch i32 %load_target2, label %L53 [
    i32 1, label %L51
    i32 2, label %L52
  ]

L51:                                              ; preds = %L50
  %19 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %20 = add i64 %19, 24
  %21 = inttoptr i64 %20 to i32*
  store i32 0, i32* %21
  %22 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %23 = add i64 %22, 24
  %24 = inttoptr i64 %23 to i32*
  store i32 0, i32* %24
  %R206 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R206, %struct.AVLNode_st** %0
  br label %L53

L52:                                              ; preds = %L50
  %R208 = call %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R208, %struct.AVLNode_st** %0
  br label %L53

L53:                                              ; preds = %L52, %L51, %L50
  %25 = ptrtoint i32* %ARG2 to i64
  %26 = add i64 %25, 0
  %27 = inttoptr i64 %26 to i32*
  store i32 0, i32* %27
  br label %L54

L54:                                              ; preds = %L53, %L49, %L48, %L47
  %28 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %28
}

define %struct.AVLNode_st* @AVL_RebalanceHeavierRight(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L55:
  %0 = alloca %struct.AVLNode_st*
  %1 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %2 = add i64 %1, 24
  %3 = inttoptr i64 %2 to i32*
  %load_target = load i32, i32* %3
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target, label %L62 [
    i32 0, label %L57
    i32 1, label %L56
    i32 2, label %L58
  ]

L56:                                              ; preds = %L55
  %4 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %5 = add i64 %4, 24
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  %7 = ptrtoint i32* %ARG2 to i64
  %8 = add i64 %7, 0
  %9 = inttoptr i64 %8 to i32*
  store i32 0, i32* %9
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L62

L57:                                              ; preds = %L55
  %10 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %11 = add i64 %10, 24
  %12 = inttoptr i64 %11 to i32*
  store i32 2, i32* %12
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L62

L58:                                              ; preds = %L55
  %13 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %14 = add i64 %13, 16
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %16 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %17 = add i64 %16, 24
  %18 = inttoptr i64 %17 to i32*
  %load_target2 = load i32, i32* %18
  switch i32 %load_target2, label %L61 [
    i32 1, label %L60
    i32 2, label %L59
  ]

L59:                                              ; preds = %L58
  %19 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %20 = add i64 %19, 24
  %21 = inttoptr i64 %20 to i32*
  store i32 0, i32* %21
  %22 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %23 = add i64 %22, 24
  %24 = inttoptr i64 %23 to i32*
  store i32 0, i32* %24
  %R225 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R225, %struct.AVLNode_st** %0
  br label %L61

L60:                                              ; preds = %L58
  %R227 = call %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R227, %struct.AVLNode_st** %0
  br label %L61

L61:                                              ; preds = %L60, %L59, %L58
  %25 = ptrtoint i32* %ARG2 to i64
  %26 = add i64 %25, 0
  %27 = inttoptr i64 %26 to i32*
  store i32 0, i32* %27
  br label %L62

L62:                                              ; preds = %L61, %L57, %L56, %L55
  %28 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %28
}

define %struct.AVLNode_st* @AVL_RebalanceShorterLeft(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L63:
  %0 = alloca %struct.AVLNode_st*
  %1 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %2 = add i64 %1, 24
  %3 = inttoptr i64 %2 to i32*
  %load_target = load i32, i32* %3
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target, label %L70 [
    i32 0, label %L64
    i32 1, label %L65
    i32 2, label %L66
  ]

L64:                                              ; preds = %L63
  %4 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %5 = add i64 %4, 24
  %6 = inttoptr i64 %5 to i32*
  store i32 2, i32* %6
  %7 = ptrtoint i32* %ARG2 to i64
  %8 = add i64 %7, 0
  %9 = inttoptr i64 %8 to i32*
  store i32 0, i32* %9
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L70

L65:                                              ; preds = %L63
  %10 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %11 = add i64 %10, 24
  %12 = inttoptr i64 %11 to i32*
  store i32 0, i32* %12
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L70

L66:                                              ; preds = %L63
  %13 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %14 = add i64 %13, 16
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %16 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %17 = add i64 %16, 24
  %18 = inttoptr i64 %17 to i32*
  %load_target2 = load i32, i32* %18
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target2, label %L70 [
    i32 0, label %L67
    i32 1, label %L69
    i32 2, label %L68
  ]

L67:                                              ; preds = %L66
  %19 = ptrtoint i32* %ARG2 to i64
  %20 = add i64 %19, 0
  %21 = inttoptr i64 %20 to i32*
  store i32 0, i32* %21
  %22 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %23 = add i64 %22, 24
  %24 = inttoptr i64 %23 to i32*
  store i32 1, i32* %24
  %R244 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R244, %struct.AVLNode_st** %0
  br label %L70

L68:                                              ; preds = %L66
  %25 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %26 = add i64 %25, 24
  %27 = inttoptr i64 %26 to i32*
  store i32 0, i32* %27
  %28 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %29 = add i64 %28, 24
  %30 = inttoptr i64 %29 to i32*
  store i32 0, i32* %30
  %R248 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R248, %struct.AVLNode_st** %0
  br label %L70

L69:                                              ; preds = %L66
  %R250 = call %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R250, %struct.AVLNode_st** %0
  br label %L70

L70:                                              ; preds = %L69, %L68, %L67, %L66, %L65, %L64, %L63
  %31 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %31
}

define %struct.AVLNode_st* @AVL_RebalanceShorterRight(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L71:
  %0 = alloca %struct.AVLNode_st*
  %1 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %2 = add i64 %1, 24
  %3 = inttoptr i64 %2 to i32*
  %load_target = load i32, i32* %3
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target, label %L78 [
    i32 0, label %L72
    i32 1, label %L74
    i32 2, label %L73
  ]

L72:                                              ; preds = %L71
  %4 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %5 = add i64 %4, 24
  %6 = inttoptr i64 %5 to i32*
  store i32 1, i32* %6
  %7 = ptrtoint i32* %ARG2 to i64
  %8 = add i64 %7, 0
  %9 = inttoptr i64 %8 to i32*
  store i32 0, i32* %9
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L78

L73:                                              ; preds = %L71
  %10 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %11 = add i64 %10, 24
  %12 = inttoptr i64 %11 to i32*
  store i32 0, i32* %12
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  br label %L78

L74:                                              ; preds = %L71
  %13 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %14 = add i64 %13, 8
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %16 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %17 = add i64 %16, 24
  %18 = inttoptr i64 %17 to i32*
  %load_target2 = load i32, i32* %18
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %0
  switch i32 %load_target2, label %L78 [
    i32 0, label %L75
    i32 1, label %L76
    i32 2, label %L77
  ]

L75:                                              ; preds = %L74
  %19 = ptrtoint i32* %ARG2 to i64
  %20 = add i64 %19, 0
  %21 = inttoptr i64 %20 to i32*
  store i32 0, i32* %21
  %22 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %23 = add i64 %22, 24
  %24 = inttoptr i64 %23 to i32*
  store i32 2, i32* %24
  %R266 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R266, %struct.AVLNode_st** %0
  br label %L78

L76:                                              ; preds = %L74
  %25 = ptrtoint %struct.AVLNode_st* %load_target1 to i64
  %26 = add i64 %25, 24
  %27 = inttoptr i64 %26 to i32*
  store i32 0, i32* %27
  %28 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %29 = add i64 %28, 24
  %30 = inttoptr i64 %29 to i32*
  store i32 0, i32* %30
  %R270 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R270, %struct.AVLNode_st** %0
  br label %L78

L77:                                              ; preds = %L74
  %R272 = call %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %ARG1)
  store %struct.AVLNode_st* %R272, %struct.AVLNode_st** %0
  br label %L78

L78:                                              ; preds = %L77, %L76, %L75, %L74, %L73, %L72, %L71
  %31 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %31
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
  %4 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %5 = add i64 %4, 8
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %cond1 = icmp ne %struct.AVLNode_st* %load_target, null
  br i1 %cond1, label %L82, label %L83

L82:                                              ; preds = %L81
  %R282 = call i32 @AVL_Height(%struct.AVLNode_st* %load_target)
  store i32 %R282, i32* %0
  br label %L83

L83:                                              ; preds = %L82, %L81
  %7 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %8 = add i64 %7, 16
  %9 = inttoptr i64 %8 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %9
  %cond3 = icmp ne %struct.AVLNode_st* %load_target2, null
  br i1 %cond3, label %L84, label %L85

L84:                                              ; preds = %L83
  %R287 = call i32 @AVL_Height(%struct.AVLNode_st* %load_target2)
  store i32 %R287, i32* %1
  br label %L85

L85:                                              ; preds = %L84, %L83
  %10 = load i32, i32* %0
  %11 = load i32, i32* %1
  %R290 = icmp sgt i32 %10, %11
  %R2904 = zext i1 %R290 to i32
  %cond5 = icmp ne i32 %R2904, 0
  br i1 %cond5, label %L86, label %L87

L86:                                              ; preds = %L85
  %R292 = add i32 %10, 1
  store i32 %R292, i32* %2
  br label %L88

L87:                                              ; preds = %L85
  %R298 = add i32 %11, 1
  store i32 %R298, i32* %2
  br label %L88

L88:                                              ; preds = %L87, %L86
  %12 = load i32, i32* %2
  store i32 %12, i32* %3
  br label %L89

L89:                                              ; preds = %L88, %L80
  %13 = load i32, i32* %3
  ret i32 %13
}

define i8* @AVLTree_FindFirst(%struct.avltree* %ARG1) {
L90:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca i8*
  %2 = ptrtoint %struct.avltree* %ARG1 to i64
  %3 = add i64 %2, 8
  %4 = inttoptr i64 %3 to i8**
  %load_target = load i8*, i8** %4
  %cond = icmp ne i8* %load_target, null
  br i1 %cond, label %L91, label %L95

L91:                                              ; preds = %L90
  %R308 = bitcast i8* %load_target to %struct.AVLNode_st*
  store %struct.AVLNode_st* %R308, %struct.AVLNode_st** %0
  br label %L92

L92:                                              ; preds = %L93, %L91
  %5 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %6 = ptrtoint %struct.AVLNode_st* %5 to i64
  %7 = add i64 %6, 8
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %8
  %cond2 = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond2, label %L93, label %L94

L93:                                              ; preds = %L92
  store %struct.AVLNode_st* %load_target1, %struct.AVLNode_st** %0
  br label %L92

L94:                                              ; preds = %L92
  %9 = ptrtoint %struct.AVLNode_st* %5 to i64
  %R315 = add i64 %9, 32
  %10 = inttoptr i64 %R315 to %struct.AVLNode_st*
  %R316 = bitcast %struct.AVLNode_st* %10 to i8*
  store i8* %R316, i8** %1
  br label %L96

L95:                                              ; preds = %L90
  store i8* null, i8** %1
  br label %L96

L96:                                              ; preds = %L95, %L94
  %11 = load i8*, i8** %1
  ret i8* %11
}

define i8* @AVLTree_FindLast(%struct.avltree* %ARG1) {
L97:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca i8*
  %2 = ptrtoint %struct.avltree* %ARG1 to i64
  %3 = add i64 %2, 8
  %4 = inttoptr i64 %3 to i8**
  %load_target = load i8*, i8** %4
  %cond = icmp ne i8* %load_target, null
  br i1 %cond, label %L98, label %L102

L98:                                              ; preds = %L97
  %R322 = bitcast i8* %load_target to %struct.AVLNode_st*
  store %struct.AVLNode_st* %R322, %struct.AVLNode_st** %0
  br label %L99

L99:                                              ; preds = %L100, %L98
  %5 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %6 = ptrtoint %struct.AVLNode_st* %5 to i64
  %7 = add i64 %6, 16
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %8
  %cond2 = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond2, label %L100, label %L101

L100:                                             ; preds = %L99
  store %struct.AVLNode_st* %load_target1, %struct.AVLNode_st** %0
  br label %L99

L101:                                             ; preds = %L99
  %9 = ptrtoint %struct.AVLNode_st* %5 to i64
  %R329 = add i64 %9, 32
  %10 = inttoptr i64 %R329 to %struct.AVLNode_st*
  %R330 = bitcast %struct.AVLNode_st* %10 to i8*
  store i8* %R330, i8** %1
  br label %L103

L102:                                             ; preds = %L97
  store i8* null, i8** %1
  br label %L103

L103:                                             ; preds = %L102, %L101
  %11 = load i8*, i8** %1
  ret i8* %11
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
  %5 = ptrtoint %struct.AVLNode_st* %R333 to i64
  %R336 = add i64 %5, -32
  %6 = inttoptr i64 %R336 to %struct.AVLNode_st*
  %7 = ptrtoint %struct.AVLNode_st* %R333 to i64
  %8 = add i64 %7, -16
  %9 = inttoptr i64 %8 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %9
  %cond1 = icmp ne %struct.AVLNode_st* %load_target, null
  br i1 %cond1, label %L106, label %L109

L106:                                             ; preds = %L105
  store %struct.AVLNode_st* %load_target, %struct.AVLNode_st** %0
  br label %L107

L107:                                             ; preds = %L108, %L106
  %10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %11 = ptrtoint %struct.AVLNode_st* %10 to i64
  %12 = add i64 %11, 8
  %13 = inttoptr i64 %12 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %13
  store %struct.AVLNode_st* %10, %struct.AVLNode_st** %3
  %cond3 = icmp ne %struct.AVLNode_st* %load_target2, null
  br i1 %cond3, label %L108, label %L113

L108:                                             ; preds = %L107
  store %struct.AVLNode_st* %load_target2, %struct.AVLNode_st** %0
  br label %L107

L109:                                             ; preds = %L105
  %14 = ptrtoint %struct.AVLNode_st* %R333 to i64
  %15 = add i64 %14, -32
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %load_target4 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  store %struct.AVLNode_st* %load_target4, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %6, %struct.AVLNode_st** %2
  br label %L110

L110:                                             ; preds = %L112, %L109
  %17 = load %struct.AVLNode_st*, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %3
  %cond5 = icmp ne %struct.AVLNode_st* %17, null
  br i1 %cond5, label %L111, label %L113

L111:                                             ; preds = %L110
  %18 = ptrtoint %struct.AVLNode_st* %17 to i64
  %19 = add i64 %18, 16
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %load_target6 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %21 = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %22 = ptrtoint %struct.AVLNode_st* %load_target6 to i64
  %23 = ptrtoint %struct.AVLNode_st* %21 to i64
  %R353 = icmp eq i64 %22, %23
  %R3537 = zext i1 %R353 to i32
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %3
  %cond8 = icmp ne i32 %R3537, 0
  br i1 %cond8, label %L112, label %L113

L112:                                             ; preds = %L111
  %24 = ptrtoint %struct.AVLNode_st* %17 to i64
  %25 = add i64 %24, 0
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %load_target9 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  store %struct.AVLNode_st* %load_target9, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %2
  br label %L110

L113:                                             ; preds = %L111, %L110, %L107, %L104
  %27 = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %cond10 = icmp ne %struct.AVLNode_st* %27, null
  br i1 %cond10, label %L114, label %L115

L114:                                             ; preds = %L113
  %28 = ptrtoint %struct.AVLNode_st* %27 to i64
  %R359 = add i64 %28, 32
  %29 = inttoptr i64 %R359 to %struct.AVLNode_st*
  %R360 = bitcast %struct.AVLNode_st* %29 to i8*
  store i8* %R360, i8** %4
  br label %L116

L115:                                             ; preds = %L113
  store i8* null, i8** %4
  br label %L116

L116:                                             ; preds = %L115, %L114
  %30 = load i8*, i8** %4
  ret i8* %30
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
  %5 = ptrtoint %struct.AVLNode_st* %R363 to i64
  %R366 = add i64 %5, -32
  %6 = inttoptr i64 %R366 to %struct.AVLNode_st*
  %7 = ptrtoint %struct.AVLNode_st* %R363 to i64
  %8 = add i64 %7, -24
  %9 = inttoptr i64 %8 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %9
  %cond1 = icmp ne %struct.AVLNode_st* %load_target, null
  br i1 %cond1, label %L119, label %L122

L119:                                             ; preds = %L118
  store %struct.AVLNode_st* %load_target, %struct.AVLNode_st** %0
  br label %L120

L120:                                             ; preds = %L121, %L119
  %10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %11 = ptrtoint %struct.AVLNode_st* %10 to i64
  %12 = add i64 %11, 16
  %13 = inttoptr i64 %12 to %struct.AVLNode_st**
  %load_target2 = load %struct.AVLNode_st*, %struct.AVLNode_st** %13
  store %struct.AVLNode_st* %10, %struct.AVLNode_st** %3
  %cond3 = icmp ne %struct.AVLNode_st* %load_target2, null
  br i1 %cond3, label %L121, label %L126

L121:                                             ; preds = %L120
  store %struct.AVLNode_st* %load_target2, %struct.AVLNode_st** %0
  br label %L120

L122:                                             ; preds = %L118
  %14 = ptrtoint %struct.AVLNode_st* %R363 to i64
  %15 = add i64 %14, -32
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %load_target4 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  store %struct.AVLNode_st* %load_target4, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %6, %struct.AVLNode_st** %2
  br label %L123

L123:                                             ; preds = %L125, %L122
  %17 = load %struct.AVLNode_st*, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %3
  %cond5 = icmp ne %struct.AVLNode_st* %17, null
  br i1 %cond5, label %L124, label %L126

L124:                                             ; preds = %L123
  %18 = ptrtoint %struct.AVLNode_st* %17 to i64
  %19 = add i64 %18, 8
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %load_target6 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %21 = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %22 = ptrtoint %struct.AVLNode_st* %load_target6 to i64
  %23 = ptrtoint %struct.AVLNode_st* %21 to i64
  %R383 = icmp eq i64 %22, %23
  %R3837 = zext i1 %R383 to i32
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %3
  %cond8 = icmp ne i32 %R3837, 0
  br i1 %cond8, label %L125, label %L126

L125:                                             ; preds = %L124
  %24 = ptrtoint %struct.AVLNode_st* %17 to i64
  %25 = add i64 %24, 0
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %load_target9 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  store %struct.AVLNode_st* %load_target9, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %17, %struct.AVLNode_st** %2
  br label %L123

L126:                                             ; preds = %L124, %L123, %L120, %L117
  %27 = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %cond10 = icmp ne %struct.AVLNode_st* %27, null
  br i1 %cond10, label %L127, label %L128

L127:                                             ; preds = %L126
  %28 = ptrtoint %struct.AVLNode_st* %27 to i64
  %R389 = add i64 %28, 32
  %29 = inttoptr i64 %R389 to %struct.AVLNode_st*
  %R390 = bitcast %struct.AVLNode_st* %29 to i8*
  store i8* %R390, i8** %4
  br label %L129

L128:                                             ; preds = %L126
  store i8* null, i8** %4
  br label %L129

L129:                                             ; preds = %L128, %L127
  %30 = load i8*, i8** %4
  ret i8* %30
}

define i32 @AVLTree_Height(%struct.avltree* %ARG1) {
L130:
  %0 = ptrtoint %struct.avltree* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to i8**
  %load_target = load i8*, i8** %2
  %R394 = bitcast i8* %load_target to %struct.AVLNode_st*
  %R395 = call i32 @AVL_Height(%struct.AVLNode_st* %R394)
  ret i32 %R395
}

define void @AVLTree_BackwardApply(%struct.AVLNode_st* %ARG1, void (i8*)* %ARG2) {
L131:
  %cond = icmp ne %struct.AVLNode_st* %ARG1, null
  br i1 %cond, label %L132, label %L133

L132:                                             ; preds = %L131
  %0 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %1 = add i64 %0, 16
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %load_target, void (i8*)* %ARG2)
  %3 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %R403 = add i64 %3, 32
  %4 = inttoptr i64 %R403 to %struct.AVLNode_st*
  %R404 = bitcast %struct.AVLNode_st* %4 to i8*
  %5 = bitcast void (i8*)* %ARG2 to i8*
  %6 = bitcast i8* %5 to void (i8*)*
  call void %6(i8* %R404)
  %7 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %8 = add i64 %7, 8
  %9 = inttoptr i64 %8 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %9
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %load_target1, void (i8*)* %ARG2)
  br label %L133

L133:                                             ; preds = %L132, %L131
  ret void
}

define void @AVLTree_Backeach(%struct.avltree* %ARG1, void (i8*)* %ARG2) {
L134:
  %0 = ptrtoint %struct.avltree* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to i8**
  %load_target = load i8*, i8** %2
  %R411 = bitcast i8* %load_target to %struct.AVLNode_st*
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %R411, void (i8*)* %ARG2)
  ret void
}

define void @AVLTree_ForwardApply(%struct.AVLNode_st* %ARG1, void (i8*)* %ARG2) {
L135:
  %cond = icmp ne %struct.AVLNode_st* %ARG1, null
  br i1 %cond, label %L136, label %L137

L136:                                             ; preds = %L135
  %0 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  %load_target = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %load_target, void (i8*)* %ARG2)
  %3 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %R419 = add i64 %3, 32
  %4 = inttoptr i64 %R419 to %struct.AVLNode_st*
  %R420 = bitcast %struct.AVLNode_st* %4 to i8*
  %5 = bitcast void (i8*)* %ARG2 to i8*
  %6 = bitcast i8* %5 to void (i8*)*
  call void %6(i8* %R420)
  %7 = ptrtoint %struct.AVLNode_st* %ARG1 to i64
  %8 = add i64 %7, 16
  %9 = inttoptr i64 %8 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %9
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %load_target1, void (i8*)* %ARG2)
  br label %L137

L137:                                             ; preds = %L136, %L135
  ret void
}

define void @AVLTree_Foreach(%struct.avltree* %ARG1, void (i8*)* %ARG2) {
L138:
  %0 = ptrtoint %struct.avltree* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to i8**
  %load_target = load i8*, i8** %2
  %R427 = bitcast i8* %load_target to %struct.AVLNode_st*
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %R427, void (i8*)* %ARG2)
  ret void
}

define %struct.AVLNode_st* @AVL_new(%struct.avltree* %ARG1, i8* %ARG2) {
L139:
  %0 = ptrtoint %struct.avltree* %ARG1 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to %struct.avl_vtbl**
  %load_target = load %struct.avl_vtbl*, %struct.avl_vtbl** %2
  %3 = ptrtoint %struct.avltree* %ARG1 to i64
  %4 = add i64 %3, 24
  %5 = inttoptr i64 %4 to %struct.allocator_st**
  %load_target1 = load %struct.allocator_st*, %struct.allocator_st** %5
  %R433 = call i8* @alloc_node(%struct.allocator_st* %load_target1)
  %R434 = bitcast i8* %R433 to %struct.AVLNode_st*
  %cond = icmp ne %struct.AVLNode_st* %R434, null
  br i1 %cond, label %L141, label %L140

L140:                                             ; preds = %L139
  call void @exit(i32 -1)
  br label %L141

L141:                                             ; preds = %L140, %L139
  %6 = ptrtoint %struct.AVLNode_st* %R434 to i64
  %7 = add i64 %6, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %8
  %9 = ptrtoint %struct.AVLNode_st* %R434 to i64
  %10 = add i64 %9, 16
  %11 = inttoptr i64 %10 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %11
  %12 = ptrtoint %struct.AVLNode_st* %R434 to i64
  %13 = add i64 %12, 8
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %14
  %15 = ptrtoint %struct.AVLNode_st* %R434 to i64
  %16 = add i64 %15, 24
  %17 = inttoptr i64 %16 to i32*
  store i32 0, i32* %17
  %18 = ptrtoint %struct.avl_vtbl* %load_target to i64
  %19 = add i64 %18, 8
  %20 = inttoptr i64 %19 to void (i8*, i8*)**
  %load_target2 = load void (i8*, i8*)*, void (i8*, i8*)** %20
  %cond3 = icmp ne void (i8*, i8*)* %load_target2, null
  br i1 %cond3, label %L142, label %L143

L142:                                             ; preds = %L141
  %21 = ptrtoint %struct.AVLNode_st* %R434 to i64
  %R445 = add i64 %21, 32
  %22 = inttoptr i64 %R445 to %struct.AVLNode_st*
  %R446 = bitcast %struct.AVLNode_st* %22 to i8*
  %23 = bitcast void (i8*, i8*)* %load_target2 to i8*
  %24 = bitcast i8* %23 to void (i8*, i8*)*
  call void %24(i8* %R446, i8* %ARG2)
  br label %L143

L143:                                             ; preds = %L142, %L141
  ret %struct.AVLNode_st* %R434
}

define i8* @AVLTree_Insert(%struct.avltree* %ARG1, i8* %ARG2) {
L144:
  %height_changed_000001B6A045F7C8 = alloca i32
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca %struct.AVLNode_st*
  %2 = alloca %struct.AVLNode_st*
  %3 = alloca %struct.AVLNode_st*
  %4 = alloca %struct.AVLNode_st*
  %5 = alloca %struct.AVLNode_st*
  %6 = alloca %struct.AVLNode_st*
  %7 = alloca %struct.AVLNode_st*
  %8 = alloca i8*
  %9 = ptrtoint %struct.avltree* %ARG1 to i64
  %10 = add i64 %9, 8
  %11 = inttoptr i64 %10 to i8**
  %load_target = load i8*, i8** %11
  %R454 = bitcast i8* %load_target to %struct.AVLNode_st*
  %12 = ptrtoint %struct.avltree* %ARG1 to i64
  %13 = add i64 %12, 0
  %14 = inttoptr i64 %13 to %struct.avl_vtbl**
  %load_target1 = load %struct.avl_vtbl*, %struct.avl_vtbl** %14
  %cond = icmp ne %struct.AVLNode_st* %R454, null
  br i1 %cond, label %L146, label %L145

L145:                                             ; preds = %L144
  %R461 = call %struct.AVLNode_st* @AVL_new(%struct.avltree* %ARG1, i8* %ARG2)
  store %struct.AVLNode_st* %R461, %struct.AVLNode_st** %6
  store %struct.AVLNode_st* %R461, %struct.AVLNode_st** %7
  br label %L164

L146:                                             ; preds = %L144
  %15 = ptrtoint i32* %height_changed_000001B6A045F7C8 to i64
  %16 = add i64 %15, 0
  %17 = inttoptr i64 %16 to i32*
  store i32 0, i32* %17
  store %struct.AVLNode_st* %R454, %struct.AVLNode_st** %6
  store %struct.AVLNode_st* %R454, %struct.AVLNode_st** %0
  br label %L147

L147:                                             ; preds = %L152, %L146
  %18 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %19 = ptrtoint %struct.AVLNode_st* %18 to i64
  %R466 = add i64 %19, 32
  %20 = inttoptr i64 %R466 to %struct.AVLNode_st*
  %R467 = bitcast %struct.AVLNode_st* %20 to i8*
  %21 = ptrtoint %struct.avl_vtbl* %load_target1 to i64
  %22 = add i64 %21, 0
  %23 = inttoptr i64 %22 to i32 (i8*, i8*)**
  %load_target2 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %23
  %R470 = bitcast i32 (i8*, i8*)* %load_target2 to i8*
  %R4703 = bitcast i8* %R470 to i32 (i8*, i8*)*
  %R4704 = call i32 %R4703(i8* %ARG2, i8* %R467)
  %R472 = icmp slt i32 %R4704, 0
  %R4725 = zext i1 %R472 to i32
  %cond6 = icmp ne i32 %R4725, 0
  br i1 %cond6, label %L148, label %L149

L148:                                             ; preds = %L147
  %24 = ptrtoint %struct.AVLNode_st* %18 to i64
  %25 = add i64 %24, 8
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %load_target7 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  store %struct.AVLNode_st* %load_target7, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %load_target7, %struct.AVLNode_st** %0
  br label %L152

L149:                                             ; preds = %L147
  %R476 = icmp sgt i32 %R4704, 0
  %R4768 = zext i1 %R476 to i32
  %cond9 = icmp ne i32 %R4768, 0
  br i1 %cond9, label %L150, label %L151

L150:                                             ; preds = %L149
  %27 = ptrtoint %struct.AVLNode_st* %18 to i64
  %28 = add i64 %27, 16
  %29 = inttoptr i64 %28 to %struct.AVLNode_st**
  %load_target10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %29
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %0
  br label %L152

L151:                                             ; preds = %L149
  store i8* %R467, i8** %8
  br label %L165

L152:                                             ; preds = %L150, %L148
  %30 = load %struct.AVLNode_st*, %struct.AVLNode_st** %1
  %cond11 = icmp ne %struct.AVLNode_st* %30, null
  br i1 %cond11, label %L147, label %L153

L153:                                             ; preds = %L152
  %R487 = call %struct.AVLNode_st* @AVL_new(%struct.avltree* %ARG1, i8* %ARG2)
  %R491 = bitcast %struct.AVLNode_st* %20 to i8*
  %31 = ptrtoint %struct.avl_vtbl* %load_target1 to i64
  %32 = add i64 %31, 0
  %33 = inttoptr i64 %32 to i32 (i8*, i8*)**
  %load_target12 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %33
  %R494 = bitcast i32 (i8*, i8*)* %load_target12 to i8*
  %R49413 = bitcast i8* %R494 to i32 (i8*, i8*)*
  %R49414 = call i32 %R49413(i8* %ARG2, i8* %R491)
  %R495 = icmp slt i32 %R49414, 0
  %R49515 = zext i1 %R495 to i32
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %7
  %cond16 = icmp ne i32 %R49515, 0
  br i1 %cond16, label %L154, label %L155

L154:                                             ; preds = %L153
  call void @AVL_SetLeft(%struct.AVLNode_st* %18, %struct.AVLNode_st* %R487)
  store %struct.AVLNode_st* %18, %struct.AVLNode_st** %2
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %3
  br label %L156

L155:                                             ; preds = %L153
  call void @AVL_SetRight(%struct.AVLNode_st* %18, %struct.AVLNode_st* %R487)
  store %struct.AVLNode_st* %18, %struct.AVLNode_st** %2
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %3
  br label %L156

L156:                                             ; preds = %L155, %L154
  %34 = ptrtoint i32* %height_changed_000001B6A045F7C8 to i64
  %35 = add i64 %34, 0
  %36 = inttoptr i64 %35 to i32*
  store i32 1, i32* %36
  br label %L157

L157:                                             ; preds = %L161, %L156
  %37 = load %struct.AVLNode_st*, %struct.AVLNode_st** %2
  %38 = ptrtoint %struct.AVLNode_st* %37 to i64
  %R501 = icmp ne i64 %38, 0
  %R50117 = zext i1 %R501 to i32
  %39 = ptrtoint i32* %height_changed_000001B6A045F7C8 to i64
  %40 = add i64 %39, 0
  %41 = inttoptr i64 %40 to i32*
  %load_target18 = load i32, i32* %41
  %42 = icmp ne i32 %R50117, 0
  %43 = icmp ne i32 %load_target18, 0
  %R503 = and i1 %42, %43
  %R50319 = zext i1 %R503 to i32
  %cond20 = icmp ne i32 %R50319, 0
  br i1 %cond20, label %L158, label %L162

L158:                                             ; preds = %L157
  %44 = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %45 = ptrtoint %struct.AVLNode_st* %37 to i64
  %46 = add i64 %45, 8
  %47 = inttoptr i64 %46 to %struct.AVLNode_st**
  %load_target21 = load %struct.AVLNode_st*, %struct.AVLNode_st** %47
  %48 = ptrtoint %struct.AVLNode_st* %44 to i64
  %49 = ptrtoint %struct.AVLNode_st* %load_target21 to i64
  %R507 = icmp eq i64 %48, %49
  %R50722 = zext i1 %R507 to i32
  %cond23 = icmp ne i32 %R50722, 0
  br i1 %cond23, label %L159, label %L160

L159:                                             ; preds = %L158
  %R510 = call %struct.AVLNode_st* @AVL_RebalanceHeavierLeft(%struct.AVLNode_st* %37, i32* %height_changed_000001B6A045F7C8)
  store %struct.AVLNode_st* %R510, %struct.AVLNode_st** %4
  br label %L161

L160:                                             ; preds = %L158
  %R513 = call %struct.AVLNode_st* @AVL_RebalanceHeavierRight(%struct.AVLNode_st* %37, i32* %height_changed_000001B6A045F7C8)
  store %struct.AVLNode_st* %R513, %struct.AVLNode_st** %4
  br label %L161

L161:                                             ; preds = %L160, %L159
  %50 = load %struct.AVLNode_st*, %struct.AVLNode_st** %4
  %51 = ptrtoint %struct.AVLNode_st* %50 to i64
  %52 = add i64 %51, 0
  %53 = inttoptr i64 %52 to %struct.AVLNode_st**
  %load_target24 = load %struct.AVLNode_st*, %struct.AVLNode_st** %53
  store %struct.AVLNode_st* %load_target24, %struct.AVLNode_st** %2
  store %struct.AVLNode_st* %50, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %50, %struct.AVLNode_st** %3
  br label %L157

L162:                                             ; preds = %L157
  %cond25 = icmp ne %struct.AVLNode_st* %37, null
  br i1 %cond25, label %L164, label %L163

L163:                                             ; preds = %L162
  %54 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %54, %struct.AVLNode_st** %6
  br label %L164

L164:                                             ; preds = %L163, %L162, %L145
  %55 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %R521 = bitcast %struct.AVLNode_st* %55 to i8*
  %56 = ptrtoint %struct.avltree* %ARG1 to i64
  %57 = add i64 %56, 8
  %58 = inttoptr i64 %57 to i8**
  store i8* %R521, i8** %58
  %59 = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %60 = ptrtoint %struct.AVLNode_st* %59 to i64
  %R524 = add i64 %60, 32
  %61 = inttoptr i64 %R524 to %struct.AVLNode_st*
  %R525 = bitcast %struct.AVLNode_st* %61 to i8*
  store i8* %R525, i8** %8
  br label %L165

L165:                                             ; preds = %L164, %L151
  %62 = load i8*, i8** %8
  ret i8* %62
}

define i32 @AVLTree_DeleteObject(%struct.avltree* %ARG1, i8* %ARG2) {
L166:
  %height_changed_000001B6A0469AA8 = alloca i32
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca %struct.AVLNode_st*
  %2 = alloca i32
  %3 = alloca %struct.AVLNode_st*
  %4 = alloca %struct.AVLNode_st*
  %5 = alloca %struct.AVLNode_st*
  %6 = alloca %struct.AVLNode_st*
  %7 = alloca i32
  %R530 = bitcast i8* %ARG2 to %struct.AVLNode_st*
  %8 = ptrtoint i32* %height_changed_000001B6A0469AA8 to i64
  %9 = add i64 %8, 0
  %10 = inttoptr i64 %9 to i32*
  store i32 0, i32* %10
  %11 = ptrtoint %struct.avltree* %ARG1 to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to %struct.avl_vtbl**
  %load_target = load %struct.avl_vtbl*, %struct.avl_vtbl** %13
  store i32 0, i32* %2
  %cond = icmp ne %struct.AVLNode_st* %R530, null
  br i1 %cond, label %L168, label %L167

L167:                                             ; preds = %L166
  store i32 -1, i32* %7
  br label %L203

L168:                                             ; preds = %L166
  %14 = ptrtoint %struct.AVLNode_st* %R530 to i64
  %R537 = add i64 %14, -32
  %15 = inttoptr i64 %R537 to %struct.AVLNode_st*
  %16 = ptrtoint %struct.AVLNode_st* %R530 to i64
  %17 = add i64 %16, -24
  %18 = inttoptr i64 %17 to %struct.AVLNode_st**
  %load_target1 = load %struct.AVLNode_st*, %struct.AVLNode_st** %18
  %cond2 = icmp ne %struct.AVLNode_st* %load_target1, null
  br i1 %cond2, label %L169, label %L181

L169:                                             ; preds = %L168
  store %struct.AVLNode_st* %load_target1, %struct.AVLNode_st** %0
  br label %L170

L170:                                             ; preds = %L171, %L169
  %19 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %20 = ptrtoint %struct.AVLNode_st* %19 to i64
  %21 = add i64 %20, 16
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %load_target3 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %cond4 = icmp ne %struct.AVLNode_st* %load_target3, null
  br i1 %cond4, label %L171, label %L172

L171:                                             ; preds = %L170
  store %struct.AVLNode_st* %load_target3, %struct.AVLNode_st** %0
  br label %L170

L172:                                             ; preds = %L170
  %23 = ptrtoint %struct.avl_vtbl* %load_target to i64
  %24 = add i64 %23, 16
  %25 = inttoptr i64 %24 to void (i8*, i8*)**
  %load_target5 = load void (i8*, i8*)*, void (i8*, i8*)** %25
  %cond6 = icmp ne void (i8*, i8*)* %load_target5, null
  br i1 %cond6, label %L173, label %L174

L173:                                             ; preds = %L172
  %26 = ptrtoint %struct.AVLNode_st* %15 to i64
  %R553 = add i64 %26, 32
  %27 = inttoptr i64 %R553 to %struct.AVLNode_st*
  %R554 = bitcast %struct.AVLNode_st* %27 to i8*
  %28 = ptrtoint %struct.AVLNode_st* %19 to i64
  %R556 = add i64 %28, 32
  %29 = inttoptr i64 %R556 to %struct.AVLNode_st*
  %R557 = bitcast %struct.AVLNode_st* %29 to i8*
  %30 = bitcast void (i8*, i8*)* %load_target5 to i8*
  %31 = bitcast i8* %30 to void (i8*, i8*)*
  call void %31(i8* %R554, i8* %R557)
  br label %L177

L174:                                             ; preds = %L172
  %32 = ptrtoint %struct.avl_vtbl* %load_target to i64
  %33 = add i64 %32, 24
  %34 = inttoptr i64 %33 to void (i8*)**
  %load_target7 = load void (i8*)*, void (i8*)** %34
  %cond8 = icmp ne void (i8*)* %load_target7, null
  br i1 %cond8, label %L175, label %L176

L175:                                             ; preds = %L174
  %35 = ptrtoint %struct.AVLNode_st* %15 to i64
  %R564 = add i64 %35, 32
  %36 = inttoptr i64 %R564 to %struct.AVLNode_st*
  %R565 = bitcast %struct.AVLNode_st* %36 to i8*
  %37 = bitcast void (i8*)* %load_target7 to i8*
  %38 = bitcast i8* %37 to void (i8*)*
  call void %38(i8* %R565)
  br label %L176

L176:                                             ; preds = %L175, %L174
  %39 = ptrtoint %struct.AVLNode_st* %15 to i64
  %R569 = add i64 %39, 32
  %40 = inttoptr i64 %R569 to %struct.AVLNode_st*
  %R570 = bitcast %struct.AVLNode_st* %40 to i8*
  %41 = ptrtoint %struct.AVLNode_st* %19 to i64
  %R572 = add i64 %41, 32
  %42 = inttoptr i64 %R572 to %struct.AVLNode_st*
  %R573 = bitcast %struct.AVLNode_st* %42 to i8*
  %43 = ptrtoint %struct.avltree* %ARG1 to i64
  %44 = add i64 %43, 20
  %45 = inttoptr i64 %44 to i32*
  %load_target9 = load i32, i32* %45
  %R576 = call i8* @memcpy(i8* %R570, i8* %R573, i32 %load_target9)
  br label %L177

L177:                                             ; preds = %L176, %L173
  %46 = ptrtoint %struct.AVLNode_st* %19 to i64
  %47 = add i64 %46, 0
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %load_target10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %49 = ptrtoint %struct.AVLNode_st* %load_target10 to i64
  %50 = add i64 %49, 8
  %51 = inttoptr i64 %50 to %struct.AVLNode_st**
  %load_target11 = load %struct.AVLNode_st*, %struct.AVLNode_st** %51
  %52 = ptrtoint %struct.AVLNode_st* %19 to i64
  %53 = ptrtoint %struct.AVLNode_st* %load_target11 to i64
  %R582 = icmp eq i64 %52, %53
  %R58212 = zext i1 %R582 to i32
  %cond13 = icmp ne i32 %R58212, 0
  br i1 %cond13, label %L178, label %L179

L178:                                             ; preds = %L177
  %54 = ptrtoint %struct.AVLNode_st* %19 to i64
  %55 = add i64 %54, 8
  %56 = inttoptr i64 %55 to %struct.AVLNode_st**
  %load_target14 = load %struct.AVLNode_st*, %struct.AVLNode_st** %56
  call void @AVL_SetLeft(%struct.AVLNode_st* %load_target10, %struct.AVLNode_st* %load_target14)
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %1
  store i32 1, i32* %2
  br label %L180

L179:                                             ; preds = %L177
  %57 = ptrtoint %struct.AVLNode_st* %19 to i64
  %58 = add i64 %57, 8
  %59 = inttoptr i64 %58 to %struct.AVLNode_st**
  %load_target15 = load %struct.AVLNode_st*, %struct.AVLNode_st** %59
  call void @AVL_SetRight(%struct.AVLNode_st* %load_target10, %struct.AVLNode_st* %load_target15)
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %1
  br label %L180

L180:                                             ; preds = %L179, %L178
  store %struct.AVLNode_st* %19, %struct.AVLNode_st** %6
  store %struct.AVLNode_st* %19, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %19, %struct.AVLNode_st** %3
  br label %L193

L181:                                             ; preds = %L168
  %60 = ptrtoint %struct.AVLNode_st* %R530 to i64
  %61 = add i64 %60, -32
  %62 = inttoptr i64 %61 to %struct.AVLNode_st**
  %load_target16 = load %struct.AVLNode_st*, %struct.AVLNode_st** %62
  %cond17 = icmp ne %struct.AVLNode_st* %load_target16, null
  br i1 %cond17, label %L182, label %L188

L182:                                             ; preds = %L181
  %63 = ptrtoint %struct.AVLNode_st* %load_target16 to i64
  %64 = add i64 %63, 8
  %65 = inttoptr i64 %64 to %struct.AVLNode_st**
  %load_target18 = load %struct.AVLNode_st*, %struct.AVLNode_st** %65
  %66 = ptrtoint %struct.AVLNode_st* %15 to i64
  %67 = ptrtoint %struct.AVLNode_st* %load_target18 to i64
  %R597 = icmp eq i64 %66, %67
  %R59719 = zext i1 %R597 to i32
  %cond20 = icmp ne i32 %R59719, 0
  br i1 %cond20, label %L183, label %L184

L183:                                             ; preds = %L182
  %68 = ptrtoint %struct.AVLNode_st* %R530 to i64
  %69 = add i64 %68, -16
  %70 = inttoptr i64 %69 to %struct.AVLNode_st**
  %load_target21 = load %struct.AVLNode_st*, %struct.AVLNode_st** %70
  call void @AVL_SetLeft(%struct.AVLNode_st* %load_target16, %struct.AVLNode_st* %load_target21)
  store %struct.AVLNode_st* %load_target16, %struct.AVLNode_st** %1
  store i32 1, i32* %2
  br label %L185

L184:                                             ; preds = %L182
  %71 = ptrtoint %struct.AVLNode_st* %R530 to i64
  %72 = add i64 %71, -16
  %73 = inttoptr i64 %72 to %struct.AVLNode_st**
  %load_target22 = load %struct.AVLNode_st*, %struct.AVLNode_st** %73
  call void @AVL_SetRight(%struct.AVLNode_st* %load_target16, %struct.AVLNode_st* %load_target22)
  store %struct.AVLNode_st* %load_target16, %struct.AVLNode_st** %1
  br label %L185

L185:                                             ; preds = %L184, %L183
  %74 = ptrtoint %struct.avl_vtbl* %load_target to i64
  %75 = add i64 %74, 24
  %76 = inttoptr i64 %75 to void (i8*)**
  %load_target23 = load void (i8*)*, void (i8*)** %76
  %cond24 = icmp ne void (i8*)* %load_target23, null
  br i1 %cond24, label %L186, label %L187

L186:                                             ; preds = %L185
  %77 = ptrtoint %struct.AVLNode_st* %15 to i64
  %R608 = add i64 %77, 32
  %78 = inttoptr i64 %R608 to %struct.AVLNode_st*
  %R609 = bitcast %struct.AVLNode_st* %78 to i8*
  %79 = bitcast void (i8*)* %load_target23 to i8*
  %80 = bitcast i8* %79 to void (i8*)*
  call void %80(i8* %R609)
  br label %L187

L187:                                             ; preds = %L186, %L185
  store %struct.AVLNode_st* %15, %struct.AVLNode_st** %6
  store %struct.AVLNode_st* %15, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %15, %struct.AVLNode_st** %3
  br label %L193

L188:                                             ; preds = %L181
  %81 = ptrtoint %struct.AVLNode_st* %R530 to i64
  %82 = add i64 %81, -16
  %83 = inttoptr i64 %82 to %struct.AVLNode_st**
  %load_target25 = load %struct.AVLNode_st*, %struct.AVLNode_st** %83
  %cond26 = icmp ne %struct.AVLNode_st* %load_target25, null
  br i1 %cond26, label %L189, label %L190

L189:                                             ; preds = %L188
  %84 = ptrtoint %struct.AVLNode_st* %load_target25 to i64
  %85 = add i64 %84, 0
  %86 = inttoptr i64 %85 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %86
  br label %L190

L190:                                             ; preds = %L189, %L188
  %87 = ptrtoint %struct.avl_vtbl* %load_target to i64
  %88 = add i64 %87, 24
  %89 = inttoptr i64 %88 to void (i8*)**
  %load_target27 = load void (i8*)*, void (i8*)** %89
  %cond28 = icmp ne void (i8*)* %load_target27, null
  br i1 %cond28, label %L191, label %L192

L191:                                             ; preds = %L190
  %90 = ptrtoint %struct.AVLNode_st* %15 to i64
  %R622 = add i64 %90, 32
  %91 = inttoptr i64 %R622 to %struct.AVLNode_st*
  %R623 = bitcast %struct.AVLNode_st* %91 to i8*
  %92 = bitcast void (i8*)* %load_target27 to i8*
  %93 = bitcast i8* %92 to void (i8*)*
  call void %93(i8* %R623)
  br label %L192

L192:                                             ; preds = %L191, %L190
  %94 = ptrtoint %struct.avltree* %ARG1 to i64
  %95 = add i64 %94, 24
  %96 = inttoptr i64 %95 to %struct.allocator_st**
  %load_target29 = load %struct.allocator_st*, %struct.allocator_st** %96
  %R629 = bitcast %struct.AVLNode_st* %15 to i8*
  call void @dealloc_node(%struct.allocator_st* %load_target29, i8* %R629)
  %R631 = bitcast %struct.AVLNode_st* %load_target25 to i8*
  %97 = ptrtoint %struct.avltree* %ARG1 to i64
  %98 = add i64 %97, 8
  %99 = inttoptr i64 %98 to i8**
  store i8* %R631, i8** %99
  store i32 0, i32* %7
  br label %L203

L193:                                             ; preds = %L187, %L180
  %100 = ptrtoint i32* %height_changed_000001B6A0469AA8 to i64
  %101 = add i64 %100, 0
  %102 = inttoptr i64 %101 to i32*
  store i32 1, i32* %102
  br label %L194

L194:                                             ; preds = %L199, %L193
  %103 = load %struct.AVLNode_st*, %struct.AVLNode_st** %1
  %104 = ptrtoint %struct.AVLNode_st* %103 to i64
  %R634 = icmp ne i64 %104, 0
  %R63430 = zext i1 %R634 to i32
  %105 = ptrtoint i32* %height_changed_000001B6A0469AA8 to i64
  %106 = add i64 %105, 0
  %107 = inttoptr i64 %106 to i32*
  %load_target31 = load i32, i32* %107
  %108 = icmp ne i32 %R63430, 0
  %109 = icmp ne i32 %load_target31, 0
  %R636 = and i1 %108, %109
  %R63632 = zext i1 %R636 to i32
  %cond33 = icmp ne i32 %R63632, 0
  br i1 %cond33, label %L195, label %L200

L195:                                             ; preds = %L194
  %110 = load i32, i32* %2
  %cond34 = icmp ne i32 %110, 0
  br i1 %cond34, label %L197, label %L196

L196:                                             ; preds = %L195
  %111 = load %struct.AVLNode_st*, %struct.AVLNode_st** %3
  %112 = ptrtoint %struct.AVLNode_st* %103 to i64
  %113 = add i64 %112, 8
  %114 = inttoptr i64 %113 to %struct.AVLNode_st**
  %load_target35 = load %struct.AVLNode_st*, %struct.AVLNode_st** %114
  %115 = ptrtoint %struct.AVLNode_st* %111 to i64
  %116 = ptrtoint %struct.AVLNode_st* %load_target35 to i64
  %R641 = icmp eq i64 %115, %116
  %R64136 = zext i1 %R641 to i32
  %cond37 = icmp ne i32 %R64136, 0
  br i1 %cond37, label %L197, label %L198

L197:                                             ; preds = %L196, %L195
  %R644 = call %struct.AVLNode_st* @AVL_RebalanceShorterLeft(%struct.AVLNode_st* %103, i32* %height_changed_000001B6A0469AA8)
  store %struct.AVLNode_st* %R644, %struct.AVLNode_st** %4
  store i32 0, i32* %2
  br label %L199

L198:                                             ; preds = %L196
  %R647 = call %struct.AVLNode_st* @AVL_RebalanceShorterRight(%struct.AVLNode_st* %103, i32* %height_changed_000001B6A0469AA8)
  store %struct.AVLNode_st* %R647, %struct.AVLNode_st** %4
  br label %L199

L199:                                             ; preds = %L198, %L197
  %117 = load %struct.AVLNode_st*, %struct.AVLNode_st** %4
  %118 = ptrtoint %struct.AVLNode_st* %117 to i64
  %119 = add i64 %118, 0
  %120 = inttoptr i64 %119 to %struct.AVLNode_st**
  %load_target38 = load %struct.AVLNode_st*, %struct.AVLNode_st** %120
  store %struct.AVLNode_st* %load_target38, %struct.AVLNode_st** %1
  store %struct.AVLNode_st* %117, %struct.AVLNode_st** %5
  store %struct.AVLNode_st* %117, %struct.AVLNode_st** %3
  br label %L194

L200:                                             ; preds = %L194
  %cond39 = icmp ne %struct.AVLNode_st* %103, null
  br i1 %cond39, label %L202, label %L201

L201:                                             ; preds = %L200
  %121 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %R654 = bitcast %struct.AVLNode_st* %121 to i8*
  %122 = ptrtoint %struct.avltree* %ARG1 to i64
  %123 = add i64 %122, 8
  %124 = inttoptr i64 %123 to i8**
  store i8* %R654, i8** %124
  br label %L202

L202:                                             ; preds = %L201, %L200
  %125 = ptrtoint %struct.avltree* %ARG1 to i64
  %126 = add i64 %125, 24
  %127 = inttoptr i64 %126 to %struct.allocator_st**
  %load_target40 = load %struct.allocator_st*, %struct.allocator_st** %127
  %128 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %R659 = bitcast %struct.AVLNode_st* %128 to i8*
  call void @dealloc_node(%struct.allocator_st* %load_target40, i8* %R659)
  store i32 0, i32* %7
  br label %L203

L203:                                             ; preds = %L202, %L192, %L167
  %129 = load i32, i32* %7
  ret i32 %129
}

define i32 @AVLTree_Delete(%struct.avltree* %ARG1, i8* %ARG2) {
L204:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca i32
  %2 = ptrtoint %struct.avltree* %ARG1 to i64
  %3 = add i64 %2, 8
  %4 = inttoptr i64 %3 to i8**
  %load_target = load i8*, i8** %4
  %R662 = bitcast i8* %load_target to %struct.AVLNode_st*
  %5 = ptrtoint %struct.avltree* %ARG1 to i64
  %6 = add i64 %5, 0
  %7 = inttoptr i64 %6 to %struct.avl_vtbl**
  %load_target1 = load %struct.avl_vtbl*, %struct.avl_vtbl** %7
  %cond = icmp ne %struct.AVLNode_st* %R662, null
  br i1 %cond, label %L206, label %L205

L205:                                             ; preds = %L204
  store i32 -1, i32* %1
  br label %L215

L206:                                             ; preds = %L204
  store %struct.AVLNode_st* %R662, %struct.AVLNode_st** %0
  br label %L207

L207:                                             ; preds = %L211, %L209, %L206
  %8 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %cond2 = icmp ne %struct.AVLNode_st* %8, null
  br i1 %cond2, label %L208, label %L213

L208:                                             ; preds = %L207
  %9 = ptrtoint %struct.AVLNode_st* %8 to i64
  %R673 = add i64 %9, 32
  %10 = inttoptr i64 %R673 to %struct.AVLNode_st*
  %R674 = bitcast %struct.AVLNode_st* %10 to i8*
  %11 = ptrtoint %struct.avl_vtbl* %load_target1 to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to i32 (i8*, i8*)**
  %load_target3 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %13
  %R677 = bitcast i32 (i8*, i8*)* %load_target3 to i8*
  %R6774 = bitcast i8* %R677 to i32 (i8*, i8*)*
  %R6775 = call i32 %R6774(i8* %ARG2, i8* %R674)
  %R679 = icmp slt i32 %R6775, 0
  %R6796 = zext i1 %R679 to i32
  %cond7 = icmp ne i32 %R6796, 0
  br i1 %cond7, label %L209, label %L210

L209:                                             ; preds = %L208
  %14 = ptrtoint %struct.AVLNode_st* %8 to i64
  %15 = add i64 %14, 8
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %load_target8 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  store %struct.AVLNode_st* %load_target8, %struct.AVLNode_st** %0
  br label %L207

L210:                                             ; preds = %L208
  %R683 = icmp sgt i32 %R6775, 0
  %R6839 = zext i1 %R683 to i32
  %cond10 = icmp ne i32 %R6839, 0
  br i1 %cond10, label %L211, label %L212

L211:                                             ; preds = %L210
  %17 = ptrtoint %struct.AVLNode_st* %8 to i64
  %18 = add i64 %17, 16
  %19 = inttoptr i64 %18 to %struct.AVLNode_st**
  %load_target11 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  store %struct.AVLNode_st* %load_target11, %struct.AVLNode_st** %0
  br label %L207

L212:                                             ; preds = %L210
  %cond12 = icmp ne %struct.AVLNode_st* %8, null
  br i1 %cond12, label %L214, label %L213

L213:                                             ; preds = %L212, %L207
  store i32 -1, i32* %1
  br label %L215

L214:                                             ; preds = %L212
  %R692 = call i32 @AVLTree_DeleteObject(%struct.avltree* %ARG1, i8* %R674)
  store i32 0, i32* %1
  br label %L215

L215:                                             ; preds = %L214, %L213, %L205
  %20 = load i32, i32* %1
  ret i32 %20
}

define i8* @AVLTree_Search(%struct.avltree* %ARG1, i8* %ARG2) {
L216:
  %0 = alloca %struct.AVLNode_st*
  %1 = alloca i8*
  %2 = ptrtoint %struct.avltree* %ARG1 to i64
  %3 = add i64 %2, 8
  %4 = inttoptr i64 %3 to i8**
  %load_target = load i8*, i8** %4
  %R695 = bitcast i8* %load_target to %struct.AVLNode_st*
  %5 = ptrtoint %struct.avltree* %ARG1 to i64
  %6 = add i64 %5, 0
  %7 = inttoptr i64 %6 to %struct.avl_vtbl**
  %load_target1 = load %struct.avl_vtbl*, %struct.avl_vtbl** %7
  %cond = icmp ne %struct.AVLNode_st* %R695, null
  br i1 %cond, label %L217, label %L224

L217:                                             ; preds = %L216
  store %struct.AVLNode_st* %R695, %struct.AVLNode_st** %0
  br label %L218

L218:                                             ; preds = %L223, %L222, %L217
  %8 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  %cond2 = icmp ne %struct.AVLNode_st* %8, null
  br i1 %cond2, label %L219, label %L224

L219:                                             ; preds = %L218
  %9 = ptrtoint %struct.AVLNode_st* %8 to i64
  %R703 = add i64 %9, 32
  %10 = inttoptr i64 %R703 to %struct.AVLNode_st*
  %R704 = bitcast %struct.AVLNode_st* %10 to i8*
  %11 = ptrtoint %struct.avl_vtbl* %load_target1 to i64
  %12 = add i64 %11, 0
  %13 = inttoptr i64 %12 to i32 (i8*, i8*)**
  %load_target3 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %13
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
  %14 = ptrtoint %struct.AVLNode_st* %8 to i64
  %15 = add i64 %14, 8
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %load_target9 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  store %struct.AVLNode_st* %load_target9, %struct.AVLNode_st** %0
  br label %L218

L223:                                             ; preds = %L221
  %17 = ptrtoint %struct.AVLNode_st* %8 to i64
  %18 = add i64 %17, 16
  %19 = inttoptr i64 %18 to %struct.AVLNode_st**
  %load_target10 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  store %struct.AVLNode_st* %load_target10, %struct.AVLNode_st** %0
  br label %L218

L224:                                             ; preds = %L218, %L216
  store i8* null, i8** %1
  br label %L225

L225:                                             ; preds = %L224, %L220
  %20 = load i8*, i8** %1
  ret i8* %20
}

define %struct.avltree* @AVLTree_New(%struct.avltree* %ARG1, %struct.avl_vtbl* %ARG2, i32 %ARG3, i32 %ARG4) {
L226:
  %0 = ptrtoint %struct.avltree* %ARG1 to i64
  %1 = add i64 %0, 8
  %2 = inttoptr i64 %1 to i8**
  store i8* null, i8** %2
  %3 = ptrtoint %struct.avltree* %ARG1 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %ARG2, %struct.avl_vtbl** %5
  %6 = ptrtoint %struct.avltree* %ARG1 to i64
  %7 = add i64 %6, 20
  %8 = inttoptr i64 %7 to i32*
  store i32 %ARG3, i32* %8
  %9 = ptrtoint %struct.avltree* %ARG1 to i64
  %10 = add i64 %9, 16
  %11 = inttoptr i64 %10 to i32*
  store i32 0, i32* %11
  %R727 = sext i32 %ARG3 to i64
  %R728 = add i64 %R727, 32
  %R729 = trunc i64 %R728 to i32
  %R731 = call %struct.allocator_st* @new_allocator(i32 %R729, i32 %ARG4)
  %12 = ptrtoint %struct.avltree* %ARG1 to i64
  %13 = add i64 %12, 24
  %14 = inttoptr i64 %13 to %struct.allocator_st**
  store %struct.allocator_st* %R731, %struct.allocator_st** %14
  ret %struct.avltree* %ARG1
}

define void @AVLTree_Destroy(%struct.avltree* %ARG1) {
L227:
  %0 = ptrtoint %struct.avltree* %ARG1 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to %struct.avl_vtbl**
  %load_target = load %struct.avl_vtbl*, %struct.avl_vtbl** %2
  %3 = ptrtoint %struct.avl_vtbl* %load_target to i64
  %4 = add i64 %3, 24
  %5 = inttoptr i64 %4 to void (i8*)**
  %load_target1 = load void (i8*)*, void (i8*)** %5
  %cond = icmp ne void (i8*)* %load_target1, null
  br i1 %cond, label %L228, label %L229

L228:                                             ; preds = %L227
  %6 = ptrtoint %struct.avltree* %ARG1 to i64
  %7 = add i64 %6, 8
  %8 = inttoptr i64 %7 to i8**
  %load_target2 = load i8*, i8** %8
  %R741 = bitcast i8* %load_target2 to %struct.AVLNode_st*
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %R741, void (i8*)* %load_target1)
  br label %L229

L229:                                             ; preds = %L228, %L227
  %9 = ptrtoint %struct.avltree* %ARG1 to i64
  %10 = add i64 %9, 24
  %11 = inttoptr i64 %10 to %struct.allocator_st**
  %load_target3 = load %struct.allocator_st*, %struct.allocator_st** %11
  call void @destroy_allocator(%struct.allocator_st* %load_target3)
  ret void
}

define internal i32 @comparekeys(i8* %ARG1, i8* %ARG2) {
L230:
  %R748 = bitcast i8* %ARG1 to i32*
  %R750 = bitcast i8* %ARG2 to %struct.record*
  %0 = ptrtoint i32* %R748 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  %load_target = load i32, i32* %2
  %3 = ptrtoint %struct.record* %R750 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i32*
  %load_target1 = load i32, i32* %5
  %R755 = sub i32 %load_target, %load_target1
  ret i32 %R755
}

define internal void @createobject(i8* %ARG1, i8* %ARG2) {
L231:
  %R758 = bitcast i8* %ARG2 to i32*
  %R760 = bitcast i8* %ARG1 to %struct.record*
  %0 = ptrtoint i32* %R758 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  %load_target = load i32, i32* %2
  %3 = ptrtoint %struct.record* %R760 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i32*
  store i32 %load_target, i32* %5
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
  %0 = ptrtoint %struct.record* %R767 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  %load_target = load i32, i32* %2
  %3 = ptrtoint %struct.record* %R765 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i32*
  store i32 %load_target, i32* %5
  ret void
}

define i32 @main() {
L234:
  %key_000001B6A04841E8 = alloca i32
  %tree_000001B6A0483CA8 = alloca %struct.avltree
  %vtable_000001B6A0483D88 = alloca %struct.avl_vtbl
  %testdata_000001B6A0483AE8 = alloca [20 x i32]
  %0 = alloca i32
  %1 = alloca %struct.record*
  store i32 0, i32* @once
  %2 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %3 = add i64 %2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 97, i32* %4
  %5 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %6 = add i64 %5, 4
  %7 = inttoptr i64 %6 to i32*
  store i32 103, i32* %7
  %8 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %9 = add i64 %8, 8
  %10 = inttoptr i64 %9 to i32*
  store i32 113, i32* %10
  %11 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %12 = add i64 %11, 12
  %13 = inttoptr i64 %12 to i32*
  store i32 119, i32* %13
  %14 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %15 = add i64 %14, 16
  %16 = inttoptr i64 %15 to i32*
  store i32 101, i32* %16
  %17 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %18 = add i64 %17, 20
  %19 = inttoptr i64 %18 to i32*
  store i32 102, i32* %19
  %20 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %21 = add i64 %20, 24
  %22 = inttoptr i64 %21 to i32*
  store i32 98, i32* %22
  %23 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %24 = add i64 %23, 28
  %25 = inttoptr i64 %24 to i32*
  store i32 120, i32* %25
  %26 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %27 = add i64 %26, 32
  %28 = inttoptr i64 %27 to i32*
  store i32 107, i32* %28
  %29 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %30 = add i64 %29, 36
  %31 = inttoptr i64 %30 to i32*
  store i32 108, i32* %31
  %32 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %33 = add i64 %32, 40
  %34 = inttoptr i64 %33 to i32*
  store i32 112, i32* %34
  %35 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %36 = add i64 %35, 44
  %37 = inttoptr i64 %36 to i32*
  store i32 109, i32* %37
  %38 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %39 = add i64 %38, 48
  %40 = inttoptr i64 %39 to i32*
  store i32 115, i32* %40
  %41 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %42 = add i64 %41, 52
  %43 = inttoptr i64 %42 to i32*
  store i32 121, i32* %43
  %44 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %45 = add i64 %44, 56
  %46 = inttoptr i64 %45 to i32*
  store i32 116, i32* %46
  %47 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %48 = add i64 %47, 60
  %49 = inttoptr i64 %48 to i32*
  store i32 117, i32* %49
  %50 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %51 = add i64 %50, 64
  %52 = inttoptr i64 %51 to i32*
  store i32 111, i32* %52
  %53 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %54 = add i64 %53, 68
  %55 = inttoptr i64 %54 to i32*
  store i32 114, i32* %55
  %56 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %57 = add i64 %56, 72
  %58 = inttoptr i64 %57 to i32*
  store i32 106, i32* %58
  %59 = ptrtoint [20 x i32]* %testdata_000001B6A0483AE8 to i64
  %60 = add i64 %59, 76
  %61 = inttoptr i64 %60 to i32*
  store i32 48, i32* %61
  %62 = ptrtoint %struct.avl_vtbl* %vtable_000001B6A0483D88 to i64
  %63 = add i64 %62, 0
  %64 = inttoptr i64 %63 to i32 (i8*, i8*)**
  store i32 (i8*, i8*)* @comparekeys, i32 (i8*, i8*)** %64
  %65 = ptrtoint %struct.avl_vtbl* %vtable_000001B6A0483D88 to i64
  %66 = add i64 %65, 8
  %67 = inttoptr i64 %66 to void (i8*, i8*)**
  store void (i8*, i8*)* @createobject, void (i8*, i8*)** %67
  %68 = ptrtoint %struct.avl_vtbl* %vtable_000001B6A0483D88 to i64
  %69 = add i64 %68, 24
  %70 = inttoptr i64 %69 to void (i8*)**
  store void (i8*)* @destroyobject, void (i8*)** %70
  %71 = ptrtoint %struct.avl_vtbl* %vtable_000001B6A0483D88 to i64
  %72 = add i64 %71, 16
  %73 = inttoptr i64 %72 to void (i8*, i8*)**
  store void (i8*, i8*)* @assignobject, void (i8*, i8*)** %73
  %R777 = call %struct.avltree* @AVLTree_New(%struct.avltree* %tree_000001B6A0483CA8, %struct.avl_vtbl* %vtable_000001B6A0483D88, i32 4, i32 1000)
  store i32 0, i32* %0
  br label %L235

L235:                                             ; preds = %L236, %L234
  %74 = load i32, i32* %0
  %R779 = icmp slt i32 %74, 20
  %R7791 = zext i1 %R779 to i32
  %cond = icmp ne i32 %R7791, 0
  br i1 %cond, label %L236, label %L237

L236:                                             ; preds = %L235
  %R780 = bitcast [20 x i32]* %testdata_000001B6A0483AE8 to i32*
  %R782 = sext i32 %74 to i64
  %R783 = mul i64 %R782, 4
  %75 = ptrtoint i32* %R780 to i64
  %R784 = add i64 %75, %R783
  %76 = inttoptr i64 %R784 to i32*
  %77 = ptrtoint i32* %76 to i64
  %78 = add i64 %77, 0
  %79 = inttoptr i64 %78 to i32*
  %load_target = load i32, i32* %79
  %80 = ptrtoint i32* %key_000001B6A04841E8 to i64
  %81 = add i64 %80, 0
  %82 = inttoptr i64 %81 to i32*
  store i32 %load_target, i32* %82
  %R788 = bitcast i32* %key_000001B6A04841E8 to i8*
  %R789 = call i8* @AVLTree_Insert(%struct.avltree* %tree_000001B6A0483CA8, i8* %R788)
  %R791 = add i32 %74, 1
  store i32 %R791, i32* %0
  br label %L235

L237:                                             ; preds = %L235
  %R793 = call i8* @AVLTree_FindFirst(%struct.avltree* %tree_000001B6A0483CA8)
  %R794 = bitcast i8* %R793 to %struct.record*
  store %struct.record* %R794, %struct.record** %1
  br label %L238

L238:                                             ; preds = %L239, %L237
  %83 = load %struct.record*, %struct.record** %1
  %cond2 = icmp ne %struct.record* %83, null
  br i1 %cond2, label %L239, label %L240

L239:                                             ; preds = %L238
  %84 = ptrtoint %struct.record* %83 to i64
  %85 = add i64 %84, 0
  %86 = inttoptr i64 %85 to i32*
  %load_target3 = load i32, i32* %86
  %R800 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %load_target3)
  %R803 = bitcast %struct.record* %83 to i8*
  %R804 = call i8* @AVLTree_FindNext(%struct.avltree* %tree_000001B6A0483CA8, i8* %R803)
  %R805 = bitcast i8* %R804 to %struct.record*
  store %struct.record* %R805, %struct.record** %1
  br label %L238

L240:                                             ; preds = %L238
  call void @AVLTree_Destroy(%struct.avltree* %tree_000001B6A0483CA8)
  ret i32 0
}
