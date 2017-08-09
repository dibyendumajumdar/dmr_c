; ModuleID = 'out.bc'
source_filename = "dmrC"

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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal i8* @memcpy(i8* %ARG1, i8* %ARG2, i32 %ARG3) {
L0:
  %src8_000001C4002FC5D8. = alloca i8*
  %dst8_000001C4002FC418. = alloca i8*
  %count_000001C4002FC258. = alloca i32
  %src_000001C4002FC098. = alloca i8*
  %dest_000001C4002FBED8. = alloca i8*
  %0 = alloca i8*
  %dest_000001C4002FBED8.1 = ptrtoint i8** %dest_000001C4002FBED8. to i64
  %1 = add i64 %dest_000001C4002FBED8.1, 0
  %2 = inttoptr i64 %1 to i8**
  store i8* %ARG1, i8** %2
  %src_000001C4002FC098.2 = ptrtoint i8** %src_000001C4002FC098. to i64
  %3 = add i64 %src_000001C4002FC098.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %count_000001C4002FC258.3 = ptrtoint i32* %count_000001C4002FC258. to i64
  %5 = add i64 %count_000001C4002FC258.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 %ARG3, i32* %6
  %dest_000001C4002FBED8.4 = ptrtoint i8** %dest_000001C4002FBED8. to i64
  %7 = add i64 %dest_000001C4002FBED8.4, 0
  %8 = inttoptr i64 %7 to i8**
  %R1 = load i8*, i8** %8
  %dst8_000001C4002FC418.5 = ptrtoint i8** %dst8_000001C4002FC418. to i64
  %9 = add i64 %dst8_000001C4002FC418.5, 0
  %10 = inttoptr i64 %9 to i8**
  store i8* %R1, i8** %10
  %src_000001C4002FC098.6 = ptrtoint i8** %src_000001C4002FC098. to i64
  %11 = add i64 %src_000001C4002FC098.6, 0
  %12 = inttoptr i64 %11 to i8**
  %R3 = load i8*, i8** %12
  %src8_000001C4002FC5D8.7 = ptrtoint i8** %src8_000001C4002FC5D8. to i64
  %13 = add i64 %src8_000001C4002FC5D8.7, 0
  %14 = inttoptr i64 %13 to i8**
  store i8* %R3, i8** %14
  br label %L1

L1:                                               ; preds = %L3, %L0
  %count_000001C4002FC258.8 = ptrtoint i32* %count_000001C4002FC258. to i64
  %15 = add i64 %count_000001C4002FC258.8, 0
  %16 = inttoptr i64 %15 to i32*
  %R5 = load i32, i32* %16
  %R6 = sub i32 %R5, 1
  %count_000001C4002FC258.9 = ptrtoint i32* %count_000001C4002FC258. to i64
  %17 = add i64 %count_000001C4002FC258.9, 0
  %18 = inttoptr i64 %17 to i32*
  store i32 %R6, i32* %18
  %R7 = icmp sgt i32 %R5, 0
  %R710 = zext i1 %R7 to i32
  %cond = icmp ne i32 %R710, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %src8_000001C4002FC5D8.11 = ptrtoint i8** %src8_000001C4002FC5D8. to i64
  %19 = add i64 %src8_000001C4002FC5D8.11, 0
  %20 = inttoptr i64 %19 to i8**
  %R8 = load i8*, i8** %20
  %R812 = ptrtoint i8* %R8 to i64
  %R9 = add i64 %R812, 1
  %R913 = inttoptr i64 %R9 to i8*
  %src8_000001C4002FC5D8.14 = ptrtoint i8** %src8_000001C4002FC5D8. to i64
  %21 = add i64 %src8_000001C4002FC5D8.14, 0
  %22 = inttoptr i64 %21 to i8**
  store i8* %R913, i8** %22
  %R815 = ptrtoint i8* %R8 to i64
  %23 = add i64 %R815, 0
  %24 = inttoptr i64 %23 to i8*
  %R10 = load i8, i8* %24
  %dst8_000001C4002FC418.16 = ptrtoint i8** %dst8_000001C4002FC418. to i64
  %25 = add i64 %dst8_000001C4002FC418.16, 0
  %26 = inttoptr i64 %25 to i8**
  %R11 = load i8*, i8** %26
  %R1117 = ptrtoint i8* %R11 to i64
  %R12 = add i64 %R1117, 1
  %R1218 = inttoptr i64 %R12 to i8*
  %dst8_000001C4002FC418.19 = ptrtoint i8** %dst8_000001C4002FC418. to i64
  %27 = add i64 %dst8_000001C4002FC418.19, 0
  %28 = inttoptr i64 %27 to i8**
  store i8* %R1218, i8** %28
  %R1120 = ptrtoint i8* %R11 to i64
  %29 = add i64 %R1120, 0
  %30 = inttoptr i64 %29 to i8*
  store i8 %R10, i8* %30
  br label %L3

L3:                                               ; preds = %L2
  br label %L1

L4:                                               ; preds = %L1
  %dest_000001C4002FBED8.21 = ptrtoint i8** %dest_000001C4002FBED8. to i64
  %31 = add i64 %dest_000001C4002FBED8.21, 0
  %32 = inttoptr i64 %31 to i8**
  %R13 = load i8*, i8** %32
  store i8* %R13, i8** %0
  br label %L5

L5:                                               ; preds = %L4
  %33 = load i8*, i8** %0
  ret i8* %R13
}

define %struct.allocator_st* @new_allocator(i32 %ARG1, i32 %ARG2) {
L6:
  %a_000001C401BB8CE8. = alloca %struct.allocator_st*
  %n_000001C401BB8B28. = alloca i32
  %size_000001C401BB8A48. = alloca i32
  %0 = alloca %struct.allocator_st*
  %size_000001C401BB8A48.1 = ptrtoint i32* %size_000001C401BB8A48. to i64
  %1 = add i64 %size_000001C401BB8A48.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %n_000001C401BB8B28.2 = ptrtoint i32* %n_000001C401BB8B28. to i64
  %3 = add i64 %n_000001C401BB8B28.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 %ARG2, i32* %4
  %size_000001C401BB8A48.3 = ptrtoint i32* %size_000001C401BB8A48. to i64
  %5 = add i64 %size_000001C401BB8A48.3, 0
  %6 = inttoptr i64 %5 to i32*
  %R15 = load i32, i32* %6
  %n_000001C401BB8B28.4 = ptrtoint i32* %n_000001C401BB8B28. to i64
  %7 = add i64 %n_000001C401BB8B28.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R16 = load i32, i32* %8
  %R17 = mul i32 %R15, %R16
  %R18 = sext i32 %R17 to i64
  %R19 = icmp ugt i64 %R18, 65536
  %R195 = zext i1 %R19 to i32
  %cond = icmp ne i32 %R195, 0
  br i1 %cond, label %L7, label %L8

L7:                                               ; preds = %L6
  %R21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0))
  call void @exit(i32 1)
  br label %L8

L8:                                               ; preds = %L7, %L6
  %a_000001C401BB8CE8.6 = ptrtoint %struct.allocator_st** %a_000001C401BB8CE8. to i64
  %9 = add i64 %a_000001C401BB8CE8.6, 0
  %10 = inttoptr i64 %9 to %struct.allocator_st**
  store %struct.allocator_st* @A, %struct.allocator_st** %10
  %a_000001C401BB8CE8.7 = ptrtoint %struct.allocator_st** %a_000001C401BB8CE8. to i64
  %11 = add i64 %a_000001C401BB8CE8.7, 0
  %12 = inttoptr i64 %11 to %struct.allocator_st**
  %R23 = load %struct.allocator_st*, %struct.allocator_st** %12
  %R238 = ptrtoint %struct.allocator_st* %R23 to i64
  %13 = add i64 %R238, 0
  %14 = inttoptr i64 %13 to %struct.buffer_type_st**
  store %struct.buffer_type_st* null, %struct.buffer_type_st** %14
  %a_000001C401BB8CE8.9 = ptrtoint %struct.allocator_st** %a_000001C401BB8CE8. to i64
  %15 = add i64 %a_000001C401BB8CE8.9, 0
  %16 = inttoptr i64 %15 to %struct.allocator_st**
  %R24 = load %struct.allocator_st*, %struct.allocator_st** %16
  %R2410 = ptrtoint %struct.allocator_st* %R24 to i64
  %17 = add i64 %R2410, 8
  %18 = inttoptr i64 %17 to %struct.link_st**
  store %struct.link_st* null, %struct.link_st** %18
  %a_000001C401BB8CE8.11 = ptrtoint %struct.allocator_st** %a_000001C401BB8CE8. to i64
  %19 = add i64 %a_000001C401BB8CE8.11, 0
  %20 = inttoptr i64 %19 to %struct.allocator_st**
  %R25 = load %struct.allocator_st*, %struct.allocator_st** %20
  %R2512 = ptrtoint %struct.allocator_st* %R25 to i64
  %21 = add i64 %R2512, 16
  %22 = inttoptr i64 %21 to i8**
  store i8* null, i8** %22
  %a_000001C401BB8CE8.13 = ptrtoint %struct.allocator_st** %a_000001C401BB8CE8. to i64
  %23 = add i64 %a_000001C401BB8CE8.13, 0
  %24 = inttoptr i64 %23 to %struct.allocator_st**
  %R26 = load %struct.allocator_st*, %struct.allocator_st** %24
  %R2614 = ptrtoint %struct.allocator_st* %R26 to i64
  %25 = add i64 %R2614, 24
  %26 = inttoptr i64 %25 to i8**
  store i8* null, i8** %26
  %size_000001C401BB8A48.15 = ptrtoint i32* %size_000001C401BB8A48. to i64
  %27 = add i64 %size_000001C401BB8A48.15, 0
  %28 = inttoptr i64 %27 to i32*
  %R27 = load i32, i32* %28
  %a_000001C401BB8CE8.16 = ptrtoint %struct.allocator_st** %a_000001C401BB8CE8. to i64
  %29 = add i64 %a_000001C401BB8CE8.16, 0
  %30 = inttoptr i64 %29 to %struct.allocator_st**
  %R28 = load %struct.allocator_st*, %struct.allocator_st** %30
  %R2817 = ptrtoint %struct.allocator_st* %R28 to i64
  %31 = add i64 %R2817, 32
  %32 = inttoptr i64 %31 to i32*
  store i32 %R27, i32* %32
  %n_000001C401BB8B28.18 = ptrtoint i32* %n_000001C401BB8B28. to i64
  %33 = add i64 %n_000001C401BB8B28.18, 0
  %34 = inttoptr i64 %33 to i32*
  %R29 = load i32, i32* %34
  %a_000001C401BB8CE8.19 = ptrtoint %struct.allocator_st** %a_000001C401BB8CE8. to i64
  %35 = add i64 %a_000001C401BB8CE8.19, 0
  %36 = inttoptr i64 %35 to %struct.allocator_st**
  %R30 = load %struct.allocator_st*, %struct.allocator_st** %36
  %R3020 = ptrtoint %struct.allocator_st* %R30 to i64
  %37 = add i64 %R3020, 36
  %38 = inttoptr i64 %37 to i32*
  store i32 %R29, i32* %38
  %a_000001C401BB8CE8.21 = ptrtoint %struct.allocator_st** %a_000001C401BB8CE8. to i64
  %39 = add i64 %a_000001C401BB8CE8.21, 0
  %40 = inttoptr i64 %39 to %struct.allocator_st**
  %R31 = load %struct.allocator_st*, %struct.allocator_st** %40
  store %struct.allocator_st* %R31, %struct.allocator_st** %0
  br label %L9

L9:                                               ; preds = %L8
  %41 = load %struct.allocator_st*, %struct.allocator_st** %0
  ret %struct.allocator_st* %R31
}

declare i32 @printf(i8*, ...)

declare void @exit(i32)

define void @grow_allocator(%struct.allocator_st* %ARG1) {
L10:
  %tmp_000001C401BB9A08. = alloca %struct.buffer_type_st*
  %a_000001C401BB9768. = alloca %struct.allocator_st*
  %a_000001C401BB9768.1 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %0 = add i64 %a_000001C401BB9768.1, 0
  %1 = inttoptr i64 %0 to %struct.allocator_st**
  store %struct.allocator_st* %ARG1, %struct.allocator_st** %1
  %R33 = load i32, i32* @once
  %cond = icmp ne i32 %R33, 0
  br i1 %cond, label %L11, label %L12

L11:                                              ; preds = %L10
  %R35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0))
  call void @exit(i32 1)
  br label %L13

L12:                                              ; preds = %L10
  store i32 1, i32* @once
  br label %L13

L13:                                              ; preds = %L12, %L11
  %tmp_000001C401BB9A08.2 = ptrtoint %struct.buffer_type_st** %tmp_000001C401BB9A08. to i64
  %2 = add i64 %tmp_000001C401BB9A08.2, 0
  %3 = inttoptr i64 %2 to %struct.buffer_type_st**
  store %struct.buffer_type_st* @Node, %struct.buffer_type_st** %3
  %tmp_000001C401BB9A08.3 = ptrtoint %struct.buffer_type_st** %tmp_000001C401BB9A08. to i64
  %4 = add i64 %tmp_000001C401BB9A08.3, 0
  %5 = inttoptr i64 %4 to %struct.buffer_type_st**
  %R38 = load %struct.buffer_type_st*, %struct.buffer_type_st** %5
  %R384 = ptrtoint %struct.buffer_type_st* %R38 to i64
  %6 = add i64 %R384, 8
  %7 = inttoptr i64 %6 to i8**
  store i8* getelementptr inbounds ([65536 x i8], [65536 x i8]* @Memory, i32 0, i32 0), i8** %7
  %a_000001C401BB9768.5 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %8 = add i64 %a_000001C401BB9768.5, 0
  %9 = inttoptr i64 %8 to %struct.allocator_st**
  %R39 = load %struct.allocator_st*, %struct.allocator_st** %9
  %R396 = ptrtoint %struct.allocator_st* %R39 to i64
  %10 = add i64 %R396, 0
  %11 = inttoptr i64 %10 to %struct.buffer_type_st**
  %R40 = load %struct.buffer_type_st*, %struct.buffer_type_st** %11
  %tmp_000001C401BB9A08.7 = ptrtoint %struct.buffer_type_st** %tmp_000001C401BB9A08. to i64
  %12 = add i64 %tmp_000001C401BB9A08.7, 0
  %13 = inttoptr i64 %12 to %struct.buffer_type_st**
  %R41 = load %struct.buffer_type_st*, %struct.buffer_type_st** %13
  %R418 = ptrtoint %struct.buffer_type_st* %R41 to i64
  %14 = add i64 %R418, 0
  %15 = inttoptr i64 %14 to %struct.buffer_type_st**
  store %struct.buffer_type_st* %R40, %struct.buffer_type_st** %15
  %tmp_000001C401BB9A08.9 = ptrtoint %struct.buffer_type_st** %tmp_000001C401BB9A08. to i64
  %16 = add i64 %tmp_000001C401BB9A08.9, 0
  %17 = inttoptr i64 %16 to %struct.buffer_type_st**
  %R42 = load %struct.buffer_type_st*, %struct.buffer_type_st** %17
  %a_000001C401BB9768.10 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %18 = add i64 %a_000001C401BB9768.10, 0
  %19 = inttoptr i64 %18 to %struct.allocator_st**
  %R43 = load %struct.allocator_st*, %struct.allocator_st** %19
  %R4311 = ptrtoint %struct.allocator_st* %R43 to i64
  %20 = add i64 %R4311, 0
  %21 = inttoptr i64 %20 to %struct.buffer_type_st**
  store %struct.buffer_type_st* %R42, %struct.buffer_type_st** %21
  %a_000001C401BB9768.12 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %22 = add i64 %a_000001C401BB9768.12, 0
  %23 = inttoptr i64 %22 to %struct.allocator_st**
  %R44 = load %struct.allocator_st*, %struct.allocator_st** %23
  %R4413 = ptrtoint %struct.allocator_st* %R44 to i64
  %24 = add i64 %R4413, 0
  %25 = inttoptr i64 %24 to %struct.buffer_type_st**
  %R45 = load %struct.buffer_type_st*, %struct.buffer_type_st** %25
  %R4514 = ptrtoint %struct.buffer_type_st* %R45 to i64
  %26 = add i64 %R4514, 8
  %27 = inttoptr i64 %26 to i8**
  %R46 = load i8*, i8** %27
  %a_000001C401BB9768.15 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %28 = add i64 %a_000001C401BB9768.15, 0
  %29 = inttoptr i64 %28 to %struct.allocator_st**
  %R47 = load %struct.allocator_st*, %struct.allocator_st** %29
  %R4716 = ptrtoint %struct.allocator_st* %R47 to i64
  %30 = add i64 %R4716, 16
  %31 = inttoptr i64 %30 to i8**
  store i8* %R46, i8** %31
  %a_000001C401BB9768.17 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %32 = add i64 %a_000001C401BB9768.17, 0
  %33 = inttoptr i64 %32 to %struct.allocator_st**
  %R48 = load %struct.allocator_st*, %struct.allocator_st** %33
  %R4818 = ptrtoint %struct.allocator_st* %R48 to i64
  %34 = add i64 %R4818, 16
  %35 = inttoptr i64 %34 to i8**
  %R49 = load i8*, i8** %35
  %a_000001C401BB9768.19 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %36 = add i64 %a_000001C401BB9768.19, 0
  %37 = inttoptr i64 %36 to %struct.allocator_st**
  %R50 = load %struct.allocator_st*, %struct.allocator_st** %37
  %R5020 = ptrtoint %struct.allocator_st* %R50 to i64
  %38 = add i64 %R5020, 32
  %39 = inttoptr i64 %38 to i32*
  %R51 = load i32, i32* %39
  %a_000001C401BB9768.21 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %40 = add i64 %a_000001C401BB9768.21, 0
  %41 = inttoptr i64 %40 to %struct.allocator_st**
  %R52 = load %struct.allocator_st*, %struct.allocator_st** %41
  %R5222 = ptrtoint %struct.allocator_st* %R52 to i64
  %42 = add i64 %R5222, 36
  %43 = inttoptr i64 %42 to i32*
  %R53 = load i32, i32* %43
  %R54 = mul i32 %R51, %R53
  %R55 = sext i32 %R54 to i64
  %R4923 = ptrtoint i8* %R49 to i64
  %R56 = add i64 %R4923, %R55
  %R5624 = inttoptr i64 %R56 to i8*
  %a_000001C401BB9768.25 = ptrtoint %struct.allocator_st** %a_000001C401BB9768. to i64
  %44 = add i64 %a_000001C401BB9768.25, 0
  %45 = inttoptr i64 %44 to %struct.allocator_st**
  %R57 = load %struct.allocator_st*, %struct.allocator_st** %45
  %R5726 = ptrtoint %struct.allocator_st* %R57 to i64
  %46 = add i64 %R5726, 24
  %47 = inttoptr i64 %46 to i8**
  store i8* %R5624, i8** %47
  br label %L14

L14:                                              ; preds = %L13
  ret void
}

define i8* @alloc_node(%struct.allocator_st* %ARG1) {
L15:
  %tmp_000001C401BBA648. = alloca i8*
  %tmp_000001C401BBA108. = alloca %struct.link_st*
  %a_000001C401BB9E68. = alloca %struct.allocator_st*
  %0 = alloca i8*
  %a_000001C401BB9E68.1 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %1 = add i64 %a_000001C401BB9E68.1, 0
  %2 = inttoptr i64 %1 to %struct.allocator_st**
  store %struct.allocator_st* %ARG1, %struct.allocator_st** %2
  %a_000001C401BB9E68.2 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %3 = add i64 %a_000001C401BB9E68.2, 0
  %4 = inttoptr i64 %3 to %struct.allocator_st**
  %R58 = load %struct.allocator_st*, %struct.allocator_st** %4
  %R583 = ptrtoint %struct.allocator_st* %R58 to i64
  %5 = add i64 %R583, 8
  %6 = inttoptr i64 %5 to %struct.link_st**
  %R59 = load %struct.link_st*, %struct.link_st** %6
  %tmp_000001C401BBA108.4 = ptrtoint %struct.link_st** %tmp_000001C401BBA108. to i64
  %7 = add i64 %tmp_000001C401BBA108.4, 0
  %8 = inttoptr i64 %7 to %struct.link_st**
  store %struct.link_st* %R59, %struct.link_st** %8
  %a_000001C401BB9E68.5 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %9 = add i64 %a_000001C401BB9E68.5, 0
  %10 = inttoptr i64 %9 to %struct.allocator_st**
  %R60 = load %struct.allocator_st*, %struct.allocator_st** %10
  %R606 = ptrtoint %struct.allocator_st* %R60 to i64
  %11 = add i64 %R606, 8
  %12 = inttoptr i64 %11 to %struct.link_st**
  %R61 = load %struct.link_st*, %struct.link_st** %12
  %cond = icmp ne %struct.link_st* %R61, null
  br i1 %cond, label %L16, label %L17

L16:                                              ; preds = %L15
  %a_000001C401BB9E68.7 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %13 = add i64 %a_000001C401BB9E68.7, 0
  %14 = inttoptr i64 %13 to %struct.allocator_st**
  %R62 = load %struct.allocator_st*, %struct.allocator_st** %14
  %R628 = ptrtoint %struct.allocator_st* %R62 to i64
  %15 = add i64 %R628, 8
  %16 = inttoptr i64 %15 to %struct.link_st**
  %R63 = load %struct.link_st*, %struct.link_st** %16
  %R639 = ptrtoint %struct.link_st* %R63 to i64
  %17 = add i64 %R639, 0
  %18 = inttoptr i64 %17 to %struct.link_st**
  %R64 = load %struct.link_st*, %struct.link_st** %18
  %a_000001C401BB9E68.10 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %19 = add i64 %a_000001C401BB9E68.10, 0
  %20 = inttoptr i64 %19 to %struct.allocator_st**
  %R66 = load %struct.allocator_st*, %struct.allocator_st** %20
  %R6611 = ptrtoint %struct.allocator_st* %R66 to i64
  %21 = add i64 %R6611, 8
  %22 = inttoptr i64 %21 to %struct.link_st**
  store %struct.link_st* %R64, %struct.link_st** %22
  %tmp_000001C401BBA108.12 = ptrtoint %struct.link_st** %tmp_000001C401BBA108. to i64
  %23 = add i64 %tmp_000001C401BBA108.12, 0
  %24 = inttoptr i64 %23 to %struct.link_st**
  %R67 = load %struct.link_st*, %struct.link_st** %24
  %R68 = bitcast %struct.link_st* %R67 to i8*
  store i8* %R68, i8** %0
  br label %L20

L17:                                              ; preds = %L15
  %a_000001C401BB9E68.13 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %25 = add i64 %a_000001C401BB9E68.13, 0
  %26 = inttoptr i64 %25 to %struct.allocator_st**
  %R70 = load %struct.allocator_st*, %struct.allocator_st** %26
  %R7014 = ptrtoint %struct.allocator_st* %R70 to i64
  %27 = add i64 %R7014, 16
  %28 = inttoptr i64 %27 to i8**
  %R71 = load i8*, i8** %28
  %a_000001C401BB9E68.15 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %29 = add i64 %a_000001C401BB9E68.15, 0
  %30 = inttoptr i64 %29 to %struct.allocator_st**
  %R72 = load %struct.allocator_st*, %struct.allocator_st** %30
  %R7216 = ptrtoint %struct.allocator_st* %R72 to i64
  %31 = add i64 %R7216, 24
  %32 = inttoptr i64 %31 to i8**
  %R73 = load i8*, i8** %32
  %33 = ptrtoint i8* %R71 to i64
  %34 = ptrtoint i8* %R73 to i64
  %R74 = icmp eq i64 %33, %34
  %R7417 = zext i1 %R74 to i32
  %cond18 = icmp ne i32 %R7417, 0
  br i1 %cond18, label %L18, label %L19

L18:                                              ; preds = %L17
  %a_000001C401BB9E68.19 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %35 = add i64 %a_000001C401BB9E68.19, 0
  %36 = inttoptr i64 %35 to %struct.allocator_st**
  %R75 = load %struct.allocator_st*, %struct.allocator_st** %36
  call void @grow_allocator(%struct.allocator_st* %R75)
  br label %L19

L19:                                              ; preds = %L18, %L17
  %a_000001C401BB9E68.20 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %37 = add i64 %a_000001C401BB9E68.20, 0
  %38 = inttoptr i64 %37 to %struct.allocator_st**
  %R76 = load %struct.allocator_st*, %struct.allocator_st** %38
  %R7621 = ptrtoint %struct.allocator_st* %R76 to i64
  %39 = add i64 %R7621, 16
  %40 = inttoptr i64 %39 to i8**
  %R77 = load i8*, i8** %40
  %tmp_000001C401BBA648.22 = ptrtoint i8** %tmp_000001C401BBA648. to i64
  %41 = add i64 %tmp_000001C401BBA648.22, 0
  %42 = inttoptr i64 %41 to i8**
  store i8* %R77, i8** %42
  %a_000001C401BB9E68.23 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %43 = add i64 %a_000001C401BB9E68.23, 0
  %44 = inttoptr i64 %43 to %struct.allocator_st**
  %R79 = load %struct.allocator_st*, %struct.allocator_st** %44
  %R7924 = ptrtoint %struct.allocator_st* %R79 to i64
  %45 = add i64 %R7924, 32
  %46 = inttoptr i64 %45 to i32*
  %R80 = load i32, i32* %46
  %R81 = sext i32 %R80 to i64
  %a_000001C401BB9E68.25 = ptrtoint %struct.allocator_st** %a_000001C401BB9E68. to i64
  %47 = add i64 %a_000001C401BB9E68.25, 0
  %48 = inttoptr i64 %47 to %struct.allocator_st**
  %R82 = load %struct.allocator_st*, %struct.allocator_st** %48
  %R8226 = ptrtoint %struct.allocator_st* %R82 to i64
  %49 = add i64 %R8226, 16
  %50 = inttoptr i64 %49 to i8**
  %R83 = load i8*, i8** %50
  %R84 = ptrtoint i8* %R83 to i64
  %R85 = add i64 %R84, %R81
  %R86 = inttoptr i64 %R85 to i8*
  %R8227 = ptrtoint %struct.allocator_st* %R82 to i64
  %51 = add i64 %R8227, 16
  %52 = inttoptr i64 %51 to i8**
  store i8* %R86, i8** %52
  %tmp_000001C401BBA648.28 = ptrtoint i8** %tmp_000001C401BBA648. to i64
  %53 = add i64 %tmp_000001C401BBA648.28, 0
  %54 = inttoptr i64 %53 to i8**
  %R87 = load i8*, i8** %54
  store i8* %R87, i8** %0
  br label %L20

L20:                                              ; preds = %L19, %L16
  %55 = load i8*, i8** %0
  ret i8* %55
}

define void @dealloc_node(%struct.allocator_st* %ARG1, i8* %ARG2) {
L21:
  %n_000001C401BBAD48. = alloca i8*
  %a_000001C401BBAB88. = alloca %struct.allocator_st*
  %a_000001C401BBAB88.1 = ptrtoint %struct.allocator_st** %a_000001C401BBAB88. to i64
  %0 = add i64 %a_000001C401BBAB88.1, 0
  %1 = inttoptr i64 %0 to %struct.allocator_st**
  store %struct.allocator_st* %ARG1, %struct.allocator_st** %1
  %n_000001C401BBAD48.2 = ptrtoint i8** %n_000001C401BBAD48. to i64
  %2 = add i64 %n_000001C401BBAD48.2, 0
  %3 = inttoptr i64 %2 to i8**
  store i8* %ARG2, i8** %3
  %a_000001C401BBAB88.3 = ptrtoint %struct.allocator_st** %a_000001C401BBAB88. to i64
  %4 = add i64 %a_000001C401BBAB88.3, 0
  %5 = inttoptr i64 %4 to %struct.allocator_st**
  %R88 = load %struct.allocator_st*, %struct.allocator_st** %5
  %R884 = ptrtoint %struct.allocator_st* %R88 to i64
  %6 = add i64 %R884, 8
  %7 = inttoptr i64 %6 to %struct.link_st**
  %R89 = load %struct.link_st*, %struct.link_st** %7
  %n_000001C401BBAD48.5 = ptrtoint i8** %n_000001C401BBAD48. to i64
  %8 = add i64 %n_000001C401BBAD48.5, 0
  %9 = inttoptr i64 %8 to i8**
  %R90 = load i8*, i8** %9
  %R91 = bitcast i8* %R90 to %struct.link_st*
  %R916 = ptrtoint %struct.link_st* %R91 to i64
  %10 = add i64 %R916, 0
  %11 = inttoptr i64 %10 to %struct.link_st**
  store %struct.link_st* %R89, %struct.link_st** %11
  %n_000001C401BBAD48.7 = ptrtoint i8** %n_000001C401BBAD48. to i64
  %12 = add i64 %n_000001C401BBAD48.7, 0
  %13 = inttoptr i64 %12 to i8**
  %R92 = load i8*, i8** %13
  %R93 = bitcast i8* %R92 to %struct.link_st*
  %a_000001C401BBAB88.8 = ptrtoint %struct.allocator_st** %a_000001C401BBAB88. to i64
  %14 = add i64 %a_000001C401BBAB88.8, 0
  %15 = inttoptr i64 %14 to %struct.allocator_st**
  %R94 = load %struct.allocator_st*, %struct.allocator_st** %15
  %R949 = ptrtoint %struct.allocator_st* %R94 to i64
  %16 = add i64 %R949, 8
  %17 = inttoptr i64 %16 to %struct.link_st**
  store %struct.link_st* %R93, %struct.link_st** %17
  br label %L22

L22:                                              ; preds = %L21
  ret void
}

define void @destroy_allocator(%struct.allocator_st* %ARG1) {
L23:
  %a_000001C401BBB528. = alloca %struct.allocator_st*
  %a_000001C401BBB528.1 = ptrtoint %struct.allocator_st** %a_000001C401BBB528. to i64
  %0 = add i64 %a_000001C401BBB528.1, 0
  %1 = inttoptr i64 %0 to %struct.allocator_st**
  store %struct.allocator_st* %ARG1, %struct.allocator_st** %1
  br label %L24

L24:                                              ; preds = %L23
  ret void
}

define void @AVL_SetRight(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %ARG2) {
L25:
  %r_000001C401BC7B68. = alloca %struct.AVLNode_st*
  %self_000001C401BC79A8. = alloca %struct.AVLNode_st*
  %self_000001C401BC79A8.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BC79A8. to i64
  %0 = add i64 %self_000001C401BC79A8.1, 0
  %1 = inttoptr i64 %0 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %1
  %r_000001C401BC7B68.2 = ptrtoint %struct.AVLNode_st** %r_000001C401BC7B68. to i64
  %2 = add i64 %r_000001C401BC7B68.2, 0
  %3 = inttoptr i64 %2 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG2, %struct.AVLNode_st** %3
  %r_000001C401BC7B68.3 = ptrtoint %struct.AVLNode_st** %r_000001C401BC7B68. to i64
  %4 = add i64 %r_000001C401BC7B68.3, 0
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  %R95 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %self_000001C401BC79A8.4 = ptrtoint %struct.AVLNode_st** %self_000001C401BC79A8. to i64
  %6 = add i64 %self_000001C401BC79A8.4, 0
  %7 = inttoptr i64 %6 to %struct.AVLNode_st**
  %R96 = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %R965 = ptrtoint %struct.AVLNode_st* %R96 to i64
  %8 = add i64 %R965, 16
  %9 = inttoptr i64 %8 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R95, %struct.AVLNode_st** %9
  %r_000001C401BC7B68.6 = ptrtoint %struct.AVLNode_st** %r_000001C401BC7B68. to i64
  %10 = add i64 %r_000001C401BC7B68.6, 0
  %11 = inttoptr i64 %10 to %struct.AVLNode_st**
  %R97 = load %struct.AVLNode_st*, %struct.AVLNode_st** %11
  %cond = icmp ne %struct.AVLNode_st* %R97, null
  br i1 %cond, label %L26, label %L27

L26:                                              ; preds = %L25
  %self_000001C401BC79A8.7 = ptrtoint %struct.AVLNode_st** %self_000001C401BC79A8. to i64
  %12 = add i64 %self_000001C401BC79A8.7, 0
  %13 = inttoptr i64 %12 to %struct.AVLNode_st**
  %R98 = load %struct.AVLNode_st*, %struct.AVLNode_st** %13
  %r_000001C401BC7B68.8 = ptrtoint %struct.AVLNode_st** %r_000001C401BC7B68. to i64
  %14 = add i64 %r_000001C401BC7B68.8, 0
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %R99 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %R999 = ptrtoint %struct.AVLNode_st* %R99 to i64
  %16 = add i64 %R999, 0
  %17 = inttoptr i64 %16 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R98, %struct.AVLNode_st** %17
  br label %L27

L27:                                              ; preds = %L26, %L25
  ret void
}

define void @AVL_SetLeft(%struct.AVLNode_st* %ARG1, %struct.AVLNode_st* %ARG2) {
L28:
  %l_000001C401BC8208. = alloca %struct.AVLNode_st*
  %self_000001C401BC7FC8. = alloca %struct.AVLNode_st*
  %self_000001C401BC7FC8.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BC7FC8. to i64
  %0 = add i64 %self_000001C401BC7FC8.1, 0
  %1 = inttoptr i64 %0 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %1
  %l_000001C401BC8208.2 = ptrtoint %struct.AVLNode_st** %l_000001C401BC8208. to i64
  %2 = add i64 %l_000001C401BC8208.2, 0
  %3 = inttoptr i64 %2 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG2, %struct.AVLNode_st** %3
  %l_000001C401BC8208.3 = ptrtoint %struct.AVLNode_st** %l_000001C401BC8208. to i64
  %4 = add i64 %l_000001C401BC8208.3, 0
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  %R100 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %self_000001C401BC7FC8.4 = ptrtoint %struct.AVLNode_st** %self_000001C401BC7FC8. to i64
  %6 = add i64 %self_000001C401BC7FC8.4, 0
  %7 = inttoptr i64 %6 to %struct.AVLNode_st**
  %R101 = load %struct.AVLNode_st*, %struct.AVLNode_st** %7
  %R1015 = ptrtoint %struct.AVLNode_st* %R101 to i64
  %8 = add i64 %R1015, 8
  %9 = inttoptr i64 %8 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R100, %struct.AVLNode_st** %9
  %l_000001C401BC8208.6 = ptrtoint %struct.AVLNode_st** %l_000001C401BC8208. to i64
  %10 = add i64 %l_000001C401BC8208.6, 0
  %11 = inttoptr i64 %10 to %struct.AVLNode_st**
  %R102 = load %struct.AVLNode_st*, %struct.AVLNode_st** %11
  %cond = icmp ne %struct.AVLNode_st* %R102, null
  br i1 %cond, label %L29, label %L30

L29:                                              ; preds = %L28
  %self_000001C401BC7FC8.7 = ptrtoint %struct.AVLNode_st** %self_000001C401BC7FC8. to i64
  %12 = add i64 %self_000001C401BC7FC8.7, 0
  %13 = inttoptr i64 %12 to %struct.AVLNode_st**
  %R103 = load %struct.AVLNode_st*, %struct.AVLNode_st** %13
  %l_000001C401BC8208.8 = ptrtoint %struct.AVLNode_st** %l_000001C401BC8208. to i64
  %14 = add i64 %l_000001C401BC8208.8, 0
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %R104 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %R1049 = ptrtoint %struct.AVLNode_st* %R104 to i64
  %16 = add i64 %R1049, 0
  %17 = inttoptr i64 %16 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R103, %struct.AVLNode_st** %17
  br label %L30

L30:                                              ; preds = %L29, %L28
  ret void
}

define %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %ARG1) {
L31:
  %newroot_000001C401BC89E8. = alloca %struct.AVLNode_st*
  %self_000001C401BC8748. = alloca %struct.AVLNode_st*
  %0 = alloca %struct.AVLNode_st*
  %self_000001C401BC8748.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %1 = add i64 %self_000001C401BC8748.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %self_000001C401BC8748.2 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %3 = add i64 %self_000001C401BC8748.2, 0
  %4 = inttoptr i64 %3 to %struct.AVLNode_st**
  %R105 = load %struct.AVLNode_st*, %struct.AVLNode_st** %4
  %R1053 = ptrtoint %struct.AVLNode_st* %R105 to i64
  %5 = add i64 %R1053, 16
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %R106 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %newroot_000001C401BC89E8.4 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC89E8. to i64
  %7 = add i64 %newroot_000001C401BC89E8.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R106, %struct.AVLNode_st** %8
  %self_000001C401BC8748.5 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %9 = add i64 %self_000001C401BC8748.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R107 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %R1076 = ptrtoint %struct.AVLNode_st* %R107 to i64
  %11 = add i64 %R1076, 0
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  %R108 = load %struct.AVLNode_st*, %struct.AVLNode_st** %12
  %13 = ptrtoint %struct.AVLNode_st* %R108 to i64
  %R109 = icmp ne i64 %13, 0
  %R1097 = zext i1 %R109 to i32
  %cond = icmp ne i32 %R1097, 0
  br i1 %cond, label %L32, label %L36

L32:                                              ; preds = %L31
  %self_000001C401BC8748.8 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %14 = add i64 %self_000001C401BC8748.8, 0
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %R110 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %self_000001C401BC8748.9 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %16 = add i64 %self_000001C401BC8748.9, 0
  %17 = inttoptr i64 %16 to %struct.AVLNode_st**
  %R111 = load %struct.AVLNode_st*, %struct.AVLNode_st** %17
  %R11110 = ptrtoint %struct.AVLNode_st* %R111 to i64
  %18 = add i64 %R11110, 0
  %19 = inttoptr i64 %18 to %struct.AVLNode_st**
  %R112 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  %R11211 = ptrtoint %struct.AVLNode_st* %R112 to i64
  %20 = add i64 %R11211, 8
  %21 = inttoptr i64 %20 to %struct.AVLNode_st**
  %R113 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  %22 = ptrtoint %struct.AVLNode_st* %R110 to i64
  %23 = ptrtoint %struct.AVLNode_st* %R113 to i64
  %R114 = icmp eq i64 %22, %23
  %R11412 = zext i1 %R114 to i32
  %cond13 = icmp ne i32 %R11412, 0
  br i1 %cond13, label %L33, label %L34

L33:                                              ; preds = %L32
  %self_000001C401BC8748.14 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %24 = add i64 %self_000001C401BC8748.14, 0
  %25 = inttoptr i64 %24 to %struct.AVLNode_st**
  %R115 = load %struct.AVLNode_st*, %struct.AVLNode_st** %25
  %R11515 = ptrtoint %struct.AVLNode_st* %R115 to i64
  %26 = add i64 %R11515, 0
  %27 = inttoptr i64 %26 to %struct.AVLNode_st**
  %R116 = load %struct.AVLNode_st*, %struct.AVLNode_st** %27
  %newroot_000001C401BC89E8.16 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC89E8. to i64
  %28 = add i64 %newroot_000001C401BC89E8.16, 0
  %29 = inttoptr i64 %28 to %struct.AVLNode_st**
  %R117 = load %struct.AVLNode_st*, %struct.AVLNode_st** %29
  call void @AVL_SetLeft(%struct.AVLNode_st* %R116, %struct.AVLNode_st* %R117)
  br label %L35

L34:                                              ; preds = %L32
  %self_000001C401BC8748.17 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %30 = add i64 %self_000001C401BC8748.17, 0
  %31 = inttoptr i64 %30 to %struct.AVLNode_st**
  %R118 = load %struct.AVLNode_st*, %struct.AVLNode_st** %31
  %R11818 = ptrtoint %struct.AVLNode_st* %R118 to i64
  %32 = add i64 %R11818, 0
  %33 = inttoptr i64 %32 to %struct.AVLNode_st**
  %R119 = load %struct.AVLNode_st*, %struct.AVLNode_st** %33
  %newroot_000001C401BC89E8.19 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC89E8. to i64
  %34 = add i64 %newroot_000001C401BC89E8.19, 0
  %35 = inttoptr i64 %34 to %struct.AVLNode_st**
  %R120 = load %struct.AVLNode_st*, %struct.AVLNode_st** %35
  call void @AVL_SetRight(%struct.AVLNode_st* %R119, %struct.AVLNode_st* %R120)
  br label %L35

L35:                                              ; preds = %L34, %L33
  br label %L37

L36:                                              ; preds = %L31
  %newroot_000001C401BC89E8.20 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC89E8. to i64
  %36 = add i64 %newroot_000001C401BC89E8.20, 0
  %37 = inttoptr i64 %36 to %struct.AVLNode_st**
  %R121 = load %struct.AVLNode_st*, %struct.AVLNode_st** %37
  %R12121 = ptrtoint %struct.AVLNode_st* %R121 to i64
  %38 = add i64 %R12121, 0
  %39 = inttoptr i64 %38 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %39
  br label %L37

L37:                                              ; preds = %L36, %L35
  %self_000001C401BC8748.22 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %40 = add i64 %self_000001C401BC8748.22, 0
  %41 = inttoptr i64 %40 to %struct.AVLNode_st**
  %R122 = load %struct.AVLNode_st*, %struct.AVLNode_st** %41
  %newroot_000001C401BC89E8.23 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC89E8. to i64
  %42 = add i64 %newroot_000001C401BC89E8.23, 0
  %43 = inttoptr i64 %42 to %struct.AVLNode_st**
  %R123 = load %struct.AVLNode_st*, %struct.AVLNode_st** %43
  %R12324 = ptrtoint %struct.AVLNode_st* %R123 to i64
  %44 = add i64 %R12324, 8
  %45 = inttoptr i64 %44 to %struct.AVLNode_st**
  %R124 = load %struct.AVLNode_st*, %struct.AVLNode_st** %45
  call void @AVL_SetRight(%struct.AVLNode_st* %R122, %struct.AVLNode_st* %R124)
  %newroot_000001C401BC89E8.25 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC89E8. to i64
  %46 = add i64 %newroot_000001C401BC89E8.25, 0
  %47 = inttoptr i64 %46 to %struct.AVLNode_st**
  %R125 = load %struct.AVLNode_st*, %struct.AVLNode_st** %47
  %self_000001C401BC8748.26 = ptrtoint %struct.AVLNode_st** %self_000001C401BC8748. to i64
  %48 = add i64 %self_000001C401BC8748.26, 0
  %49 = inttoptr i64 %48 to %struct.AVLNode_st**
  %R126 = load %struct.AVLNode_st*, %struct.AVLNode_st** %49
  call void @AVL_SetLeft(%struct.AVLNode_st* %R125, %struct.AVLNode_st* %R126)
  %newroot_000001C401BC89E8.27 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC89E8. to i64
  %50 = add i64 %newroot_000001C401BC89E8.27, 0
  %51 = inttoptr i64 %50 to %struct.AVLNode_st**
  %R127 = load %struct.AVLNode_st*, %struct.AVLNode_st** %51
  store %struct.AVLNode_st* %R127, %struct.AVLNode_st** %0
  br label %L38

L38:                                              ; preds = %L37
  %52 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R127
}

define %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %ARG1) {
L39:
  %newroot_000001C401BC9468. = alloca %struct.AVLNode_st*
  %self_000001C401BC91C8. = alloca %struct.AVLNode_st*
  %0 = alloca %struct.AVLNode_st*
  %self_000001C401BC91C8.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %1 = add i64 %self_000001C401BC91C8.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %self_000001C401BC91C8.2 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %3 = add i64 %self_000001C401BC91C8.2, 0
  %4 = inttoptr i64 %3 to %struct.AVLNode_st**
  %R129 = load %struct.AVLNode_st*, %struct.AVLNode_st** %4
  %R1293 = ptrtoint %struct.AVLNode_st* %R129 to i64
  %5 = add i64 %R1293, 8
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %R130 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %newroot_000001C401BC9468.4 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC9468. to i64
  %7 = add i64 %newroot_000001C401BC9468.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R130, %struct.AVLNode_st** %8
  %self_000001C401BC91C8.5 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %9 = add i64 %self_000001C401BC91C8.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R131 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %R1316 = ptrtoint %struct.AVLNode_st* %R131 to i64
  %11 = add i64 %R1316, 0
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  %R132 = load %struct.AVLNode_st*, %struct.AVLNode_st** %12
  %13 = ptrtoint %struct.AVLNode_st* %R132 to i64
  %R133 = icmp ne i64 %13, 0
  %R1337 = zext i1 %R133 to i32
  %cond = icmp ne i32 %R1337, 0
  br i1 %cond, label %L40, label %L44

L40:                                              ; preds = %L39
  %self_000001C401BC91C8.8 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %14 = add i64 %self_000001C401BC91C8.8, 0
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %R134 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %self_000001C401BC91C8.9 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %16 = add i64 %self_000001C401BC91C8.9, 0
  %17 = inttoptr i64 %16 to %struct.AVLNode_st**
  %R135 = load %struct.AVLNode_st*, %struct.AVLNode_st** %17
  %R13510 = ptrtoint %struct.AVLNode_st* %R135 to i64
  %18 = add i64 %R13510, 0
  %19 = inttoptr i64 %18 to %struct.AVLNode_st**
  %R136 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  %R13611 = ptrtoint %struct.AVLNode_st* %R136 to i64
  %20 = add i64 %R13611, 8
  %21 = inttoptr i64 %20 to %struct.AVLNode_st**
  %R137 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  %22 = ptrtoint %struct.AVLNode_st* %R134 to i64
  %23 = ptrtoint %struct.AVLNode_st* %R137 to i64
  %R138 = icmp eq i64 %22, %23
  %R13812 = zext i1 %R138 to i32
  %cond13 = icmp ne i32 %R13812, 0
  br i1 %cond13, label %L41, label %L42

L41:                                              ; preds = %L40
  %self_000001C401BC91C8.14 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %24 = add i64 %self_000001C401BC91C8.14, 0
  %25 = inttoptr i64 %24 to %struct.AVLNode_st**
  %R139 = load %struct.AVLNode_st*, %struct.AVLNode_st** %25
  %R13915 = ptrtoint %struct.AVLNode_st* %R139 to i64
  %26 = add i64 %R13915, 0
  %27 = inttoptr i64 %26 to %struct.AVLNode_st**
  %R140 = load %struct.AVLNode_st*, %struct.AVLNode_st** %27
  %newroot_000001C401BC9468.16 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC9468. to i64
  %28 = add i64 %newroot_000001C401BC9468.16, 0
  %29 = inttoptr i64 %28 to %struct.AVLNode_st**
  %R141 = load %struct.AVLNode_st*, %struct.AVLNode_st** %29
  call void @AVL_SetLeft(%struct.AVLNode_st* %R140, %struct.AVLNode_st* %R141)
  br label %L43

L42:                                              ; preds = %L40
  %self_000001C401BC91C8.17 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %30 = add i64 %self_000001C401BC91C8.17, 0
  %31 = inttoptr i64 %30 to %struct.AVLNode_st**
  %R142 = load %struct.AVLNode_st*, %struct.AVLNode_st** %31
  %R14218 = ptrtoint %struct.AVLNode_st* %R142 to i64
  %32 = add i64 %R14218, 0
  %33 = inttoptr i64 %32 to %struct.AVLNode_st**
  %R143 = load %struct.AVLNode_st*, %struct.AVLNode_st** %33
  %newroot_000001C401BC9468.19 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC9468. to i64
  %34 = add i64 %newroot_000001C401BC9468.19, 0
  %35 = inttoptr i64 %34 to %struct.AVLNode_st**
  %R144 = load %struct.AVLNode_st*, %struct.AVLNode_st** %35
  call void @AVL_SetRight(%struct.AVLNode_st* %R143, %struct.AVLNode_st* %R144)
  br label %L43

L43:                                              ; preds = %L42, %L41
  br label %L45

L44:                                              ; preds = %L39
  %newroot_000001C401BC9468.20 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC9468. to i64
  %36 = add i64 %newroot_000001C401BC9468.20, 0
  %37 = inttoptr i64 %36 to %struct.AVLNode_st**
  %R145 = load %struct.AVLNode_st*, %struct.AVLNode_st** %37
  %R14521 = ptrtoint %struct.AVLNode_st* %R145 to i64
  %38 = add i64 %R14521, 0
  %39 = inttoptr i64 %38 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %39
  br label %L45

L45:                                              ; preds = %L44, %L43
  %self_000001C401BC91C8.22 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %40 = add i64 %self_000001C401BC91C8.22, 0
  %41 = inttoptr i64 %40 to %struct.AVLNode_st**
  %R146 = load %struct.AVLNode_st*, %struct.AVLNode_st** %41
  %newroot_000001C401BC9468.23 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC9468. to i64
  %42 = add i64 %newroot_000001C401BC9468.23, 0
  %43 = inttoptr i64 %42 to %struct.AVLNode_st**
  %R147 = load %struct.AVLNode_st*, %struct.AVLNode_st** %43
  %R14724 = ptrtoint %struct.AVLNode_st* %R147 to i64
  %44 = add i64 %R14724, 16
  %45 = inttoptr i64 %44 to %struct.AVLNode_st**
  %R148 = load %struct.AVLNode_st*, %struct.AVLNode_st** %45
  call void @AVL_SetLeft(%struct.AVLNode_st* %R146, %struct.AVLNode_st* %R148)
  %newroot_000001C401BC9468.25 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC9468. to i64
  %46 = add i64 %newroot_000001C401BC9468.25, 0
  %47 = inttoptr i64 %46 to %struct.AVLNode_st**
  %R149 = load %struct.AVLNode_st*, %struct.AVLNode_st** %47
  %self_000001C401BC91C8.26 = ptrtoint %struct.AVLNode_st** %self_000001C401BC91C8. to i64
  %48 = add i64 %self_000001C401BC91C8.26, 0
  %49 = inttoptr i64 %48 to %struct.AVLNode_st**
  %R150 = load %struct.AVLNode_st*, %struct.AVLNode_st** %49
  call void @AVL_SetRight(%struct.AVLNode_st* %R149, %struct.AVLNode_st* %R150)
  %newroot_000001C401BC9468.27 = ptrtoint %struct.AVLNode_st** %newroot_000001C401BC9468. to i64
  %50 = add i64 %newroot_000001C401BC9468.27, 0
  %51 = inttoptr i64 %50 to %struct.AVLNode_st**
  %R151 = load %struct.AVLNode_st*, %struct.AVLNode_st** %51
  store %struct.AVLNode_st* %R151, %struct.AVLNode_st** %0
  br label %L46

L46:                                              ; preds = %L45
  %52 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R151
}

define %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %ARG1) {
L47:
  %root_000001C401BCA268. = alloca %struct.AVLNode_st*
  %rt_000001C401BCA0A8. = alloca %struct.AVLNode_st*
  %lf_000001C401BC9EE8. = alloca %struct.AVLNode_st*
  %self_000001C401BC9C48. = alloca %struct.AVLNode_st*
  %0 = alloca %struct.AVLNode_st*
  %self_000001C401BC9C48.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BC9C48. to i64
  %1 = add i64 %self_000001C401BC9C48.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %self_000001C401BC9C48.2 = ptrtoint %struct.AVLNode_st** %self_000001C401BC9C48. to i64
  %3 = add i64 %self_000001C401BC9C48.2, 0
  %4 = inttoptr i64 %3 to %struct.AVLNode_st**
  %R153 = load %struct.AVLNode_st*, %struct.AVLNode_st** %4
  %R1533 = ptrtoint %struct.AVLNode_st* %R153 to i64
  %5 = add i64 %R1533, 8
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %R154 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %lf_000001C401BC9EE8.4 = ptrtoint %struct.AVLNode_st** %lf_000001C401BC9EE8. to i64
  %7 = add i64 %lf_000001C401BC9EE8.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R154, %struct.AVLNode_st** %8
  %lf_000001C401BC9EE8.5 = ptrtoint %struct.AVLNode_st** %lf_000001C401BC9EE8. to i64
  %9 = add i64 %lf_000001C401BC9EE8.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R155 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %R1556 = ptrtoint %struct.AVLNode_st* %R155 to i64
  %11 = add i64 %R1556, 16
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  %R156 = load %struct.AVLNode_st*, %struct.AVLNode_st** %12
  %rt_000001C401BCA0A8.7 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCA0A8. to i64
  %13 = add i64 %rt_000001C401BCA0A8.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R156, %struct.AVLNode_st** %14
  %rt_000001C401BCA0A8.8 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCA0A8. to i64
  %15 = add i64 %rt_000001C401BCA0A8.8, 0
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %R157 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  %R1579 = ptrtoint %struct.AVLNode_st* %R157 to i64
  %17 = add i64 %R1579, 24
  %18 = inttoptr i64 %17 to i32*
  %R158 = load i32, i32* %18
  switch i32 %R158, label %L51 [
    i32 0, label %L49
    i32 1, label %L50
    i32 2, label %L48
  ]

L48:                                              ; preds = %L47
  %self_000001C401BC9C48.10 = ptrtoint %struct.AVLNode_st** %self_000001C401BC9C48. to i64
  %19 = add i64 %self_000001C401BC9C48.10, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R159 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %R15911 = ptrtoint %struct.AVLNode_st* %R159 to i64
  %21 = add i64 %R15911, 24
  %22 = inttoptr i64 %21 to i32*
  store i32 0, i32* %22
  %lf_000001C401BC9EE8.12 = ptrtoint %struct.AVLNode_st** %lf_000001C401BC9EE8. to i64
  %23 = add i64 %lf_000001C401BC9EE8.12, 0
  %24 = inttoptr i64 %23 to %struct.AVLNode_st**
  %R160 = load %struct.AVLNode_st*, %struct.AVLNode_st** %24
  %R16013 = ptrtoint %struct.AVLNode_st* %R160 to i64
  %25 = add i64 %R16013, 24
  %26 = inttoptr i64 %25 to i32*
  store i32 1, i32* %26
  br label %L51

L49:                                              ; preds = %L47
  %lf_000001C401BC9EE8.14 = ptrtoint %struct.AVLNode_st** %lf_000001C401BC9EE8. to i64
  %27 = add i64 %lf_000001C401BC9EE8.14, 0
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R161 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %R16115 = ptrtoint %struct.AVLNode_st* %R161 to i64
  %29 = add i64 %R16115, 24
  %30 = inttoptr i64 %29 to i32*
  store i32 0, i32* %30
  %self_000001C401BC9C48.16 = ptrtoint %struct.AVLNode_st** %self_000001C401BC9C48. to i64
  %31 = add i64 %self_000001C401BC9C48.16, 0
  %32 = inttoptr i64 %31 to %struct.AVLNode_st**
  %R162 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  %R16217 = ptrtoint %struct.AVLNode_st* %R162 to i64
  %33 = add i64 %R16217, 24
  %34 = inttoptr i64 %33 to i32*
  store i32 0, i32* %34
  br label %L51

L50:                                              ; preds = %L47
  %self_000001C401BC9C48.18 = ptrtoint %struct.AVLNode_st** %self_000001C401BC9C48. to i64
  %35 = add i64 %self_000001C401BC9C48.18, 0
  %36 = inttoptr i64 %35 to %struct.AVLNode_st**
  %R163 = load %struct.AVLNode_st*, %struct.AVLNode_st** %36
  %R16319 = ptrtoint %struct.AVLNode_st* %R163 to i64
  %37 = add i64 %R16319, 24
  %38 = inttoptr i64 %37 to i32*
  store i32 2, i32* %38
  %lf_000001C401BC9EE8.20 = ptrtoint %struct.AVLNode_st** %lf_000001C401BC9EE8. to i64
  %39 = add i64 %lf_000001C401BC9EE8.20, 0
  %40 = inttoptr i64 %39 to %struct.AVLNode_st**
  %R164 = load %struct.AVLNode_st*, %struct.AVLNode_st** %40
  %R16421 = ptrtoint %struct.AVLNode_st* %R164 to i64
  %41 = add i64 %R16421, 24
  %42 = inttoptr i64 %41 to i32*
  store i32 0, i32* %42
  br label %L51

L51:                                              ; preds = %L50, %L49, %L48, %L47
  %rt_000001C401BCA0A8.22 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCA0A8. to i64
  %43 = add i64 %rt_000001C401BCA0A8.22, 0
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  %R165 = load %struct.AVLNode_st*, %struct.AVLNode_st** %44
  %R16523 = ptrtoint %struct.AVLNode_st* %R165 to i64
  %45 = add i64 %R16523, 24
  %46 = inttoptr i64 %45 to i32*
  store i32 0, i32* %46
  %self_000001C401BC9C48.24 = ptrtoint %struct.AVLNode_st** %self_000001C401BC9C48. to i64
  %47 = add i64 %self_000001C401BC9C48.24, 0
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %R166 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %lf_000001C401BC9EE8.25 = ptrtoint %struct.AVLNode_st** %lf_000001C401BC9EE8. to i64
  %49 = add i64 %lf_000001C401BC9EE8.25, 0
  %50 = inttoptr i64 %49 to %struct.AVLNode_st**
  %R167 = load %struct.AVLNode_st*, %struct.AVLNode_st** %50
  %R168 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %R167)
  call void @AVL_SetLeft(%struct.AVLNode_st* %R166, %struct.AVLNode_st* %R168)
  %self_000001C401BC9C48.26 = ptrtoint %struct.AVLNode_st** %self_000001C401BC9C48. to i64
  %51 = add i64 %self_000001C401BC9C48.26, 0
  %52 = inttoptr i64 %51 to %struct.AVLNode_st**
  %R169 = load %struct.AVLNode_st*, %struct.AVLNode_st** %52
  %R170 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %R169)
  %root_000001C401BCA268.27 = ptrtoint %struct.AVLNode_st** %root_000001C401BCA268. to i64
  %53 = add i64 %root_000001C401BCA268.27, 0
  %54 = inttoptr i64 %53 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R170, %struct.AVLNode_st** %54
  %root_000001C401BCA268.28 = ptrtoint %struct.AVLNode_st** %root_000001C401BCA268. to i64
  %55 = add i64 %root_000001C401BCA268.28, 0
  %56 = inttoptr i64 %55 to %struct.AVLNode_st**
  %R171 = load %struct.AVLNode_st*, %struct.AVLNode_st** %56
  store %struct.AVLNode_st* %R171, %struct.AVLNode_st** %0
  br label %L52

L52:                                              ; preds = %L51
  %57 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R171
}

define %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %ARG1) {
L53:
  %root_000001C401BCB148. = alloca %struct.AVLNode_st*
  %lf_000001C401BCAF88. = alloca %struct.AVLNode_st*
  %rt_000001C401BCADC8. = alloca %struct.AVLNode_st*
  %self_000001C401BCAB28. = alloca %struct.AVLNode_st*
  %0 = alloca %struct.AVLNode_st*
  %self_000001C401BCAB28.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BCAB28. to i64
  %1 = add i64 %self_000001C401BCAB28.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %self_000001C401BCAB28.2 = ptrtoint %struct.AVLNode_st** %self_000001C401BCAB28. to i64
  %3 = add i64 %self_000001C401BCAB28.2, 0
  %4 = inttoptr i64 %3 to %struct.AVLNode_st**
  %R173 = load %struct.AVLNode_st*, %struct.AVLNode_st** %4
  %R1733 = ptrtoint %struct.AVLNode_st* %R173 to i64
  %5 = add i64 %R1733, 16
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %R174 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %rt_000001C401BCADC8.4 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCADC8. to i64
  %7 = add i64 %rt_000001C401BCADC8.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R174, %struct.AVLNode_st** %8
  %rt_000001C401BCADC8.5 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCADC8. to i64
  %9 = add i64 %rt_000001C401BCADC8.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R175 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %R1756 = ptrtoint %struct.AVLNode_st* %R175 to i64
  %11 = add i64 %R1756, 8
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  %R176 = load %struct.AVLNode_st*, %struct.AVLNode_st** %12
  %lf_000001C401BCAF88.7 = ptrtoint %struct.AVLNode_st** %lf_000001C401BCAF88. to i64
  %13 = add i64 %lf_000001C401BCAF88.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R176, %struct.AVLNode_st** %14
  %lf_000001C401BCAF88.8 = ptrtoint %struct.AVLNode_st** %lf_000001C401BCAF88. to i64
  %15 = add i64 %lf_000001C401BCAF88.8, 0
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %R177 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  %R1779 = ptrtoint %struct.AVLNode_st* %R177 to i64
  %17 = add i64 %R1779, 24
  %18 = inttoptr i64 %17 to i32*
  %R178 = load i32, i32* %18
  switch i32 %R178, label %L57 [
    i32 0, label %L55
    i32 1, label %L56
    i32 2, label %L54
  ]

L54:                                              ; preds = %L53
  %self_000001C401BCAB28.10 = ptrtoint %struct.AVLNode_st** %self_000001C401BCAB28. to i64
  %19 = add i64 %self_000001C401BCAB28.10, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R179 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %R17911 = ptrtoint %struct.AVLNode_st* %R179 to i64
  %21 = add i64 %R17911, 24
  %22 = inttoptr i64 %21 to i32*
  store i32 1, i32* %22
  %rt_000001C401BCADC8.12 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCADC8. to i64
  %23 = add i64 %rt_000001C401BCADC8.12, 0
  %24 = inttoptr i64 %23 to %struct.AVLNode_st**
  %R180 = load %struct.AVLNode_st*, %struct.AVLNode_st** %24
  %R18013 = ptrtoint %struct.AVLNode_st* %R180 to i64
  %25 = add i64 %R18013, 24
  %26 = inttoptr i64 %25 to i32*
  store i32 0, i32* %26
  br label %L57

L55:                                              ; preds = %L53
  %rt_000001C401BCADC8.14 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCADC8. to i64
  %27 = add i64 %rt_000001C401BCADC8.14, 0
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R181 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %R18115 = ptrtoint %struct.AVLNode_st* %R181 to i64
  %29 = add i64 %R18115, 24
  %30 = inttoptr i64 %29 to i32*
  store i32 0, i32* %30
  %self_000001C401BCAB28.16 = ptrtoint %struct.AVLNode_st** %self_000001C401BCAB28. to i64
  %31 = add i64 %self_000001C401BCAB28.16, 0
  %32 = inttoptr i64 %31 to %struct.AVLNode_st**
  %R182 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  %R18217 = ptrtoint %struct.AVLNode_st* %R182 to i64
  %33 = add i64 %R18217, 24
  %34 = inttoptr i64 %33 to i32*
  store i32 0, i32* %34
  br label %L57

L56:                                              ; preds = %L53
  %self_000001C401BCAB28.18 = ptrtoint %struct.AVLNode_st** %self_000001C401BCAB28. to i64
  %35 = add i64 %self_000001C401BCAB28.18, 0
  %36 = inttoptr i64 %35 to %struct.AVLNode_st**
  %R183 = load %struct.AVLNode_st*, %struct.AVLNode_st** %36
  %R18319 = ptrtoint %struct.AVLNode_st* %R183 to i64
  %37 = add i64 %R18319, 24
  %38 = inttoptr i64 %37 to i32*
  store i32 0, i32* %38
  %rt_000001C401BCADC8.20 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCADC8. to i64
  %39 = add i64 %rt_000001C401BCADC8.20, 0
  %40 = inttoptr i64 %39 to %struct.AVLNode_st**
  %R184 = load %struct.AVLNode_st*, %struct.AVLNode_st** %40
  %R18421 = ptrtoint %struct.AVLNode_st* %R184 to i64
  %41 = add i64 %R18421, 24
  %42 = inttoptr i64 %41 to i32*
  store i32 2, i32* %42
  br label %L57

L57:                                              ; preds = %L56, %L55, %L54, %L53
  %lf_000001C401BCAF88.22 = ptrtoint %struct.AVLNode_st** %lf_000001C401BCAF88. to i64
  %43 = add i64 %lf_000001C401BCAF88.22, 0
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  %R185 = load %struct.AVLNode_st*, %struct.AVLNode_st** %44
  %R18523 = ptrtoint %struct.AVLNode_st* %R185 to i64
  %45 = add i64 %R18523, 24
  %46 = inttoptr i64 %45 to i32*
  store i32 0, i32* %46
  %self_000001C401BCAB28.24 = ptrtoint %struct.AVLNode_st** %self_000001C401BCAB28. to i64
  %47 = add i64 %self_000001C401BCAB28.24, 0
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %R186 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %rt_000001C401BCADC8.25 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCADC8. to i64
  %49 = add i64 %rt_000001C401BCADC8.25, 0
  %50 = inttoptr i64 %49 to %struct.AVLNode_st**
  %R187 = load %struct.AVLNode_st*, %struct.AVLNode_st** %50
  %R188 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %R187)
  call void @AVL_SetRight(%struct.AVLNode_st* %R186, %struct.AVLNode_st* %R188)
  %self_000001C401BCAB28.26 = ptrtoint %struct.AVLNode_st** %self_000001C401BCAB28. to i64
  %51 = add i64 %self_000001C401BCAB28.26, 0
  %52 = inttoptr i64 %51 to %struct.AVLNode_st**
  %R189 = load %struct.AVLNode_st*, %struct.AVLNode_st** %52
  %R190 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %R189)
  %root_000001C401BCB148.27 = ptrtoint %struct.AVLNode_st** %root_000001C401BCB148. to i64
  %53 = add i64 %root_000001C401BCB148.27, 0
  %54 = inttoptr i64 %53 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R190, %struct.AVLNode_st** %54
  %root_000001C401BCB148.28 = ptrtoint %struct.AVLNode_st** %root_000001C401BCB148. to i64
  %55 = add i64 %root_000001C401BCB148.28, 0
  %56 = inttoptr i64 %55 to %struct.AVLNode_st**
  %R191 = load %struct.AVLNode_st*, %struct.AVLNode_st** %56
  store %struct.AVLNode_st* %R191, %struct.AVLNode_st** %0
  br label %L58

L58:                                              ; preds = %L57
  %57 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R191
}

define %struct.AVLNode_st* @AVL_RebalanceHeavierLeft(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L59:
  %lf_000001C401BCC488. = alloca %struct.AVLNode_st*
  %root_000001C401BCBE68. = alloca %struct.AVLNode_st*
  %height_changed_000001C401BCBBC8. = alloca i32*
  %self_000001C401BCBA08. = alloca %struct.AVLNode_st*
  %0 = alloca %struct.AVLNode_st*
  %self_000001C401BCBA08.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BCBA08. to i64
  %1 = add i64 %self_000001C401BCBA08.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %height_changed_000001C401BCBBC8.2 = ptrtoint i32** %height_changed_000001C401BCBBC8. to i64
  %3 = add i64 %height_changed_000001C401BCBBC8.2, 0
  %4 = inttoptr i64 %3 to i32**
  store i32* %ARG2, i32** %4
  %self_000001C401BCBA08.3 = ptrtoint %struct.AVLNode_st** %self_000001C401BCBA08. to i64
  %5 = add i64 %self_000001C401BCBA08.3, 0
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %R193 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %root_000001C401BCBE68.4 = ptrtoint %struct.AVLNode_st** %root_000001C401BCBE68. to i64
  %7 = add i64 %root_000001C401BCBE68.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R193, %struct.AVLNode_st** %8
  %root_000001C401BCBE68.5 = ptrtoint %struct.AVLNode_st** %root_000001C401BCBE68. to i64
  %9 = add i64 %root_000001C401BCBE68.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R194 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %R1946 = ptrtoint %struct.AVLNode_st* %R194 to i64
  %11 = add i64 %R1946, 24
  %12 = inttoptr i64 %11 to i32*
  %R195 = load i32, i32* %12
  switch i32 %R195, label %L66 [
    i32 0, label %L61
    i32 1, label %L62
    i32 2, label %L60
  ]

L60:                                              ; preds = %L59
  %root_000001C401BCBE68.7 = ptrtoint %struct.AVLNode_st** %root_000001C401BCBE68. to i64
  %13 = add i64 %root_000001C401BCBE68.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  %R196 = load %struct.AVLNode_st*, %struct.AVLNode_st** %14
  %R1968 = ptrtoint %struct.AVLNode_st* %R196 to i64
  %15 = add i64 %R1968, 24
  %16 = inttoptr i64 %15 to i32*
  store i32 0, i32* %16
  %height_changed_000001C401BCBBC8.9 = ptrtoint i32** %height_changed_000001C401BCBBC8. to i64
  %17 = add i64 %height_changed_000001C401BCBBC8.9, 0
  %18 = inttoptr i64 %17 to i32**
  %R197 = load i32*, i32** %18
  %R19710 = ptrtoint i32* %R197 to i64
  %19 = add i64 %R19710, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 0, i32* %20
  br label %L66

L61:                                              ; preds = %L59
  %root_000001C401BCBE68.11 = ptrtoint %struct.AVLNode_st** %root_000001C401BCBE68. to i64
  %21 = add i64 %root_000001C401BCBE68.11, 0
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %R198 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %R19812 = ptrtoint %struct.AVLNode_st* %R198 to i64
  %23 = add i64 %R19812, 24
  %24 = inttoptr i64 %23 to i32*
  store i32 1, i32* %24
  br label %L66

L62:                                              ; preds = %L59
  %self_000001C401BCBA08.13 = ptrtoint %struct.AVLNode_st** %self_000001C401BCBA08. to i64
  %25 = add i64 %self_000001C401BCBA08.13, 0
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %R199 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  %R19914 = ptrtoint %struct.AVLNode_st* %R199 to i64
  %27 = add i64 %R19914, 8
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R200 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %lf_000001C401BCC488.15 = ptrtoint %struct.AVLNode_st** %lf_000001C401BCC488. to i64
  %29 = add i64 %lf_000001C401BCC488.15, 0
  %30 = inttoptr i64 %29 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R200, %struct.AVLNode_st** %30
  %lf_000001C401BCC488.16 = ptrtoint %struct.AVLNode_st** %lf_000001C401BCC488. to i64
  %31 = add i64 %lf_000001C401BCC488.16, 0
  %32 = inttoptr i64 %31 to %struct.AVLNode_st**
  %R201 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  %R20117 = ptrtoint %struct.AVLNode_st* %R201 to i64
  %33 = add i64 %R20117, 24
  %34 = inttoptr i64 %33 to i32*
  %R202 = load i32, i32* %34
  switch i32 %R202, label %L65 [
    i32 1, label %L63
    i32 2, label %L64
  ]

L63:                                              ; preds = %L62
  %self_000001C401BCBA08.18 = ptrtoint %struct.AVLNode_st** %self_000001C401BCBA08. to i64
  %35 = add i64 %self_000001C401BCBA08.18, 0
  %36 = inttoptr i64 %35 to %struct.AVLNode_st**
  %R203 = load %struct.AVLNode_st*, %struct.AVLNode_st** %36
  %R20319 = ptrtoint %struct.AVLNode_st* %R203 to i64
  %37 = add i64 %R20319, 24
  %38 = inttoptr i64 %37 to i32*
  store i32 0, i32* %38
  %lf_000001C401BCC488.20 = ptrtoint %struct.AVLNode_st** %lf_000001C401BCC488. to i64
  %39 = add i64 %lf_000001C401BCC488.20, 0
  %40 = inttoptr i64 %39 to %struct.AVLNode_st**
  %R204 = load %struct.AVLNode_st*, %struct.AVLNode_st** %40
  %R20421 = ptrtoint %struct.AVLNode_st* %R204 to i64
  %41 = add i64 %R20421, 24
  %42 = inttoptr i64 %41 to i32*
  store i32 0, i32* %42
  %self_000001C401BCBA08.22 = ptrtoint %struct.AVLNode_st** %self_000001C401BCBA08. to i64
  %43 = add i64 %self_000001C401BCBA08.22, 0
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  %R205 = load %struct.AVLNode_st*, %struct.AVLNode_st** %44
  %R206 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %R205)
  %root_000001C401BCBE68.23 = ptrtoint %struct.AVLNode_st** %root_000001C401BCBE68. to i64
  %45 = add i64 %root_000001C401BCBE68.23, 0
  %46 = inttoptr i64 %45 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R206, %struct.AVLNode_st** %46
  br label %L65

L64:                                              ; preds = %L62
  %self_000001C401BCBA08.24 = ptrtoint %struct.AVLNode_st** %self_000001C401BCBA08. to i64
  %47 = add i64 %self_000001C401BCBA08.24, 0
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %R207 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %R208 = call %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %R207)
  %root_000001C401BCBE68.25 = ptrtoint %struct.AVLNode_st** %root_000001C401BCBE68. to i64
  %49 = add i64 %root_000001C401BCBE68.25, 0
  %50 = inttoptr i64 %49 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R208, %struct.AVLNode_st** %50
  br label %L65

L65:                                              ; preds = %L64, %L63, %L62
  %height_changed_000001C401BCBBC8.26 = ptrtoint i32** %height_changed_000001C401BCBBC8. to i64
  %51 = add i64 %height_changed_000001C401BCBBC8.26, 0
  %52 = inttoptr i64 %51 to i32**
  %R209 = load i32*, i32** %52
  %R20927 = ptrtoint i32* %R209 to i64
  %53 = add i64 %R20927, 0
  %54 = inttoptr i64 %53 to i32*
  store i32 0, i32* %54
  br label %L66

L66:                                              ; preds = %L65, %L61, %L60, %L59
  %root_000001C401BCBE68.28 = ptrtoint %struct.AVLNode_st** %root_000001C401BCBE68. to i64
  %55 = add i64 %root_000001C401BCBE68.28, 0
  %56 = inttoptr i64 %55 to %struct.AVLNode_st**
  %R210 = load %struct.AVLNode_st*, %struct.AVLNode_st** %56
  store %struct.AVLNode_st* %R210, %struct.AVLNode_st** %0
  br label %L67

L67:                                              ; preds = %L66
  %57 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R210
}

define %struct.AVLNode_st* @AVL_RebalanceHeavierRight(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L68:
  %rt_000001C401BCD6E8. = alloca %struct.AVLNode_st*
  %root_000001C401BCD0C8. = alloca %struct.AVLNode_st*
  %height_changed_000001C401BCCE28. = alloca i32*
  %self_000001C401BCCC68. = alloca %struct.AVLNode_st*
  %0 = alloca %struct.AVLNode_st*
  %self_000001C401BCCC68.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BCCC68. to i64
  %1 = add i64 %self_000001C401BCCC68.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %height_changed_000001C401BCCE28.2 = ptrtoint i32** %height_changed_000001C401BCCE28. to i64
  %3 = add i64 %height_changed_000001C401BCCE28.2, 0
  %4 = inttoptr i64 %3 to i32**
  store i32* %ARG2, i32** %4
  %self_000001C401BCCC68.3 = ptrtoint %struct.AVLNode_st** %self_000001C401BCCC68. to i64
  %5 = add i64 %self_000001C401BCCC68.3, 0
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %R212 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %root_000001C401BCD0C8.4 = ptrtoint %struct.AVLNode_st** %root_000001C401BCD0C8. to i64
  %7 = add i64 %root_000001C401BCD0C8.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R212, %struct.AVLNode_st** %8
  %root_000001C401BCD0C8.5 = ptrtoint %struct.AVLNode_st** %root_000001C401BCD0C8. to i64
  %9 = add i64 %root_000001C401BCD0C8.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R213 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %R2136 = ptrtoint %struct.AVLNode_st* %R213 to i64
  %11 = add i64 %R2136, 24
  %12 = inttoptr i64 %11 to i32*
  %R214 = load i32, i32* %12
  switch i32 %R214, label %L75 [
    i32 0, label %L70
    i32 1, label %L69
    i32 2, label %L71
  ]

L69:                                              ; preds = %L68
  %root_000001C401BCD0C8.7 = ptrtoint %struct.AVLNode_st** %root_000001C401BCD0C8. to i64
  %13 = add i64 %root_000001C401BCD0C8.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  %R215 = load %struct.AVLNode_st*, %struct.AVLNode_st** %14
  %R2158 = ptrtoint %struct.AVLNode_st* %R215 to i64
  %15 = add i64 %R2158, 24
  %16 = inttoptr i64 %15 to i32*
  store i32 0, i32* %16
  %height_changed_000001C401BCCE28.9 = ptrtoint i32** %height_changed_000001C401BCCE28. to i64
  %17 = add i64 %height_changed_000001C401BCCE28.9, 0
  %18 = inttoptr i64 %17 to i32**
  %R216 = load i32*, i32** %18
  %R21610 = ptrtoint i32* %R216 to i64
  %19 = add i64 %R21610, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 0, i32* %20
  br label %L75

L70:                                              ; preds = %L68
  %root_000001C401BCD0C8.11 = ptrtoint %struct.AVLNode_st** %root_000001C401BCD0C8. to i64
  %21 = add i64 %root_000001C401BCD0C8.11, 0
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %R217 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %R21712 = ptrtoint %struct.AVLNode_st* %R217 to i64
  %23 = add i64 %R21712, 24
  %24 = inttoptr i64 %23 to i32*
  store i32 2, i32* %24
  br label %L75

L71:                                              ; preds = %L68
  %self_000001C401BCCC68.13 = ptrtoint %struct.AVLNode_st** %self_000001C401BCCC68. to i64
  %25 = add i64 %self_000001C401BCCC68.13, 0
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %R218 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  %R21814 = ptrtoint %struct.AVLNode_st* %R218 to i64
  %27 = add i64 %R21814, 16
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R219 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %rt_000001C401BCD6E8.15 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCD6E8. to i64
  %29 = add i64 %rt_000001C401BCD6E8.15, 0
  %30 = inttoptr i64 %29 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R219, %struct.AVLNode_st** %30
  %rt_000001C401BCD6E8.16 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCD6E8. to i64
  %31 = add i64 %rt_000001C401BCD6E8.16, 0
  %32 = inttoptr i64 %31 to %struct.AVLNode_st**
  %R220 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  %R22017 = ptrtoint %struct.AVLNode_st* %R220 to i64
  %33 = add i64 %R22017, 24
  %34 = inttoptr i64 %33 to i32*
  %R221 = load i32, i32* %34
  switch i32 %R221, label %L74 [
    i32 1, label %L73
    i32 2, label %L72
  ]

L72:                                              ; preds = %L71
  %self_000001C401BCCC68.18 = ptrtoint %struct.AVLNode_st** %self_000001C401BCCC68. to i64
  %35 = add i64 %self_000001C401BCCC68.18, 0
  %36 = inttoptr i64 %35 to %struct.AVLNode_st**
  %R222 = load %struct.AVLNode_st*, %struct.AVLNode_st** %36
  %R22219 = ptrtoint %struct.AVLNode_st* %R222 to i64
  %37 = add i64 %R22219, 24
  %38 = inttoptr i64 %37 to i32*
  store i32 0, i32* %38
  %rt_000001C401BCD6E8.20 = ptrtoint %struct.AVLNode_st** %rt_000001C401BCD6E8. to i64
  %39 = add i64 %rt_000001C401BCD6E8.20, 0
  %40 = inttoptr i64 %39 to %struct.AVLNode_st**
  %R223 = load %struct.AVLNode_st*, %struct.AVLNode_st** %40
  %R22321 = ptrtoint %struct.AVLNode_st* %R223 to i64
  %41 = add i64 %R22321, 24
  %42 = inttoptr i64 %41 to i32*
  store i32 0, i32* %42
  %self_000001C401BCCC68.22 = ptrtoint %struct.AVLNode_st** %self_000001C401BCCC68. to i64
  %43 = add i64 %self_000001C401BCCC68.22, 0
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  %R224 = load %struct.AVLNode_st*, %struct.AVLNode_st** %44
  %R225 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %R224)
  %root_000001C401BCD0C8.23 = ptrtoint %struct.AVLNode_st** %root_000001C401BCD0C8. to i64
  %45 = add i64 %root_000001C401BCD0C8.23, 0
  %46 = inttoptr i64 %45 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R225, %struct.AVLNode_st** %46
  br label %L74

L73:                                              ; preds = %L71
  %self_000001C401BCCC68.24 = ptrtoint %struct.AVLNode_st** %self_000001C401BCCC68. to i64
  %47 = add i64 %self_000001C401BCCC68.24, 0
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %R226 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %R227 = call %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %R226)
  %root_000001C401BCD0C8.25 = ptrtoint %struct.AVLNode_st** %root_000001C401BCD0C8. to i64
  %49 = add i64 %root_000001C401BCD0C8.25, 0
  %50 = inttoptr i64 %49 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R227, %struct.AVLNode_st** %50
  br label %L74

L74:                                              ; preds = %L73, %L72, %L71
  %height_changed_000001C401BCCE28.26 = ptrtoint i32** %height_changed_000001C401BCCE28. to i64
  %51 = add i64 %height_changed_000001C401BCCE28.26, 0
  %52 = inttoptr i64 %51 to i32**
  %R228 = load i32*, i32** %52
  %R22827 = ptrtoint i32* %R228 to i64
  %53 = add i64 %R22827, 0
  %54 = inttoptr i64 %53 to i32*
  store i32 0, i32* %54
  br label %L75

L75:                                              ; preds = %L74, %L70, %L69, %L68
  %root_000001C401BCD0C8.28 = ptrtoint %struct.AVLNode_st** %root_000001C401BCD0C8. to i64
  %55 = add i64 %root_000001C401BCD0C8.28, 0
  %56 = inttoptr i64 %55 to %struct.AVLNode_st**
  %R229 = load %struct.AVLNode_st*, %struct.AVLNode_st** %56
  store %struct.AVLNode_st* %R229, %struct.AVLNode_st** %0
  br label %L76

L76:                                              ; preds = %L75
  %57 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R229
}

define %struct.AVLNode_st* @AVL_RebalanceShorterLeft(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L77:
  %q_000001C401BCE948. = alloca %struct.AVLNode_st*
  %p_000001C401BCE328. = alloca %struct.AVLNode_st*
  %height_changed_000001C401BCE088. = alloca i32*
  %self_000001C401BCDEC8. = alloca %struct.AVLNode_st*
  %0 = alloca %struct.AVLNode_st*
  %self_000001C401BCDEC8.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BCDEC8. to i64
  %1 = add i64 %self_000001C401BCDEC8.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %height_changed_000001C401BCE088.2 = ptrtoint i32** %height_changed_000001C401BCE088. to i64
  %3 = add i64 %height_changed_000001C401BCE088.2, 0
  %4 = inttoptr i64 %3 to i32**
  store i32* %ARG2, i32** %4
  %self_000001C401BCDEC8.3 = ptrtoint %struct.AVLNode_st** %self_000001C401BCDEC8. to i64
  %5 = add i64 %self_000001C401BCDEC8.3, 0
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %R231 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %p_000001C401BCE328.4 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %7 = add i64 %p_000001C401BCE328.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R231, %struct.AVLNode_st** %8
  %p_000001C401BCE328.5 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %9 = add i64 %p_000001C401BCE328.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R232 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %R2326 = ptrtoint %struct.AVLNode_st* %R232 to i64
  %11 = add i64 %R2326, 24
  %12 = inttoptr i64 %11 to i32*
  %R233 = load i32, i32* %12
  switch i32 %R233, label %L85 [
    i32 0, label %L78
    i32 1, label %L79
    i32 2, label %L80
  ]

L78:                                              ; preds = %L77
  %p_000001C401BCE328.7 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %13 = add i64 %p_000001C401BCE328.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  %R234 = load %struct.AVLNode_st*, %struct.AVLNode_st** %14
  %R2348 = ptrtoint %struct.AVLNode_st* %R234 to i64
  %15 = add i64 %R2348, 24
  %16 = inttoptr i64 %15 to i32*
  store i32 2, i32* %16
  %height_changed_000001C401BCE088.9 = ptrtoint i32** %height_changed_000001C401BCE088. to i64
  %17 = add i64 %height_changed_000001C401BCE088.9, 0
  %18 = inttoptr i64 %17 to i32**
  %R235 = load i32*, i32** %18
  %R23510 = ptrtoint i32* %R235 to i64
  %19 = add i64 %R23510, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 0, i32* %20
  br label %L85

L79:                                              ; preds = %L77
  %p_000001C401BCE328.11 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %21 = add i64 %p_000001C401BCE328.11, 0
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %R236 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %R23612 = ptrtoint %struct.AVLNode_st* %R236 to i64
  %23 = add i64 %R23612, 24
  %24 = inttoptr i64 %23 to i32*
  store i32 0, i32* %24
  br label %L85

L80:                                              ; preds = %L77
  %p_000001C401BCE328.13 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %25 = add i64 %p_000001C401BCE328.13, 0
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %R237 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  %R23714 = ptrtoint %struct.AVLNode_st* %R237 to i64
  %27 = add i64 %R23714, 16
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R238 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %q_000001C401BCE948.15 = ptrtoint %struct.AVLNode_st** %q_000001C401BCE948. to i64
  %29 = add i64 %q_000001C401BCE948.15, 0
  %30 = inttoptr i64 %29 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R238, %struct.AVLNode_st** %30
  %q_000001C401BCE948.16 = ptrtoint %struct.AVLNode_st** %q_000001C401BCE948. to i64
  %31 = add i64 %q_000001C401BCE948.16, 0
  %32 = inttoptr i64 %31 to %struct.AVLNode_st**
  %R239 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  %R23917 = ptrtoint %struct.AVLNode_st* %R239 to i64
  %33 = add i64 %R23917, 24
  %34 = inttoptr i64 %33 to i32*
  %R240 = load i32, i32* %34
  switch i32 %R240, label %L84 [
    i32 0, label %L81
    i32 1, label %L83
    i32 2, label %L82
  ]

L81:                                              ; preds = %L80
  %height_changed_000001C401BCE088.18 = ptrtoint i32** %height_changed_000001C401BCE088. to i64
  %35 = add i64 %height_changed_000001C401BCE088.18, 0
  %36 = inttoptr i64 %35 to i32**
  %R241 = load i32*, i32** %36
  %R24119 = ptrtoint i32* %R241 to i64
  %37 = add i64 %R24119, 0
  %38 = inttoptr i64 %37 to i32*
  store i32 0, i32* %38
  %q_000001C401BCE948.20 = ptrtoint %struct.AVLNode_st** %q_000001C401BCE948. to i64
  %39 = add i64 %q_000001C401BCE948.20, 0
  %40 = inttoptr i64 %39 to %struct.AVLNode_st**
  %R242 = load %struct.AVLNode_st*, %struct.AVLNode_st** %40
  %R24221 = ptrtoint %struct.AVLNode_st* %R242 to i64
  %41 = add i64 %R24221, 24
  %42 = inttoptr i64 %41 to i32*
  store i32 1, i32* %42
  %p_000001C401BCE328.22 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %43 = add i64 %p_000001C401BCE328.22, 0
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  %R243 = load %struct.AVLNode_st*, %struct.AVLNode_st** %44
  %R244 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %R243)
  %p_000001C401BCE328.23 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %45 = add i64 %p_000001C401BCE328.23, 0
  %46 = inttoptr i64 %45 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R244, %struct.AVLNode_st** %46
  br label %L84

L82:                                              ; preds = %L80
  %q_000001C401BCE948.24 = ptrtoint %struct.AVLNode_st** %q_000001C401BCE948. to i64
  %47 = add i64 %q_000001C401BCE948.24, 0
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %R245 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %R24525 = ptrtoint %struct.AVLNode_st* %R245 to i64
  %49 = add i64 %R24525, 24
  %50 = inttoptr i64 %49 to i32*
  store i32 0, i32* %50
  %p_000001C401BCE328.26 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %51 = add i64 %p_000001C401BCE328.26, 0
  %52 = inttoptr i64 %51 to %struct.AVLNode_st**
  %R246 = load %struct.AVLNode_st*, %struct.AVLNode_st** %52
  %R24627 = ptrtoint %struct.AVLNode_st* %R246 to i64
  %53 = add i64 %R24627, 24
  %54 = inttoptr i64 %53 to i32*
  store i32 0, i32* %54
  %p_000001C401BCE328.28 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %55 = add i64 %p_000001C401BCE328.28, 0
  %56 = inttoptr i64 %55 to %struct.AVLNode_st**
  %R247 = load %struct.AVLNode_st*, %struct.AVLNode_st** %56
  %R248 = call %struct.AVLNode_st* @AVL_RotateLeft(%struct.AVLNode_st* %R247)
  %p_000001C401BCE328.29 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %57 = add i64 %p_000001C401BCE328.29, 0
  %58 = inttoptr i64 %57 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R248, %struct.AVLNode_st** %58
  br label %L84

L83:                                              ; preds = %L80
  %p_000001C401BCE328.30 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %59 = add i64 %p_000001C401BCE328.30, 0
  %60 = inttoptr i64 %59 to %struct.AVLNode_st**
  %R249 = load %struct.AVLNode_st*, %struct.AVLNode_st** %60
  %R250 = call %struct.AVLNode_st* @AVL_DoubleRotateLeft(%struct.AVLNode_st* %R249)
  %p_000001C401BCE328.31 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %61 = add i64 %p_000001C401BCE328.31, 0
  %62 = inttoptr i64 %61 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R250, %struct.AVLNode_st** %62
  br label %L84

L84:                                              ; preds = %L83, %L82, %L81, %L80
  br label %L85

L85:                                              ; preds = %L84, %L79, %L78, %L77
  %p_000001C401BCE328.32 = ptrtoint %struct.AVLNode_st** %p_000001C401BCE328. to i64
  %63 = add i64 %p_000001C401BCE328.32, 0
  %64 = inttoptr i64 %63 to %struct.AVLNode_st**
  %R251 = load %struct.AVLNode_st*, %struct.AVLNode_st** %64
  store %struct.AVLNode_st* %R251, %struct.AVLNode_st** %0
  br label %L86

L86:                                              ; preds = %L85
  %65 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R251
}

define %struct.AVLNode_st* @AVL_RebalanceShorterRight(%struct.AVLNode_st* %ARG1, i32* %ARG2) {
L87:
  %q_000001C401BCFC88. = alloca %struct.AVLNode_st*
  %p_000001C401BCF668. = alloca %struct.AVLNode_st*
  %height_changed_000001C401BCF3C8. = alloca i32*
  %self_000001C401BCF208. = alloca %struct.AVLNode_st*
  %0 = alloca %struct.AVLNode_st*
  %self_000001C401BCF208.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BCF208. to i64
  %1 = add i64 %self_000001C401BCF208.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %height_changed_000001C401BCF3C8.2 = ptrtoint i32** %height_changed_000001C401BCF3C8. to i64
  %3 = add i64 %height_changed_000001C401BCF3C8.2, 0
  %4 = inttoptr i64 %3 to i32**
  store i32* %ARG2, i32** %4
  %self_000001C401BCF208.3 = ptrtoint %struct.AVLNode_st** %self_000001C401BCF208. to i64
  %5 = add i64 %self_000001C401BCF208.3, 0
  %6 = inttoptr i64 %5 to %struct.AVLNode_st**
  %R253 = load %struct.AVLNode_st*, %struct.AVLNode_st** %6
  %p_000001C401BCF668.4 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %7 = add i64 %p_000001C401BCF668.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R253, %struct.AVLNode_st** %8
  %p_000001C401BCF668.5 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %9 = add i64 %p_000001C401BCF668.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R254 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %R2546 = ptrtoint %struct.AVLNode_st* %R254 to i64
  %11 = add i64 %R2546, 24
  %12 = inttoptr i64 %11 to i32*
  %R255 = load i32, i32* %12
  switch i32 %R255, label %L95 [
    i32 0, label %L88
    i32 1, label %L90
    i32 2, label %L89
  ]

L88:                                              ; preds = %L87
  %p_000001C401BCF668.7 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %13 = add i64 %p_000001C401BCF668.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  %R256 = load %struct.AVLNode_st*, %struct.AVLNode_st** %14
  %R2568 = ptrtoint %struct.AVLNode_st* %R256 to i64
  %15 = add i64 %R2568, 24
  %16 = inttoptr i64 %15 to i32*
  store i32 1, i32* %16
  %height_changed_000001C401BCF3C8.9 = ptrtoint i32** %height_changed_000001C401BCF3C8. to i64
  %17 = add i64 %height_changed_000001C401BCF3C8.9, 0
  %18 = inttoptr i64 %17 to i32**
  %R257 = load i32*, i32** %18
  %R25710 = ptrtoint i32* %R257 to i64
  %19 = add i64 %R25710, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 0, i32* %20
  br label %L95

L89:                                              ; preds = %L87
  %p_000001C401BCF668.11 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %21 = add i64 %p_000001C401BCF668.11, 0
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %R258 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %R25812 = ptrtoint %struct.AVLNode_st* %R258 to i64
  %23 = add i64 %R25812, 24
  %24 = inttoptr i64 %23 to i32*
  store i32 0, i32* %24
  br label %L95

L90:                                              ; preds = %L87
  %p_000001C401BCF668.13 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %25 = add i64 %p_000001C401BCF668.13, 0
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %R259 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  %R25914 = ptrtoint %struct.AVLNode_st* %R259 to i64
  %27 = add i64 %R25914, 8
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R260 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %q_000001C401BCFC88.15 = ptrtoint %struct.AVLNode_st** %q_000001C401BCFC88. to i64
  %29 = add i64 %q_000001C401BCFC88.15, 0
  %30 = inttoptr i64 %29 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R260, %struct.AVLNode_st** %30
  %q_000001C401BCFC88.16 = ptrtoint %struct.AVLNode_st** %q_000001C401BCFC88. to i64
  %31 = add i64 %q_000001C401BCFC88.16, 0
  %32 = inttoptr i64 %31 to %struct.AVLNode_st**
  %R261 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  %R26117 = ptrtoint %struct.AVLNode_st* %R261 to i64
  %33 = add i64 %R26117, 24
  %34 = inttoptr i64 %33 to i32*
  %R262 = load i32, i32* %34
  switch i32 %R262, label %L94 [
    i32 0, label %L91
    i32 1, label %L92
    i32 2, label %L93
  ]

L91:                                              ; preds = %L90
  %height_changed_000001C401BCF3C8.18 = ptrtoint i32** %height_changed_000001C401BCF3C8. to i64
  %35 = add i64 %height_changed_000001C401BCF3C8.18, 0
  %36 = inttoptr i64 %35 to i32**
  %R263 = load i32*, i32** %36
  %R26319 = ptrtoint i32* %R263 to i64
  %37 = add i64 %R26319, 0
  %38 = inttoptr i64 %37 to i32*
  store i32 0, i32* %38
  %q_000001C401BCFC88.20 = ptrtoint %struct.AVLNode_st** %q_000001C401BCFC88. to i64
  %39 = add i64 %q_000001C401BCFC88.20, 0
  %40 = inttoptr i64 %39 to %struct.AVLNode_st**
  %R264 = load %struct.AVLNode_st*, %struct.AVLNode_st** %40
  %R26421 = ptrtoint %struct.AVLNode_st* %R264 to i64
  %41 = add i64 %R26421, 24
  %42 = inttoptr i64 %41 to i32*
  store i32 2, i32* %42
  %p_000001C401BCF668.22 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %43 = add i64 %p_000001C401BCF668.22, 0
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  %R265 = load %struct.AVLNode_st*, %struct.AVLNode_st** %44
  %R266 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %R265)
  %p_000001C401BCF668.23 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %45 = add i64 %p_000001C401BCF668.23, 0
  %46 = inttoptr i64 %45 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R266, %struct.AVLNode_st** %46
  br label %L94

L92:                                              ; preds = %L90
  %q_000001C401BCFC88.24 = ptrtoint %struct.AVLNode_st** %q_000001C401BCFC88. to i64
  %47 = add i64 %q_000001C401BCFC88.24, 0
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %R267 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %R26725 = ptrtoint %struct.AVLNode_st* %R267 to i64
  %49 = add i64 %R26725, 24
  %50 = inttoptr i64 %49 to i32*
  store i32 0, i32* %50
  %p_000001C401BCF668.26 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %51 = add i64 %p_000001C401BCF668.26, 0
  %52 = inttoptr i64 %51 to %struct.AVLNode_st**
  %R268 = load %struct.AVLNode_st*, %struct.AVLNode_st** %52
  %R26827 = ptrtoint %struct.AVLNode_st* %R268 to i64
  %53 = add i64 %R26827, 24
  %54 = inttoptr i64 %53 to i32*
  store i32 0, i32* %54
  %p_000001C401BCF668.28 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %55 = add i64 %p_000001C401BCF668.28, 0
  %56 = inttoptr i64 %55 to %struct.AVLNode_st**
  %R269 = load %struct.AVLNode_st*, %struct.AVLNode_st** %56
  %R270 = call %struct.AVLNode_st* @AVL_RotateRight(%struct.AVLNode_st* %R269)
  %p_000001C401BCF668.29 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %57 = add i64 %p_000001C401BCF668.29, 0
  %58 = inttoptr i64 %57 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R270, %struct.AVLNode_st** %58
  br label %L94

L93:                                              ; preds = %L90
  %p_000001C401BCF668.30 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %59 = add i64 %p_000001C401BCF668.30, 0
  %60 = inttoptr i64 %59 to %struct.AVLNode_st**
  %R271 = load %struct.AVLNode_st*, %struct.AVLNode_st** %60
  %R272 = call %struct.AVLNode_st* @AVL_DoubleRotateRight(%struct.AVLNode_st* %R271)
  %p_000001C401BCF668.31 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %61 = add i64 %p_000001C401BCF668.31, 0
  %62 = inttoptr i64 %61 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R272, %struct.AVLNode_st** %62
  br label %L94

L94:                                              ; preds = %L93, %L92, %L91, %L90
  br label %L95

L95:                                              ; preds = %L94, %L89, %L88, %L87
  %p_000001C401BCF668.32 = ptrtoint %struct.AVLNode_st** %p_000001C401BCF668. to i64
  %63 = add i64 %p_000001C401BCF668.32, 0
  %64 = inttoptr i64 %63 to %struct.AVLNode_st**
  %R273 = load %struct.AVLNode_st*, %struct.AVLNode_st** %64
  store %struct.AVLNode_st* %R273, %struct.AVLNode_st** %0
  br label %L96

L96:                                              ; preds = %L95
  %65 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R273
}

define i32 @AVL_Height(%struct.AVLNode_st* %ARG1) {
L97:
  %rt_height_000001C401BE09C8. = alloca i32
  %lf_height_000001C401BE08E8. = alloca i32
  %height_000001C401BE0808. = alloca i32
  %self_000001C401BE0568. = alloca %struct.AVLNode_st*
  %0 = alloca i32
  %self_000001C401BE0568.1 = ptrtoint %struct.AVLNode_st** %self_000001C401BE0568. to i64
  %1 = add i64 %self_000001C401BE0568.1, 0
  %2 = inttoptr i64 %1 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %2
  %height_000001C401BE0808.2 = ptrtoint i32* %height_000001C401BE0808. to i64
  %3 = add i64 %height_000001C401BE0808.2, 0
  %4 = inttoptr i64 %3 to i32*
  store i32 0, i32* %4
  %lf_height_000001C401BE08E8.3 = ptrtoint i32* %lf_height_000001C401BE08E8. to i64
  %5 = add i64 %lf_height_000001C401BE08E8.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  %rt_height_000001C401BE09C8.4 = ptrtoint i32* %rt_height_000001C401BE09C8. to i64
  %7 = add i64 %rt_height_000001C401BE09C8.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 0, i32* %8
  %self_000001C401BE0568.5 = ptrtoint %struct.AVLNode_st** %self_000001C401BE0568. to i64
  %9 = add i64 %self_000001C401BE0568.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R275 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %11 = ptrtoint %struct.AVLNode_st* %R275 to i64
  %R276 = icmp eq i64 %11, 0
  %R2766 = zext i1 %R276 to i32
  %cond = icmp ne i32 %R2766, 0
  br i1 %cond, label %L98, label %L99

L98:                                              ; preds = %L97
  store i32 0, i32* %0
  br label %L107

L99:                                              ; preds = %L97
  %self_000001C401BE0568.7 = ptrtoint %struct.AVLNode_st** %self_000001C401BE0568. to i64
  %12 = add i64 %self_000001C401BE0568.7, 0
  %13 = inttoptr i64 %12 to %struct.AVLNode_st**
  %R278 = load %struct.AVLNode_st*, %struct.AVLNode_st** %13
  %R2788 = ptrtoint %struct.AVLNode_st* %R278 to i64
  %14 = add i64 %R2788, 8
  %15 = inttoptr i64 %14 to %struct.AVLNode_st**
  %R279 = load %struct.AVLNode_st*, %struct.AVLNode_st** %15
  %cond9 = icmp ne %struct.AVLNode_st* %R279, null
  br i1 %cond9, label %L100, label %L101

L100:                                             ; preds = %L99
  %self_000001C401BE0568.10 = ptrtoint %struct.AVLNode_st** %self_000001C401BE0568. to i64
  %16 = add i64 %self_000001C401BE0568.10, 0
  %17 = inttoptr i64 %16 to %struct.AVLNode_st**
  %R280 = load %struct.AVLNode_st*, %struct.AVLNode_st** %17
  %R28011 = ptrtoint %struct.AVLNode_st* %R280 to i64
  %18 = add i64 %R28011, 8
  %19 = inttoptr i64 %18 to %struct.AVLNode_st**
  %R281 = load %struct.AVLNode_st*, %struct.AVLNode_st** %19
  %R282 = call i32 @AVL_Height(%struct.AVLNode_st* %R281)
  %lf_height_000001C401BE08E8.12 = ptrtoint i32* %lf_height_000001C401BE08E8. to i64
  %20 = add i64 %lf_height_000001C401BE08E8.12, 0
  %21 = inttoptr i64 %20 to i32*
  store i32 %R282, i32* %21
  br label %L101

L101:                                             ; preds = %L100, %L99
  %self_000001C401BE0568.13 = ptrtoint %struct.AVLNode_st** %self_000001C401BE0568. to i64
  %22 = add i64 %self_000001C401BE0568.13, 0
  %23 = inttoptr i64 %22 to %struct.AVLNode_st**
  %R283 = load %struct.AVLNode_st*, %struct.AVLNode_st** %23
  %R28314 = ptrtoint %struct.AVLNode_st* %R283 to i64
  %24 = add i64 %R28314, 16
  %25 = inttoptr i64 %24 to %struct.AVLNode_st**
  %R284 = load %struct.AVLNode_st*, %struct.AVLNode_st** %25
  %cond15 = icmp ne %struct.AVLNode_st* %R284, null
  br i1 %cond15, label %L102, label %L103

L102:                                             ; preds = %L101
  %self_000001C401BE0568.16 = ptrtoint %struct.AVLNode_st** %self_000001C401BE0568. to i64
  %26 = add i64 %self_000001C401BE0568.16, 0
  %27 = inttoptr i64 %26 to %struct.AVLNode_st**
  %R285 = load %struct.AVLNode_st*, %struct.AVLNode_st** %27
  %R28517 = ptrtoint %struct.AVLNode_st* %R285 to i64
  %28 = add i64 %R28517, 16
  %29 = inttoptr i64 %28 to %struct.AVLNode_st**
  %R286 = load %struct.AVLNode_st*, %struct.AVLNode_st** %29
  %R287 = call i32 @AVL_Height(%struct.AVLNode_st* %R286)
  %rt_height_000001C401BE09C8.18 = ptrtoint i32* %rt_height_000001C401BE09C8. to i64
  %30 = add i64 %rt_height_000001C401BE09C8.18, 0
  %31 = inttoptr i64 %30 to i32*
  store i32 %R287, i32* %31
  br label %L103

L103:                                             ; preds = %L102, %L101
  %lf_height_000001C401BE08E8.19 = ptrtoint i32* %lf_height_000001C401BE08E8. to i64
  %32 = add i64 %lf_height_000001C401BE08E8.19, 0
  %33 = inttoptr i64 %32 to i32*
  %R288 = load i32, i32* %33
  %rt_height_000001C401BE09C8.20 = ptrtoint i32* %rt_height_000001C401BE09C8. to i64
  %34 = add i64 %rt_height_000001C401BE09C8.20, 0
  %35 = inttoptr i64 %34 to i32*
  %R289 = load i32, i32* %35
  %R290 = icmp sgt i32 %R288, %R289
  %R29021 = zext i1 %R290 to i32
  %cond22 = icmp ne i32 %R29021, 0
  br i1 %cond22, label %L104, label %L105

L104:                                             ; preds = %L103
  %lf_height_000001C401BE08E8.23 = ptrtoint i32* %lf_height_000001C401BE08E8. to i64
  %36 = add i64 %lf_height_000001C401BE08E8.23, 0
  %37 = inttoptr i64 %36 to i32*
  %R291 = load i32, i32* %37
  %R292 = add i32 %R291, 1
  %height_000001C401BE0808.24 = ptrtoint i32* %height_000001C401BE0808. to i64
  %38 = add i64 %height_000001C401BE0808.24, 0
  %39 = inttoptr i64 %38 to i32*
  %R293 = load i32, i32* %39
  %R295 = add i32 %R293, %R292
  %height_000001C401BE0808.25 = ptrtoint i32* %height_000001C401BE0808. to i64
  %40 = add i64 %height_000001C401BE0808.25, 0
  %41 = inttoptr i64 %40 to i32*
  store i32 %R295, i32* %41
  br label %L106

L105:                                             ; preds = %L103
  %rt_height_000001C401BE09C8.26 = ptrtoint i32* %rt_height_000001C401BE09C8. to i64
  %42 = add i64 %rt_height_000001C401BE09C8.26, 0
  %43 = inttoptr i64 %42 to i32*
  %R297 = load i32, i32* %43
  %R298 = add i32 %R297, 1
  %height_000001C401BE0808.27 = ptrtoint i32* %height_000001C401BE0808. to i64
  %44 = add i64 %height_000001C401BE0808.27, 0
  %45 = inttoptr i64 %44 to i32*
  %R299 = load i32, i32* %45
  %R301 = add i32 %R299, %R298
  %height_000001C401BE0808.28 = ptrtoint i32* %height_000001C401BE0808. to i64
  %46 = add i64 %height_000001C401BE0808.28, 0
  %47 = inttoptr i64 %46 to i32*
  store i32 %R301, i32* %47
  br label %L106

L106:                                             ; preds = %L105, %L104
  %height_000001C401BE0808.29 = ptrtoint i32* %height_000001C401BE0808. to i64
  %48 = add i64 %height_000001C401BE0808.29, 0
  %49 = inttoptr i64 %48 to i32*
  %R303 = load i32, i32* %49
  store i32 %R303, i32* %0
  br label %L107

L107:                                             ; preds = %L106, %L98
  %50 = load i32, i32* %0
  ret i32 %50
}

define i8* @AVLTree_FindFirst(%struct.avltree* %ARG1) {
L108:
  %current_000001C401BE1368. = alloca %struct.AVLNode_st*
  %root_000001C401BE11A8. = alloca i8*
  %tree_000001C401BE0F08. = alloca %struct.avltree*
  %0 = alloca i8*
  %tree_000001C401BE0F08.1 = ptrtoint %struct.avltree** %tree_000001C401BE0F08. to i64
  %1 = add i64 %tree_000001C401BE0F08.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %tree_000001C401BE0F08.2 = ptrtoint %struct.avltree** %tree_000001C401BE0F08. to i64
  %3 = add i64 %tree_000001C401BE0F08.2, 0
  %4 = inttoptr i64 %3 to %struct.avltree**
  %R304 = load %struct.avltree*, %struct.avltree** %4
  %R3043 = ptrtoint %struct.avltree* %R304 to i64
  %5 = add i64 %R3043, 8
  %6 = inttoptr i64 %5 to i8**
  %R305 = load i8*, i8** %6
  %root_000001C401BE11A8.4 = ptrtoint i8** %root_000001C401BE11A8. to i64
  %7 = add i64 %root_000001C401BE11A8.4, 0
  %8 = inttoptr i64 %7 to i8**
  store i8* %R305, i8** %8
  %root_000001C401BE11A8.5 = ptrtoint i8** %root_000001C401BE11A8. to i64
  %9 = add i64 %root_000001C401BE11A8.5, 0
  %10 = inttoptr i64 %9 to i8**
  %R306 = load i8*, i8** %10
  %cond = icmp ne i8* %R306, null
  br i1 %cond, label %L109, label %L114

L109:                                             ; preds = %L108
  %root_000001C401BE11A8.6 = ptrtoint i8** %root_000001C401BE11A8. to i64
  %11 = add i64 %root_000001C401BE11A8.6, 0
  %12 = inttoptr i64 %11 to i8**
  %R307 = load i8*, i8** %12
  %R308 = bitcast i8* %R307 to %struct.AVLNode_st*
  %current_000001C401BE1368.7 = ptrtoint %struct.AVLNode_st** %current_000001C401BE1368. to i64
  %13 = add i64 %current_000001C401BE1368.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R308, %struct.AVLNode_st** %14
  br label %L110

L110:                                             ; preds = %L112, %L109
  %current_000001C401BE1368.8 = ptrtoint %struct.AVLNode_st** %current_000001C401BE1368. to i64
  %15 = add i64 %current_000001C401BE1368.8, 0
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %R309 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  %R3099 = ptrtoint %struct.AVLNode_st* %R309 to i64
  %17 = add i64 %R3099, 8
  %18 = inttoptr i64 %17 to %struct.AVLNode_st**
  %R310 = load %struct.AVLNode_st*, %struct.AVLNode_st** %18
  %19 = ptrtoint %struct.AVLNode_st* %R310 to i64
  %R311 = icmp ne i64 %19, 0
  %R31110 = zext i1 %R311 to i32
  %cond11 = icmp ne i32 %R31110, 0
  br i1 %cond11, label %L111, label %L113

L111:                                             ; preds = %L110
  %current_000001C401BE1368.12 = ptrtoint %struct.AVLNode_st** %current_000001C401BE1368. to i64
  %20 = add i64 %current_000001C401BE1368.12, 0
  %21 = inttoptr i64 %20 to %struct.AVLNode_st**
  %R312 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  %R31213 = ptrtoint %struct.AVLNode_st* %R312 to i64
  %22 = add i64 %R31213, 8
  %23 = inttoptr i64 %22 to %struct.AVLNode_st**
  %R313 = load %struct.AVLNode_st*, %struct.AVLNode_st** %23
  %current_000001C401BE1368.14 = ptrtoint %struct.AVLNode_st** %current_000001C401BE1368. to i64
  %24 = add i64 %current_000001C401BE1368.14, 0
  %25 = inttoptr i64 %24 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R313, %struct.AVLNode_st** %25
  br label %L112

L112:                                             ; preds = %L111
  br label %L110

L113:                                             ; preds = %L110
  %current_000001C401BE1368.15 = ptrtoint %struct.AVLNode_st** %current_000001C401BE1368. to i64
  %26 = add i64 %current_000001C401BE1368.15, 0
  %27 = inttoptr i64 %26 to %struct.AVLNode_st**
  %R314 = load %struct.AVLNode_st*, %struct.AVLNode_st** %27
  %R31416 = ptrtoint %struct.AVLNode_st* %R314 to i64
  %R315 = add i64 %R31416, 32
  %R31517 = inttoptr i64 %R315 to %struct.AVLNode_st*
  %R316 = bitcast %struct.AVLNode_st* %R31517 to i8*
  store i8* %R316, i8** %0
  br label %L115

L114:                                             ; preds = %L108
  store i8* null, i8** %0
  br label %L115

L115:                                             ; preds = %L114, %L113
  %28 = load i8*, i8** %0
  ret i8* %28
}

define i8* @AVLTree_FindLast(%struct.avltree* %ARG1) {
L116:
  %current_000001C401BE24E8. = alloca %struct.AVLNode_st*
  %root_000001C401BE2328. = alloca i8*
  %tree_000001C401BE2088. = alloca %struct.avltree*
  %0 = alloca i8*
  %tree_000001C401BE2088.1 = ptrtoint %struct.avltree** %tree_000001C401BE2088. to i64
  %1 = add i64 %tree_000001C401BE2088.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %tree_000001C401BE2088.2 = ptrtoint %struct.avltree** %tree_000001C401BE2088. to i64
  %3 = add i64 %tree_000001C401BE2088.2, 0
  %4 = inttoptr i64 %3 to %struct.avltree**
  %R318 = load %struct.avltree*, %struct.avltree** %4
  %R3183 = ptrtoint %struct.avltree* %R318 to i64
  %5 = add i64 %R3183, 8
  %6 = inttoptr i64 %5 to i8**
  %R319 = load i8*, i8** %6
  %root_000001C401BE2328.4 = ptrtoint i8** %root_000001C401BE2328. to i64
  %7 = add i64 %root_000001C401BE2328.4, 0
  %8 = inttoptr i64 %7 to i8**
  store i8* %R319, i8** %8
  %root_000001C401BE2328.5 = ptrtoint i8** %root_000001C401BE2328. to i64
  %9 = add i64 %root_000001C401BE2328.5, 0
  %10 = inttoptr i64 %9 to i8**
  %R320 = load i8*, i8** %10
  %cond = icmp ne i8* %R320, null
  br i1 %cond, label %L117, label %L122

L117:                                             ; preds = %L116
  %root_000001C401BE2328.6 = ptrtoint i8** %root_000001C401BE2328. to i64
  %11 = add i64 %root_000001C401BE2328.6, 0
  %12 = inttoptr i64 %11 to i8**
  %R321 = load i8*, i8** %12
  %R322 = bitcast i8* %R321 to %struct.AVLNode_st*
  %current_000001C401BE24E8.7 = ptrtoint %struct.AVLNode_st** %current_000001C401BE24E8. to i64
  %13 = add i64 %current_000001C401BE24E8.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R322, %struct.AVLNode_st** %14
  br label %L118

L118:                                             ; preds = %L120, %L117
  %current_000001C401BE24E8.8 = ptrtoint %struct.AVLNode_st** %current_000001C401BE24E8. to i64
  %15 = add i64 %current_000001C401BE24E8.8, 0
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %R323 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  %R3239 = ptrtoint %struct.AVLNode_st* %R323 to i64
  %17 = add i64 %R3239, 16
  %18 = inttoptr i64 %17 to %struct.AVLNode_st**
  %R324 = load %struct.AVLNode_st*, %struct.AVLNode_st** %18
  %19 = ptrtoint %struct.AVLNode_st* %R324 to i64
  %R325 = icmp ne i64 %19, 0
  %R32510 = zext i1 %R325 to i32
  %cond11 = icmp ne i32 %R32510, 0
  br i1 %cond11, label %L119, label %L121

L119:                                             ; preds = %L118
  %current_000001C401BE24E8.12 = ptrtoint %struct.AVLNode_st** %current_000001C401BE24E8. to i64
  %20 = add i64 %current_000001C401BE24E8.12, 0
  %21 = inttoptr i64 %20 to %struct.AVLNode_st**
  %R326 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  %R32613 = ptrtoint %struct.AVLNode_st* %R326 to i64
  %22 = add i64 %R32613, 16
  %23 = inttoptr i64 %22 to %struct.AVLNode_st**
  %R327 = load %struct.AVLNode_st*, %struct.AVLNode_st** %23
  %current_000001C401BE24E8.14 = ptrtoint %struct.AVLNode_st** %current_000001C401BE24E8. to i64
  %24 = add i64 %current_000001C401BE24E8.14, 0
  %25 = inttoptr i64 %24 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R327, %struct.AVLNode_st** %25
  br label %L120

L120:                                             ; preds = %L119
  br label %L118

L121:                                             ; preds = %L118
  %current_000001C401BE24E8.15 = ptrtoint %struct.AVLNode_st** %current_000001C401BE24E8. to i64
  %26 = add i64 %current_000001C401BE24E8.15, 0
  %27 = inttoptr i64 %26 to %struct.AVLNode_st**
  %R328 = load %struct.AVLNode_st*, %struct.AVLNode_st** %27
  %R32816 = ptrtoint %struct.AVLNode_st* %R328 to i64
  %R329 = add i64 %R32816, 32
  %R32917 = inttoptr i64 %R329 to %struct.AVLNode_st*
  %R330 = bitcast %struct.AVLNode_st* %R32917 to i8*
  store i8* %R330, i8** %0
  br label %L123

L122:                                             ; preds = %L116
  store i8* null, i8** %0
  br label %L123

L123:                                             ; preds = %L122, %L121
  %28 = load i8*, i8** %0
  ret i8* %28
}

define i8* @AVLTree_FindNext(%struct.avltree* %ARG1, i8* %ARG2) {
L124:
  %p_000001C401BE3D68. = alloca %struct.AVLNode_st*
  %current_000001C401BE3668. = alloca %struct.AVLNode_st*
  %currnode_000001C401BE33C8. = alloca i8*
  %tree_000001C401BE3208. = alloca %struct.avltree*
  %0 = alloca i8*
  %tree_000001C401BE3208.1 = ptrtoint %struct.avltree** %tree_000001C401BE3208. to i64
  %1 = add i64 %tree_000001C401BE3208.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %currnode_000001C401BE33C8.2 = ptrtoint i8** %currnode_000001C401BE33C8. to i64
  %3 = add i64 %currnode_000001C401BE33C8.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %currnode_000001C401BE33C8.3 = ptrtoint i8** %currnode_000001C401BE33C8. to i64
  %5 = add i64 %currnode_000001C401BE33C8.3, 0
  %6 = inttoptr i64 %5 to i8**
  %R332 = load i8*, i8** %6
  %R333 = bitcast i8* %R332 to %struct.AVLNode_st*
  %current_000001C401BE3668.4 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %7 = add i64 %current_000001C401BE3668.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R333, %struct.AVLNode_st** %8
  %current_000001C401BE3668.5 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %9 = add i64 %current_000001C401BE3668.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R334 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %cond = icmp ne %struct.AVLNode_st* %R334, null
  br i1 %cond, label %L125, label %L140

L125:                                             ; preds = %L124
  %current_000001C401BE3668.6 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %11 = add i64 %current_000001C401BE3668.6, 0
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  %R335 = load %struct.AVLNode_st*, %struct.AVLNode_st** %12
  %R3357 = ptrtoint %struct.AVLNode_st* %R335 to i64
  %R336 = sub i64 %R3357, 32
  %R3368 = inttoptr i64 %R336 to %struct.AVLNode_st*
  %current_000001C401BE3668.9 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %13 = add i64 %current_000001C401BE3668.9, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R3368, %struct.AVLNode_st** %14
  %current_000001C401BE3668.10 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %15 = add i64 %current_000001C401BE3668.10, 0
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %R337 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  %R33711 = ptrtoint %struct.AVLNode_st* %R337 to i64
  %17 = add i64 %R33711, 16
  %18 = inttoptr i64 %17 to %struct.AVLNode_st**
  %R338 = load %struct.AVLNode_st*, %struct.AVLNode_st** %18
  %cond12 = icmp ne %struct.AVLNode_st* %R338, null
  br i1 %cond12, label %L126, label %L131

L126:                                             ; preds = %L125
  %current_000001C401BE3668.13 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %19 = add i64 %current_000001C401BE3668.13, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R339 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %R33914 = ptrtoint %struct.AVLNode_st* %R339 to i64
  %21 = add i64 %R33914, 16
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %R340 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %current_000001C401BE3668.15 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %23 = add i64 %current_000001C401BE3668.15, 0
  %24 = inttoptr i64 %23 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R340, %struct.AVLNode_st** %24
  br label %L127

L127:                                             ; preds = %L129, %L126
  %current_000001C401BE3668.16 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %25 = add i64 %current_000001C401BE3668.16, 0
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %R341 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  %R34117 = ptrtoint %struct.AVLNode_st* %R341 to i64
  %27 = add i64 %R34117, 8
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R342 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %29 = ptrtoint %struct.AVLNode_st* %R342 to i64
  %R343 = icmp ne i64 %29, 0
  %R34318 = zext i1 %R343 to i32
  %cond19 = icmp ne i32 %R34318, 0
  br i1 %cond19, label %L128, label %L130

L128:                                             ; preds = %L127
  %current_000001C401BE3668.20 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %30 = add i64 %current_000001C401BE3668.20, 0
  %31 = inttoptr i64 %30 to %struct.AVLNode_st**
  %R344 = load %struct.AVLNode_st*, %struct.AVLNode_st** %31
  %R34421 = ptrtoint %struct.AVLNode_st* %R344 to i64
  %32 = add i64 %R34421, 8
  %33 = inttoptr i64 %32 to %struct.AVLNode_st**
  %R345 = load %struct.AVLNode_st*, %struct.AVLNode_st** %33
  %current_000001C401BE3668.22 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %34 = add i64 %current_000001C401BE3668.22, 0
  %35 = inttoptr i64 %34 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R345, %struct.AVLNode_st** %35
  br label %L129

L129:                                             ; preds = %L128
  br label %L127

L130:                                             ; preds = %L127
  br label %L139

L131:                                             ; preds = %L125
  %current_000001C401BE3668.23 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %36 = add i64 %current_000001C401BE3668.23, 0
  %37 = inttoptr i64 %36 to %struct.AVLNode_st**
  %R346 = load %struct.AVLNode_st*, %struct.AVLNode_st** %37
  %p_000001C401BE3D68.24 = ptrtoint %struct.AVLNode_st** %p_000001C401BE3D68. to i64
  %38 = add i64 %p_000001C401BE3D68.24, 0
  %39 = inttoptr i64 %38 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R346, %struct.AVLNode_st** %39
  %p_000001C401BE3D68.25 = ptrtoint %struct.AVLNode_st** %p_000001C401BE3D68. to i64
  %40 = add i64 %p_000001C401BE3D68.25, 0
  %41 = inttoptr i64 %40 to %struct.AVLNode_st**
  %R347 = load %struct.AVLNode_st*, %struct.AVLNode_st** %41
  %R34726 = ptrtoint %struct.AVLNode_st* %R347 to i64
  %42 = add i64 %R34726, 0
  %43 = inttoptr i64 %42 to %struct.AVLNode_st**
  %R348 = load %struct.AVLNode_st*, %struct.AVLNode_st** %43
  %current_000001C401BE3668.27 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %44 = add i64 %current_000001C401BE3668.27, 0
  %45 = inttoptr i64 %44 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R348, %struct.AVLNode_st** %45
  br label %L132

L132:                                             ; preds = %L137, %L131
  %current_000001C401BE3668.28 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %46 = add i64 %current_000001C401BE3668.28, 0
  %47 = inttoptr i64 %46 to %struct.AVLNode_st**
  %R349 = load %struct.AVLNode_st*, %struct.AVLNode_st** %47
  %cond29 = icmp ne %struct.AVLNode_st* %R349, null
  br i1 %cond29, label %L133, label %L138

L133:                                             ; preds = %L132
  %current_000001C401BE3668.30 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %48 = add i64 %current_000001C401BE3668.30, 0
  %49 = inttoptr i64 %48 to %struct.AVLNode_st**
  %R350 = load %struct.AVLNode_st*, %struct.AVLNode_st** %49
  %R35031 = ptrtoint %struct.AVLNode_st* %R350 to i64
  %50 = add i64 %R35031, 16
  %51 = inttoptr i64 %50 to %struct.AVLNode_st**
  %R351 = load %struct.AVLNode_st*, %struct.AVLNode_st** %51
  %p_000001C401BE3D68.32 = ptrtoint %struct.AVLNode_st** %p_000001C401BE3D68. to i64
  %52 = add i64 %p_000001C401BE3D68.32, 0
  %53 = inttoptr i64 %52 to %struct.AVLNode_st**
  %R352 = load %struct.AVLNode_st*, %struct.AVLNode_st** %53
  %54 = ptrtoint %struct.AVLNode_st* %R351 to i64
  %55 = ptrtoint %struct.AVLNode_st* %R352 to i64
  %R353 = icmp eq i64 %54, %55
  %R35333 = zext i1 %R353 to i32
  %cond34 = icmp ne i32 %R35333, 0
  br i1 %cond34, label %L134, label %L135

L134:                                             ; preds = %L133
  %current_000001C401BE3668.35 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %56 = add i64 %current_000001C401BE3668.35, 0
  %57 = inttoptr i64 %56 to %struct.AVLNode_st**
  %R354 = load %struct.AVLNode_st*, %struct.AVLNode_st** %57
  %p_000001C401BE3D68.36 = ptrtoint %struct.AVLNode_st** %p_000001C401BE3D68. to i64
  %58 = add i64 %p_000001C401BE3D68.36, 0
  %59 = inttoptr i64 %58 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R354, %struct.AVLNode_st** %59
  %current_000001C401BE3668.37 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %60 = add i64 %current_000001C401BE3668.37, 0
  %61 = inttoptr i64 %60 to %struct.AVLNode_st**
  %R355 = load %struct.AVLNode_st*, %struct.AVLNode_st** %61
  %R35538 = ptrtoint %struct.AVLNode_st* %R355 to i64
  %62 = add i64 %R35538, 0
  %63 = inttoptr i64 %62 to %struct.AVLNode_st**
  %R356 = load %struct.AVLNode_st*, %struct.AVLNode_st** %63
  %current_000001C401BE3668.39 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %64 = add i64 %current_000001C401BE3668.39, 0
  %65 = inttoptr i64 %64 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R356, %struct.AVLNode_st** %65
  br label %L136

L135:                                             ; preds = %L133
  br label %L138

L136:                                             ; preds = %L134
  br label %L137

L137:                                             ; preds = %L136
  br label %L132

L138:                                             ; preds = %L135, %L132
  br label %L139

L139:                                             ; preds = %L138, %L130
  br label %L140

L140:                                             ; preds = %L139, %L124
  %current_000001C401BE3668.40 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %66 = add i64 %current_000001C401BE3668.40, 0
  %67 = inttoptr i64 %66 to %struct.AVLNode_st**
  %R357 = load %struct.AVLNode_st*, %struct.AVLNode_st** %67
  %cond41 = icmp ne %struct.AVLNode_st* %R357, null
  br i1 %cond41, label %L141, label %L142

L141:                                             ; preds = %L140
  %current_000001C401BE3668.42 = ptrtoint %struct.AVLNode_st** %current_000001C401BE3668. to i64
  %68 = add i64 %current_000001C401BE3668.42, 0
  %69 = inttoptr i64 %68 to %struct.AVLNode_st**
  %R358 = load %struct.AVLNode_st*, %struct.AVLNode_st** %69
  %R35843 = ptrtoint %struct.AVLNode_st* %R358 to i64
  %R359 = add i64 %R35843, 32
  %R35944 = inttoptr i64 %R359 to %struct.AVLNode_st*
  %R360 = bitcast %struct.AVLNode_st* %R35944 to i8*
  store i8* %R360, i8** %0
  br label %L143

L142:                                             ; preds = %L140
  store i8* null, i8** %0
  br label %L143

L143:                                             ; preds = %L142, %L141
  %70 = load i8*, i8** %0
  ret i8* %70
}

define i8* @AVLTree_FindPrevious(%struct.avltree* %ARG1, i8* %ARG2) {
L144:
  %p_000001C401BE5268. = alloca %struct.AVLNode_st*
  %current_000001C401BE4B68. = alloca %struct.AVLNode_st*
  %currnode_000001C401BE48C8. = alloca i8*
  %tree_000001C401BE4708. = alloca %struct.avltree*
  %0 = alloca i8*
  %tree_000001C401BE4708.1 = ptrtoint %struct.avltree** %tree_000001C401BE4708. to i64
  %1 = add i64 %tree_000001C401BE4708.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %currnode_000001C401BE48C8.2 = ptrtoint i8** %currnode_000001C401BE48C8. to i64
  %3 = add i64 %currnode_000001C401BE48C8.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %currnode_000001C401BE48C8.3 = ptrtoint i8** %currnode_000001C401BE48C8. to i64
  %5 = add i64 %currnode_000001C401BE48C8.3, 0
  %6 = inttoptr i64 %5 to i8**
  %R362 = load i8*, i8** %6
  %R363 = bitcast i8* %R362 to %struct.AVLNode_st*
  %current_000001C401BE4B68.4 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %7 = add i64 %current_000001C401BE4B68.4, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R363, %struct.AVLNode_st** %8
  %current_000001C401BE4B68.5 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %9 = add i64 %current_000001C401BE4B68.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R364 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %cond = icmp ne %struct.AVLNode_st* %R364, null
  br i1 %cond, label %L145, label %L160

L145:                                             ; preds = %L144
  %current_000001C401BE4B68.6 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %11 = add i64 %current_000001C401BE4B68.6, 0
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  %R365 = load %struct.AVLNode_st*, %struct.AVLNode_st** %12
  %R3657 = ptrtoint %struct.AVLNode_st* %R365 to i64
  %R366 = sub i64 %R3657, 32
  %R3668 = inttoptr i64 %R366 to %struct.AVLNode_st*
  %current_000001C401BE4B68.9 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %13 = add i64 %current_000001C401BE4B68.9, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R3668, %struct.AVLNode_st** %14
  %current_000001C401BE4B68.10 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %15 = add i64 %current_000001C401BE4B68.10, 0
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  %R367 = load %struct.AVLNode_st*, %struct.AVLNode_st** %16
  %R36711 = ptrtoint %struct.AVLNode_st* %R367 to i64
  %17 = add i64 %R36711, 8
  %18 = inttoptr i64 %17 to %struct.AVLNode_st**
  %R368 = load %struct.AVLNode_st*, %struct.AVLNode_st** %18
  %cond12 = icmp ne %struct.AVLNode_st* %R368, null
  br i1 %cond12, label %L146, label %L151

L146:                                             ; preds = %L145
  %current_000001C401BE4B68.13 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %19 = add i64 %current_000001C401BE4B68.13, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R369 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %R36914 = ptrtoint %struct.AVLNode_st* %R369 to i64
  %21 = add i64 %R36914, 8
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %R370 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %current_000001C401BE4B68.15 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %23 = add i64 %current_000001C401BE4B68.15, 0
  %24 = inttoptr i64 %23 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R370, %struct.AVLNode_st** %24
  br label %L147

L147:                                             ; preds = %L149, %L146
  %current_000001C401BE4B68.16 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %25 = add i64 %current_000001C401BE4B68.16, 0
  %26 = inttoptr i64 %25 to %struct.AVLNode_st**
  %R371 = load %struct.AVLNode_st*, %struct.AVLNode_st** %26
  %R37117 = ptrtoint %struct.AVLNode_st* %R371 to i64
  %27 = add i64 %R37117, 16
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R372 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %29 = ptrtoint %struct.AVLNode_st* %R372 to i64
  %R373 = icmp ne i64 %29, 0
  %R37318 = zext i1 %R373 to i32
  %cond19 = icmp ne i32 %R37318, 0
  br i1 %cond19, label %L148, label %L150

L148:                                             ; preds = %L147
  %current_000001C401BE4B68.20 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %30 = add i64 %current_000001C401BE4B68.20, 0
  %31 = inttoptr i64 %30 to %struct.AVLNode_st**
  %R374 = load %struct.AVLNode_st*, %struct.AVLNode_st** %31
  %R37421 = ptrtoint %struct.AVLNode_st* %R374 to i64
  %32 = add i64 %R37421, 16
  %33 = inttoptr i64 %32 to %struct.AVLNode_st**
  %R375 = load %struct.AVLNode_st*, %struct.AVLNode_st** %33
  %current_000001C401BE4B68.22 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %34 = add i64 %current_000001C401BE4B68.22, 0
  %35 = inttoptr i64 %34 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R375, %struct.AVLNode_st** %35
  br label %L149

L149:                                             ; preds = %L148
  br label %L147

L150:                                             ; preds = %L147
  br label %L159

L151:                                             ; preds = %L145
  %current_000001C401BE4B68.23 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %36 = add i64 %current_000001C401BE4B68.23, 0
  %37 = inttoptr i64 %36 to %struct.AVLNode_st**
  %R376 = load %struct.AVLNode_st*, %struct.AVLNode_st** %37
  %p_000001C401BE5268.24 = ptrtoint %struct.AVLNode_st** %p_000001C401BE5268. to i64
  %38 = add i64 %p_000001C401BE5268.24, 0
  %39 = inttoptr i64 %38 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R376, %struct.AVLNode_st** %39
  %p_000001C401BE5268.25 = ptrtoint %struct.AVLNode_st** %p_000001C401BE5268. to i64
  %40 = add i64 %p_000001C401BE5268.25, 0
  %41 = inttoptr i64 %40 to %struct.AVLNode_st**
  %R377 = load %struct.AVLNode_st*, %struct.AVLNode_st** %41
  %R37726 = ptrtoint %struct.AVLNode_st* %R377 to i64
  %42 = add i64 %R37726, 0
  %43 = inttoptr i64 %42 to %struct.AVLNode_st**
  %R378 = load %struct.AVLNode_st*, %struct.AVLNode_st** %43
  %current_000001C401BE4B68.27 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %44 = add i64 %current_000001C401BE4B68.27, 0
  %45 = inttoptr i64 %44 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R378, %struct.AVLNode_st** %45
  br label %L152

L152:                                             ; preds = %L157, %L151
  %current_000001C401BE4B68.28 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %46 = add i64 %current_000001C401BE4B68.28, 0
  %47 = inttoptr i64 %46 to %struct.AVLNode_st**
  %R379 = load %struct.AVLNode_st*, %struct.AVLNode_st** %47
  %cond29 = icmp ne %struct.AVLNode_st* %R379, null
  br i1 %cond29, label %L153, label %L158

L153:                                             ; preds = %L152
  %current_000001C401BE4B68.30 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %48 = add i64 %current_000001C401BE4B68.30, 0
  %49 = inttoptr i64 %48 to %struct.AVLNode_st**
  %R380 = load %struct.AVLNode_st*, %struct.AVLNode_st** %49
  %R38031 = ptrtoint %struct.AVLNode_st* %R380 to i64
  %50 = add i64 %R38031, 8
  %51 = inttoptr i64 %50 to %struct.AVLNode_st**
  %R381 = load %struct.AVLNode_st*, %struct.AVLNode_st** %51
  %p_000001C401BE5268.32 = ptrtoint %struct.AVLNode_st** %p_000001C401BE5268. to i64
  %52 = add i64 %p_000001C401BE5268.32, 0
  %53 = inttoptr i64 %52 to %struct.AVLNode_st**
  %R382 = load %struct.AVLNode_st*, %struct.AVLNode_st** %53
  %54 = ptrtoint %struct.AVLNode_st* %R381 to i64
  %55 = ptrtoint %struct.AVLNode_st* %R382 to i64
  %R383 = icmp eq i64 %54, %55
  %R38333 = zext i1 %R383 to i32
  %cond34 = icmp ne i32 %R38333, 0
  br i1 %cond34, label %L154, label %L155

L154:                                             ; preds = %L153
  %current_000001C401BE4B68.35 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %56 = add i64 %current_000001C401BE4B68.35, 0
  %57 = inttoptr i64 %56 to %struct.AVLNode_st**
  %R384 = load %struct.AVLNode_st*, %struct.AVLNode_st** %57
  %p_000001C401BE5268.36 = ptrtoint %struct.AVLNode_st** %p_000001C401BE5268. to i64
  %58 = add i64 %p_000001C401BE5268.36, 0
  %59 = inttoptr i64 %58 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R384, %struct.AVLNode_st** %59
  %current_000001C401BE4B68.37 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %60 = add i64 %current_000001C401BE4B68.37, 0
  %61 = inttoptr i64 %60 to %struct.AVLNode_st**
  %R385 = load %struct.AVLNode_st*, %struct.AVLNode_st** %61
  %R38538 = ptrtoint %struct.AVLNode_st* %R385 to i64
  %62 = add i64 %R38538, 0
  %63 = inttoptr i64 %62 to %struct.AVLNode_st**
  %R386 = load %struct.AVLNode_st*, %struct.AVLNode_st** %63
  %current_000001C401BE4B68.39 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %64 = add i64 %current_000001C401BE4B68.39, 0
  %65 = inttoptr i64 %64 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R386, %struct.AVLNode_st** %65
  br label %L156

L155:                                             ; preds = %L153
  br label %L158

L156:                                             ; preds = %L154
  br label %L157

L157:                                             ; preds = %L156
  br label %L152

L158:                                             ; preds = %L155, %L152
  br label %L159

L159:                                             ; preds = %L158, %L150
  br label %L160

L160:                                             ; preds = %L159, %L144
  %current_000001C401BE4B68.40 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %66 = add i64 %current_000001C401BE4B68.40, 0
  %67 = inttoptr i64 %66 to %struct.AVLNode_st**
  %R387 = load %struct.AVLNode_st*, %struct.AVLNode_st** %67
  %cond41 = icmp ne %struct.AVLNode_st* %R387, null
  br i1 %cond41, label %L161, label %L162

L161:                                             ; preds = %L160
  %current_000001C401BE4B68.42 = ptrtoint %struct.AVLNode_st** %current_000001C401BE4B68. to i64
  %68 = add i64 %current_000001C401BE4B68.42, 0
  %69 = inttoptr i64 %68 to %struct.AVLNode_st**
  %R388 = load %struct.AVLNode_st*, %struct.AVLNode_st** %69
  %R38843 = ptrtoint %struct.AVLNode_st* %R388 to i64
  %R389 = add i64 %R38843, 32
  %R38944 = inttoptr i64 %R389 to %struct.AVLNode_st*
  %R390 = bitcast %struct.AVLNode_st* %R38944 to i8*
  store i8* %R390, i8** %0
  br label %L163

L162:                                             ; preds = %L160
  store i8* null, i8** %0
  br label %L163

L163:                                             ; preds = %L162, %L161
  %70 = load i8*, i8** %0
  ret i8* %70
}

define i32 @AVLTree_Height(%struct.avltree* %ARG1) {
L164:
  %tree_000001C401BE5B28. = alloca %struct.avltree*
  %0 = alloca i32
  %tree_000001C401BE5B28.1 = ptrtoint %struct.avltree** %tree_000001C401BE5B28. to i64
  %1 = add i64 %tree_000001C401BE5B28.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %tree_000001C401BE5B28.2 = ptrtoint %struct.avltree** %tree_000001C401BE5B28. to i64
  %3 = add i64 %tree_000001C401BE5B28.2, 0
  %4 = inttoptr i64 %3 to %struct.avltree**
  %R392 = load %struct.avltree*, %struct.avltree** %4
  %R3923 = ptrtoint %struct.avltree* %R392 to i64
  %5 = add i64 %R3923, 8
  %6 = inttoptr i64 %5 to i8**
  %R393 = load i8*, i8** %6
  %R394 = bitcast i8* %R393 to %struct.AVLNode_st*
  %R395 = call i32 @AVL_Height(%struct.AVLNode_st* %R394)
  store i32 %R395, i32* %0
  br label %L165

L165:                                             ; preds = %L164
  %7 = load i32, i32* %0
  ret i32 %R395
}

define void @AVLTree_BackwardApply(%struct.AVLNode_st* %ARG1, void (i8*)* %ARG2) {
L166:
  %funcptr_000001C401BE6308. = alloca void (i8*)*
  %root_000001C401BE6148. = alloca %struct.AVLNode_st*
  %root_000001C401BE6148.1 = ptrtoint %struct.AVLNode_st** %root_000001C401BE6148. to i64
  %0 = add i64 %root_000001C401BE6148.1, 0
  %1 = inttoptr i64 %0 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %1
  %funcptr_000001C401BE6308.2 = ptrtoint void (i8*)** %funcptr_000001C401BE6308. to i64
  %2 = add i64 %funcptr_000001C401BE6308.2, 0
  %3 = inttoptr i64 %2 to void (i8*)**
  store void (i8*)* %ARG2, void (i8*)** %3
  %root_000001C401BE6148.3 = ptrtoint %struct.AVLNode_st** %root_000001C401BE6148. to i64
  %4 = add i64 %root_000001C401BE6148.3, 0
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  %R397 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %6 = ptrtoint %struct.AVLNode_st* %R397 to i64
  %R398 = icmp eq i64 %6, 0
  %R3984 = zext i1 %R398 to i32
  %cond = icmp ne i32 %R3984, 0
  br i1 %cond, label %L167, label %L168

L167:                                             ; preds = %L166
  br label %L169

L168:                                             ; preds = %L166
  %root_000001C401BE6148.5 = ptrtoint %struct.AVLNode_st** %root_000001C401BE6148. to i64
  %7 = add i64 %root_000001C401BE6148.5, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  %R399 = load %struct.AVLNode_st*, %struct.AVLNode_st** %8
  %R3996 = ptrtoint %struct.AVLNode_st* %R399 to i64
  %9 = add i64 %R3996, 16
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R400 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %funcptr_000001C401BE6308.7 = ptrtoint void (i8*)** %funcptr_000001C401BE6308. to i64
  %11 = add i64 %funcptr_000001C401BE6308.7, 0
  %12 = inttoptr i64 %11 to void (i8*)**
  %R401 = load void (i8*)*, void (i8*)** %12
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %R400, void (i8*)* %R401)
  %root_000001C401BE6148.8 = ptrtoint %struct.AVLNode_st** %root_000001C401BE6148. to i64
  %13 = add i64 %root_000001C401BE6148.8, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  %R402 = load %struct.AVLNode_st*, %struct.AVLNode_st** %14
  %R4029 = ptrtoint %struct.AVLNode_st* %R402 to i64
  %R403 = add i64 %R4029, 32
  %R40310 = inttoptr i64 %R403 to %struct.AVLNode_st*
  %R404 = bitcast %struct.AVLNode_st* %R40310 to i8*
  %funcptr_000001C401BE6308.11 = ptrtoint void (i8*)** %funcptr_000001C401BE6308. to i64
  %15 = add i64 %funcptr_000001C401BE6308.11, 0
  %16 = inttoptr i64 %15 to void (i8*)**
  %R405 = load void (i8*)*, void (i8*)** %16
  %17 = bitcast void (i8*)* %R405 to i8*
  %18 = bitcast i8* %17 to void (i8*)*
  call void %18(i8* %R404)
  %root_000001C401BE6148.12 = ptrtoint %struct.AVLNode_st** %root_000001C401BE6148. to i64
  %19 = add i64 %root_000001C401BE6148.12, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R406 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %R40613 = ptrtoint %struct.AVLNode_st* %R406 to i64
  %21 = add i64 %R40613, 8
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %R407 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %funcptr_000001C401BE6308.14 = ptrtoint void (i8*)** %funcptr_000001C401BE6308. to i64
  %23 = add i64 %funcptr_000001C401BE6308.14, 0
  %24 = inttoptr i64 %23 to void (i8*)**
  %R408 = load void (i8*)*, void (i8*)** %24
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %R407, void (i8*)* %R408)
  br label %L169

L169:                                             ; preds = %L168, %L167
  ret void
}

define void @AVLTree_Backeach(%struct.avltree* %ARG1, void (i8*)* %ARG2) {
L170:
  %funcptr_000001C401BE6F48. = alloca void (i8*)*
  %tree_000001C401BE6D88. = alloca %struct.avltree*
  %tree_000001C401BE6D88.1 = ptrtoint %struct.avltree** %tree_000001C401BE6D88. to i64
  %0 = add i64 %tree_000001C401BE6D88.1, 0
  %1 = inttoptr i64 %0 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %1
  %funcptr_000001C401BE6F48.2 = ptrtoint void (i8*)** %funcptr_000001C401BE6F48. to i64
  %2 = add i64 %funcptr_000001C401BE6F48.2, 0
  %3 = inttoptr i64 %2 to void (i8*)**
  store void (i8*)* %ARG2, void (i8*)** %3
  %tree_000001C401BE6D88.3 = ptrtoint %struct.avltree** %tree_000001C401BE6D88. to i64
  %4 = add i64 %tree_000001C401BE6D88.3, 0
  %5 = inttoptr i64 %4 to %struct.avltree**
  %R409 = load %struct.avltree*, %struct.avltree** %5
  %R4094 = ptrtoint %struct.avltree* %R409 to i64
  %6 = add i64 %R4094, 8
  %7 = inttoptr i64 %6 to i8**
  %R410 = load i8*, i8** %7
  %R411 = bitcast i8* %R410 to %struct.AVLNode_st*
  %funcptr_000001C401BE6F48.5 = ptrtoint void (i8*)** %funcptr_000001C401BE6F48. to i64
  %8 = add i64 %funcptr_000001C401BE6F48.5, 0
  %9 = inttoptr i64 %8 to void (i8*)**
  %R412 = load void (i8*)*, void (i8*)** %9
  call void @AVLTree_BackwardApply(%struct.AVLNode_st* %R411, void (i8*)* %R412)
  br label %L171

L171:                                             ; preds = %L170
  ret void
}

define void @AVLTree_ForwardApply(%struct.AVLNode_st* %ARG1, void (i8*)* %ARG2) {
L172:
  %funcptr_000001C401BE79C8. = alloca void (i8*)*
  %root_000001C401BE7808. = alloca %struct.AVLNode_st*
  %root_000001C401BE7808.1 = ptrtoint %struct.AVLNode_st** %root_000001C401BE7808. to i64
  %0 = add i64 %root_000001C401BE7808.1, 0
  %1 = inttoptr i64 %0 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %ARG1, %struct.AVLNode_st** %1
  %funcptr_000001C401BE79C8.2 = ptrtoint void (i8*)** %funcptr_000001C401BE79C8. to i64
  %2 = add i64 %funcptr_000001C401BE79C8.2, 0
  %3 = inttoptr i64 %2 to void (i8*)**
  store void (i8*)* %ARG2, void (i8*)** %3
  %root_000001C401BE7808.3 = ptrtoint %struct.AVLNode_st** %root_000001C401BE7808. to i64
  %4 = add i64 %root_000001C401BE7808.3, 0
  %5 = inttoptr i64 %4 to %struct.AVLNode_st**
  %R413 = load %struct.AVLNode_st*, %struct.AVLNode_st** %5
  %6 = ptrtoint %struct.AVLNode_st* %R413 to i64
  %R414 = icmp eq i64 %6, 0
  %R4144 = zext i1 %R414 to i32
  %cond = icmp ne i32 %R4144, 0
  br i1 %cond, label %L173, label %L174

L173:                                             ; preds = %L172
  br label %L175

L174:                                             ; preds = %L172
  %root_000001C401BE7808.5 = ptrtoint %struct.AVLNode_st** %root_000001C401BE7808. to i64
  %7 = add i64 %root_000001C401BE7808.5, 0
  %8 = inttoptr i64 %7 to %struct.AVLNode_st**
  %R415 = load %struct.AVLNode_st*, %struct.AVLNode_st** %8
  %R4156 = ptrtoint %struct.AVLNode_st* %R415 to i64
  %9 = add i64 %R4156, 8
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  %R416 = load %struct.AVLNode_st*, %struct.AVLNode_st** %10
  %funcptr_000001C401BE79C8.7 = ptrtoint void (i8*)** %funcptr_000001C401BE79C8. to i64
  %11 = add i64 %funcptr_000001C401BE79C8.7, 0
  %12 = inttoptr i64 %11 to void (i8*)**
  %R417 = load void (i8*)*, void (i8*)** %12
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %R416, void (i8*)* %R417)
  %root_000001C401BE7808.8 = ptrtoint %struct.AVLNode_st** %root_000001C401BE7808. to i64
  %13 = add i64 %root_000001C401BE7808.8, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  %R418 = load %struct.AVLNode_st*, %struct.AVLNode_st** %14
  %R4189 = ptrtoint %struct.AVLNode_st* %R418 to i64
  %R419 = add i64 %R4189, 32
  %R41910 = inttoptr i64 %R419 to %struct.AVLNode_st*
  %R420 = bitcast %struct.AVLNode_st* %R41910 to i8*
  %funcptr_000001C401BE79C8.11 = ptrtoint void (i8*)** %funcptr_000001C401BE79C8. to i64
  %15 = add i64 %funcptr_000001C401BE79C8.11, 0
  %16 = inttoptr i64 %15 to void (i8*)**
  %R421 = load void (i8*)*, void (i8*)** %16
  %17 = bitcast void (i8*)* %R421 to i8*
  %18 = bitcast i8* %17 to void (i8*)*
  call void %18(i8* %R420)
  %root_000001C401BE7808.12 = ptrtoint %struct.AVLNode_st** %root_000001C401BE7808. to i64
  %19 = add i64 %root_000001C401BE7808.12, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R422 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %R42213 = ptrtoint %struct.AVLNode_st* %R422 to i64
  %21 = add i64 %R42213, 16
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  %R423 = load %struct.AVLNode_st*, %struct.AVLNode_st** %22
  %funcptr_000001C401BE79C8.14 = ptrtoint void (i8*)** %funcptr_000001C401BE79C8. to i64
  %23 = add i64 %funcptr_000001C401BE79C8.14, 0
  %24 = inttoptr i64 %23 to void (i8*)**
  %R424 = load void (i8*)*, void (i8*)** %24
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %R423, void (i8*)* %R424)
  br label %L175

L175:                                             ; preds = %L174, %L173
  ret void
}

define void @AVLTree_Foreach(%struct.avltree* %ARG1, void (i8*)* %ARG2) {
L176:
  %funcptr_000001C401BF06C8. = alloca void (i8*)*
  %tree_000001C401BF0508. = alloca %struct.avltree*
  %tree_000001C401BF0508.1 = ptrtoint %struct.avltree** %tree_000001C401BF0508. to i64
  %0 = add i64 %tree_000001C401BF0508.1, 0
  %1 = inttoptr i64 %0 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %1
  %funcptr_000001C401BF06C8.2 = ptrtoint void (i8*)** %funcptr_000001C401BF06C8. to i64
  %2 = add i64 %funcptr_000001C401BF06C8.2, 0
  %3 = inttoptr i64 %2 to void (i8*)**
  store void (i8*)* %ARG2, void (i8*)** %3
  %tree_000001C401BF0508.3 = ptrtoint %struct.avltree** %tree_000001C401BF0508. to i64
  %4 = add i64 %tree_000001C401BF0508.3, 0
  %5 = inttoptr i64 %4 to %struct.avltree**
  %R425 = load %struct.avltree*, %struct.avltree** %5
  %R4254 = ptrtoint %struct.avltree* %R425 to i64
  %6 = add i64 %R4254, 8
  %7 = inttoptr i64 %6 to i8**
  %R426 = load i8*, i8** %7
  %R427 = bitcast i8* %R426 to %struct.AVLNode_st*
  %funcptr_000001C401BF06C8.5 = ptrtoint void (i8*)** %funcptr_000001C401BF06C8. to i64
  %8 = add i64 %funcptr_000001C401BF06C8.5, 0
  %9 = inttoptr i64 %8 to void (i8*)**
  %R428 = load void (i8*)*, void (i8*)** %9
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %R427, void (i8*)* %R428)
  br label %L177

L177:                                             ; preds = %L176
  ret void
}

define %struct.AVLNode_st* @AVL_new(%struct.avltree* %ARG1, i8* %ARG2) {
L178:
  %n_000001C401BF1688. = alloca %struct.AVLNode_st*
  %vtbl_000001C401BF14C8. = alloca %struct.avl_vtbl*
  %key_000001C401BF1228. = alloca i8*
  %tree_000001C401BF1068. = alloca %struct.avltree*
  %0 = alloca %struct.AVLNode_st*
  %tree_000001C401BF1068.1 = ptrtoint %struct.avltree** %tree_000001C401BF1068. to i64
  %1 = add i64 %tree_000001C401BF1068.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %key_000001C401BF1228.2 = ptrtoint i8** %key_000001C401BF1228. to i64
  %3 = add i64 %key_000001C401BF1228.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %tree_000001C401BF1068.3 = ptrtoint %struct.avltree** %tree_000001C401BF1068. to i64
  %5 = add i64 %tree_000001C401BF1068.3, 0
  %6 = inttoptr i64 %5 to %struct.avltree**
  %R429 = load %struct.avltree*, %struct.avltree** %6
  %R4294 = ptrtoint %struct.avltree* %R429 to i64
  %7 = add i64 %R4294, 0
  %8 = inttoptr i64 %7 to %struct.avl_vtbl**
  %R430 = load %struct.avl_vtbl*, %struct.avl_vtbl** %8
  %vtbl_000001C401BF14C8.5 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF14C8. to i64
  %9 = add i64 %vtbl_000001C401BF14C8.5, 0
  %10 = inttoptr i64 %9 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %R430, %struct.avl_vtbl** %10
  %tree_000001C401BF1068.6 = ptrtoint %struct.avltree** %tree_000001C401BF1068. to i64
  %11 = add i64 %tree_000001C401BF1068.6, 0
  %12 = inttoptr i64 %11 to %struct.avltree**
  %R431 = load %struct.avltree*, %struct.avltree** %12
  %R4317 = ptrtoint %struct.avltree* %R431 to i64
  %13 = add i64 %R4317, 24
  %14 = inttoptr i64 %13 to %struct.allocator_st**
  %R432 = load %struct.allocator_st*, %struct.allocator_st** %14
  %R433 = call i8* @alloc_node(%struct.allocator_st* %R432)
  %R434 = bitcast i8* %R433 to %struct.AVLNode_st*
  %n_000001C401BF1688.8 = ptrtoint %struct.AVLNode_st** %n_000001C401BF1688. to i64
  %15 = add i64 %n_000001C401BF1688.8, 0
  %16 = inttoptr i64 %15 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R434, %struct.AVLNode_st** %16
  %n_000001C401BF1688.9 = ptrtoint %struct.AVLNode_st** %n_000001C401BF1688. to i64
  %17 = add i64 %n_000001C401BF1688.9, 0
  %18 = inttoptr i64 %17 to %struct.AVLNode_st**
  %R435 = load %struct.AVLNode_st*, %struct.AVLNode_st** %18
  %19 = ptrtoint %struct.AVLNode_st* %R435 to i64
  %R436 = icmp eq i64 %19, 0
  %R43610 = zext i1 %R436 to i32
  %cond = icmp ne i32 %R43610, 0
  br i1 %cond, label %L179, label %L180

L179:                                             ; preds = %L178
  call void @exit(i32 -1)
  br label %L180

L180:                                             ; preds = %L179, %L178
  %n_000001C401BF1688.11 = ptrtoint %struct.AVLNode_st** %n_000001C401BF1688. to i64
  %20 = add i64 %n_000001C401BF1688.11, 0
  %21 = inttoptr i64 %20 to %struct.AVLNode_st**
  %R437 = load %struct.AVLNode_st*, %struct.AVLNode_st** %21
  %R43712 = ptrtoint %struct.AVLNode_st* %R437 to i64
  %22 = add i64 %R43712, 0
  %23 = inttoptr i64 %22 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %23
  %n_000001C401BF1688.13 = ptrtoint %struct.AVLNode_st** %n_000001C401BF1688. to i64
  %24 = add i64 %n_000001C401BF1688.13, 0
  %25 = inttoptr i64 %24 to %struct.AVLNode_st**
  %R438 = load %struct.AVLNode_st*, %struct.AVLNode_st** %25
  %R43814 = ptrtoint %struct.AVLNode_st* %R438 to i64
  %26 = add i64 %R43814, 16
  %27 = inttoptr i64 %26 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %27
  %n_000001C401BF1688.15 = ptrtoint %struct.AVLNode_st** %n_000001C401BF1688. to i64
  %28 = add i64 %n_000001C401BF1688.15, 0
  %29 = inttoptr i64 %28 to %struct.AVLNode_st**
  %R439 = load %struct.AVLNode_st*, %struct.AVLNode_st** %29
  %R43916 = ptrtoint %struct.AVLNode_st* %R439 to i64
  %30 = add i64 %R43916, 8
  %31 = inttoptr i64 %30 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %31
  %n_000001C401BF1688.17 = ptrtoint %struct.AVLNode_st** %n_000001C401BF1688. to i64
  %32 = add i64 %n_000001C401BF1688.17, 0
  %33 = inttoptr i64 %32 to %struct.AVLNode_st**
  %R440 = load %struct.AVLNode_st*, %struct.AVLNode_st** %33
  %R44018 = ptrtoint %struct.AVLNode_st* %R440 to i64
  %34 = add i64 %R44018, 24
  %35 = inttoptr i64 %34 to i32*
  store i32 0, i32* %35
  %vtbl_000001C401BF14C8.19 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF14C8. to i64
  %36 = add i64 %vtbl_000001C401BF14C8.19, 0
  %37 = inttoptr i64 %36 to %struct.avl_vtbl**
  %R441 = load %struct.avl_vtbl*, %struct.avl_vtbl** %37
  %R44120 = ptrtoint %struct.avl_vtbl* %R441 to i64
  %38 = add i64 %R44120, 8
  %39 = inttoptr i64 %38 to void (i8*, i8*)**
  %R442 = load void (i8*, i8*)*, void (i8*, i8*)** %39
  %40 = ptrtoint void (i8*, i8*)* %R442 to i64
  %R443 = icmp ne i64 %40, 0
  %R44321 = zext i1 %R443 to i32
  %cond22 = icmp ne i32 %R44321, 0
  br i1 %cond22, label %L181, label %L182

L181:                                             ; preds = %L180
  %n_000001C401BF1688.23 = ptrtoint %struct.AVLNode_st** %n_000001C401BF1688. to i64
  %41 = add i64 %n_000001C401BF1688.23, 0
  %42 = inttoptr i64 %41 to %struct.AVLNode_st**
  %R444 = load %struct.AVLNode_st*, %struct.AVLNode_st** %42
  %R44424 = ptrtoint %struct.AVLNode_st* %R444 to i64
  %R445 = add i64 %R44424, 32
  %R44525 = inttoptr i64 %R445 to %struct.AVLNode_st*
  %R446 = bitcast %struct.AVLNode_st* %R44525 to i8*
  %key_000001C401BF1228.26 = ptrtoint i8** %key_000001C401BF1228. to i64
  %43 = add i64 %key_000001C401BF1228.26, 0
  %44 = inttoptr i64 %43 to i8**
  %R447 = load i8*, i8** %44
  %vtbl_000001C401BF14C8.27 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF14C8. to i64
  %45 = add i64 %vtbl_000001C401BF14C8.27, 0
  %46 = inttoptr i64 %45 to %struct.avl_vtbl**
  %R448 = load %struct.avl_vtbl*, %struct.avl_vtbl** %46
  %R44828 = ptrtoint %struct.avl_vtbl* %R448 to i64
  %47 = add i64 %R44828, 8
  %48 = inttoptr i64 %47 to void (i8*, i8*)**
  %R449 = load void (i8*, i8*)*, void (i8*, i8*)** %48
  %49 = bitcast void (i8*, i8*)* %R449 to i8*
  %50 = bitcast i8* %49 to void (i8*, i8*)*
  call void %50(i8* %R446, i8* %R447)
  br label %L183

L182:                                             ; preds = %L180
  br label %L183

L183:                                             ; preds = %L182, %L181
  %n_000001C401BF1688.29 = ptrtoint %struct.AVLNode_st** %n_000001C401BF1688. to i64
  %51 = add i64 %n_000001C401BF1688.29, 0
  %52 = inttoptr i64 %51 to %struct.AVLNode_st**
  %R450 = load %struct.AVLNode_st*, %struct.AVLNode_st** %52
  store %struct.AVLNode_st* %R450, %struct.AVLNode_st** %0
  br label %L184

L184:                                             ; preds = %L183
  %53 = load %struct.AVLNode_st*, %struct.AVLNode_st** %0
  ret %struct.AVLNode_st* %R450
}

define i8* @AVLTree_Insert(%struct.avltree* %ARG1, i8* %ARG2) {
L185:
  %compresult_000001C401BF3C28. = alloca i32
  %n_000001C401BF3528. = alloca %struct.AVLNode_st*
  %p_000001C401BF3368. = alloca %struct.AVLNode_st*
  %height_changed_000001C401BF3288. = alloca i32
  %vtbl_000001C401BF2B88. = alloca %struct.avl_vtbl*
  %found_000001C401BF29C8. = alloca %struct.AVLNode_st*
  %root_000001C401BF2808. = alloca %struct.AVLNode_st*
  %k_000001C401BF2568. = alloca i8*
  %tree_000001C401BF23A8. = alloca %struct.avltree*
  %0 = alloca i8*
  %tree_000001C401BF23A8.1 = ptrtoint %struct.avltree** %tree_000001C401BF23A8. to i64
  %1 = add i64 %tree_000001C401BF23A8.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %k_000001C401BF2568.2 = ptrtoint i8** %k_000001C401BF2568. to i64
  %3 = add i64 %k_000001C401BF2568.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %tree_000001C401BF23A8.3 = ptrtoint %struct.avltree** %tree_000001C401BF23A8. to i64
  %5 = add i64 %tree_000001C401BF23A8.3, 0
  %6 = inttoptr i64 %5 to %struct.avltree**
  %R452 = load %struct.avltree*, %struct.avltree** %6
  %R4524 = ptrtoint %struct.avltree* %R452 to i64
  %7 = add i64 %R4524, 8
  %8 = inttoptr i64 %7 to i8**
  %R453 = load i8*, i8** %8
  %R454 = bitcast i8* %R453 to %struct.AVLNode_st*
  %root_000001C401BF2808.5 = ptrtoint %struct.AVLNode_st** %root_000001C401BF2808. to i64
  %9 = add i64 %root_000001C401BF2808.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R454, %struct.AVLNode_st** %10
  %found_000001C401BF29C8.6 = ptrtoint %struct.AVLNode_st** %found_000001C401BF29C8. to i64
  %11 = add i64 %found_000001C401BF29C8.6, 0
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %12
  %tree_000001C401BF23A8.7 = ptrtoint %struct.avltree** %tree_000001C401BF23A8. to i64
  %13 = add i64 %tree_000001C401BF23A8.7, 0
  %14 = inttoptr i64 %13 to %struct.avltree**
  %R455 = load %struct.avltree*, %struct.avltree** %14
  %R4558 = ptrtoint %struct.avltree* %R455 to i64
  %15 = add i64 %R4558, 0
  %16 = inttoptr i64 %15 to %struct.avl_vtbl**
  %R456 = load %struct.avl_vtbl*, %struct.avl_vtbl** %16
  %vtbl_000001C401BF2B88.9 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF2B88. to i64
  %17 = add i64 %vtbl_000001C401BF2B88.9, 0
  %18 = inttoptr i64 %17 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %R456, %struct.avl_vtbl** %18
  %root_000001C401BF2808.10 = ptrtoint %struct.AVLNode_st** %root_000001C401BF2808. to i64
  %19 = add i64 %root_000001C401BF2808.10, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R457 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %21 = ptrtoint %struct.AVLNode_st* %R457 to i64
  %R458 = icmp eq i64 %21, 0
  %R45811 = zext i1 %R458 to i32
  %cond = icmp ne i32 %R45811, 0
  br i1 %cond, label %L186, label %L187

L186:                                             ; preds = %L185
  %tree_000001C401BF23A8.12 = ptrtoint %struct.avltree** %tree_000001C401BF23A8. to i64
  %22 = add i64 %tree_000001C401BF23A8.12, 0
  %23 = inttoptr i64 %22 to %struct.avltree**
  %R459 = load %struct.avltree*, %struct.avltree** %23
  %k_000001C401BF2568.13 = ptrtoint i8** %k_000001C401BF2568. to i64
  %24 = add i64 %k_000001C401BF2568.13, 0
  %25 = inttoptr i64 %24 to i8**
  %R460 = load i8*, i8** %25
  %R461 = call %struct.AVLNode_st* @AVL_new(%struct.avltree* %R459, i8* %R460)
  %root_000001C401BF2808.14 = ptrtoint %struct.AVLNode_st** %root_000001C401BF2808. to i64
  %26 = add i64 %root_000001C401BF2808.14, 0
  %27 = inttoptr i64 %26 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R461, %struct.AVLNode_st** %27
  %found_000001C401BF29C8.15 = ptrtoint %struct.AVLNode_st** %found_000001C401BF29C8. to i64
  %28 = add i64 %found_000001C401BF29C8.15, 0
  %29 = inttoptr i64 %28 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R461, %struct.AVLNode_st** %29
  br label %L209

L187:                                             ; preds = %L185
  %height_changed_000001C401BF3288.16 = ptrtoint i32* %height_changed_000001C401BF3288. to i64
  %30 = add i64 %height_changed_000001C401BF3288.16, 0
  %31 = inttoptr i64 %30 to i32*
  store i32 0, i32* %31
  %p_000001C401BF3368.17 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %32 = add i64 %p_000001C401BF3368.17, 0
  %33 = inttoptr i64 %32 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %33
  %n_000001C401BF3528.18 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %34 = add i64 %n_000001C401BF3528.18, 0
  %35 = inttoptr i64 %34 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %35
  %root_000001C401BF2808.19 = ptrtoint %struct.AVLNode_st** %root_000001C401BF2808. to i64
  %36 = add i64 %root_000001C401BF2808.19, 0
  %37 = inttoptr i64 %36 to %struct.AVLNode_st**
  %R462 = load %struct.AVLNode_st*, %struct.AVLNode_st** %37
  %n_000001C401BF3528.20 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %38 = add i64 %n_000001C401BF3528.20, 0
  %39 = inttoptr i64 %38 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R462, %struct.AVLNode_st** %39
  br label %L188

L188:                                             ; preds = %L195, %L187
  %compresult_000001C401BF3C28.21 = ptrtoint i32* %compresult_000001C401BF3C28. to i64
  %40 = add i64 %compresult_000001C401BF3C28.21, 0
  %41 = inttoptr i64 %40 to i32*
  store i32 0, i32* %41
  %n_000001C401BF3528.22 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %42 = add i64 %n_000001C401BF3528.22, 0
  %43 = inttoptr i64 %42 to %struct.AVLNode_st**
  %R463 = load %struct.AVLNode_st*, %struct.AVLNode_st** %43
  %p_000001C401BF3368.23 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %44 = add i64 %p_000001C401BF3368.23, 0
  %45 = inttoptr i64 %44 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R463, %struct.AVLNode_st** %45
  %k_000001C401BF2568.24 = ptrtoint i8** %k_000001C401BF2568. to i64
  %46 = add i64 %k_000001C401BF2568.24, 0
  %47 = inttoptr i64 %46 to i8**
  %R464 = load i8*, i8** %47
  %n_000001C401BF3528.25 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %48 = add i64 %n_000001C401BF3528.25, 0
  %49 = inttoptr i64 %48 to %struct.AVLNode_st**
  %R465 = load %struct.AVLNode_st*, %struct.AVLNode_st** %49
  %R46526 = ptrtoint %struct.AVLNode_st* %R465 to i64
  %R466 = add i64 %R46526, 32
  %R46627 = inttoptr i64 %R466 to %struct.AVLNode_st*
  %R467 = bitcast %struct.AVLNode_st* %R46627 to i8*
  %vtbl_000001C401BF2B88.28 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF2B88. to i64
  %50 = add i64 %vtbl_000001C401BF2B88.28, 0
  %51 = inttoptr i64 %50 to %struct.avl_vtbl**
  %R468 = load %struct.avl_vtbl*, %struct.avl_vtbl** %51
  %R46829 = ptrtoint %struct.avl_vtbl* %R468 to i64
  %52 = add i64 %R46829, 0
  %53 = inttoptr i64 %52 to i32 (i8*, i8*)**
  %R469 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %53
  %R470 = bitcast i32 (i8*, i8*)* %R469 to i8*
  %R47030 = bitcast i8* %R470 to i32 (i8*, i8*)*
  %R47031 = call i32 %R47030(i8* %R464, i8* %R467)
  %compresult_000001C401BF3C28.32 = ptrtoint i32* %compresult_000001C401BF3C28. to i64
  %54 = add i64 %compresult_000001C401BF3C28.32, 0
  %55 = inttoptr i64 %54 to i32*
  store i32 %R47031, i32* %55
  %compresult_000001C401BF3C28.33 = ptrtoint i32* %compresult_000001C401BF3C28. to i64
  %56 = add i64 %compresult_000001C401BF3C28.33, 0
  %57 = inttoptr i64 %56 to i32*
  %R471 = load i32, i32* %57
  %R472 = icmp slt i32 %R471, 0
  %R47234 = zext i1 %R472 to i32
  %cond35 = icmp ne i32 %R47234, 0
  br i1 %cond35, label %L189, label %L190

L189:                                             ; preds = %L188
  %p_000001C401BF3368.36 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %58 = add i64 %p_000001C401BF3368.36, 0
  %59 = inttoptr i64 %58 to %struct.AVLNode_st**
  %R473 = load %struct.AVLNode_st*, %struct.AVLNode_st** %59
  %R47337 = ptrtoint %struct.AVLNode_st* %R473 to i64
  %60 = add i64 %R47337, 8
  %61 = inttoptr i64 %60 to %struct.AVLNode_st**
  %R474 = load %struct.AVLNode_st*, %struct.AVLNode_st** %61
  %n_000001C401BF3528.38 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %62 = add i64 %n_000001C401BF3528.38, 0
  %63 = inttoptr i64 %62 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R474, %struct.AVLNode_st** %63
  br label %L194

L190:                                             ; preds = %L188
  %compresult_000001C401BF3C28.39 = ptrtoint i32* %compresult_000001C401BF3C28. to i64
  %64 = add i64 %compresult_000001C401BF3C28.39, 0
  %65 = inttoptr i64 %64 to i32*
  %R475 = load i32, i32* %65
  %R476 = icmp sgt i32 %R475, 0
  %R47640 = zext i1 %R476 to i32
  %cond41 = icmp ne i32 %R47640, 0
  br i1 %cond41, label %L191, label %L192

L191:                                             ; preds = %L190
  %p_000001C401BF3368.42 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %66 = add i64 %p_000001C401BF3368.42, 0
  %67 = inttoptr i64 %66 to %struct.AVLNode_st**
  %R477 = load %struct.AVLNode_st*, %struct.AVLNode_st** %67
  %R47743 = ptrtoint %struct.AVLNode_st* %R477 to i64
  %68 = add i64 %R47743, 16
  %69 = inttoptr i64 %68 to %struct.AVLNode_st**
  %R478 = load %struct.AVLNode_st*, %struct.AVLNode_st** %69
  %n_000001C401BF3528.44 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %70 = add i64 %n_000001C401BF3528.44, 0
  %71 = inttoptr i64 %70 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R478, %struct.AVLNode_st** %71
  br label %L193

L192:                                             ; preds = %L190
  %n_000001C401BF3528.45 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %72 = add i64 %n_000001C401BF3528.45, 0
  %73 = inttoptr i64 %72 to %struct.AVLNode_st**
  %R479 = load %struct.AVLNode_st*, %struct.AVLNode_st** %73
  %R47946 = ptrtoint %struct.AVLNode_st* %R479 to i64
  %R480 = add i64 %R47946, 32
  %R48047 = inttoptr i64 %R480 to %struct.AVLNode_st*
  %R481 = bitcast %struct.AVLNode_st* %R48047 to i8*
  store i8* %R481, i8** %0
  br label %L210

L193:                                             ; preds = %L191
  br label %L194

L194:                                             ; preds = %L193, %L189
  br label %L195

L195:                                             ; preds = %L194
  %n_000001C401BF3528.48 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %74 = add i64 %n_000001C401BF3528.48, 0
  %75 = inttoptr i64 %74 to %struct.AVLNode_st**
  %R483 = load %struct.AVLNode_st*, %struct.AVLNode_st** %75
  %76 = ptrtoint %struct.AVLNode_st* %R483 to i64
  %R484 = icmp ne i64 %76, 0
  %R48449 = zext i1 %R484 to i32
  %cond50 = icmp ne i32 %R48449, 0
  br i1 %cond50, label %L188, label %L196

L196:                                             ; preds = %L195
  %tree_000001C401BF23A8.51 = ptrtoint %struct.avltree** %tree_000001C401BF23A8. to i64
  %77 = add i64 %tree_000001C401BF23A8.51, 0
  %78 = inttoptr i64 %77 to %struct.avltree**
  %R485 = load %struct.avltree*, %struct.avltree** %78
  %k_000001C401BF2568.52 = ptrtoint i8** %k_000001C401BF2568. to i64
  %79 = add i64 %k_000001C401BF2568.52, 0
  %80 = inttoptr i64 %79 to i8**
  %R486 = load i8*, i8** %80
  %R487 = call %struct.AVLNode_st* @AVL_new(%struct.avltree* %R485, i8* %R486)
  %n_000001C401BF3528.53 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %81 = add i64 %n_000001C401BF3528.53, 0
  %82 = inttoptr i64 %81 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %82
  %found_000001C401BF29C8.54 = ptrtoint %struct.AVLNode_st** %found_000001C401BF29C8. to i64
  %83 = add i64 %found_000001C401BF29C8.54, 0
  %84 = inttoptr i64 %83 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R487, %struct.AVLNode_st** %84
  %k_000001C401BF2568.55 = ptrtoint i8** %k_000001C401BF2568. to i64
  %85 = add i64 %k_000001C401BF2568.55, 0
  %86 = inttoptr i64 %85 to i8**
  %R488 = load i8*, i8** %86
  %p_000001C401BF3368.56 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %87 = add i64 %p_000001C401BF3368.56, 0
  %88 = inttoptr i64 %87 to %struct.AVLNode_st**
  %R489 = load %struct.AVLNode_st*, %struct.AVLNode_st** %88
  %R48957 = ptrtoint %struct.AVLNode_st* %R489 to i64
  %R490 = add i64 %R48957, 32
  %R49058 = inttoptr i64 %R490 to %struct.AVLNode_st*
  %R491 = bitcast %struct.AVLNode_st* %R49058 to i8*
  %vtbl_000001C401BF2B88.59 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF2B88. to i64
  %89 = add i64 %vtbl_000001C401BF2B88.59, 0
  %90 = inttoptr i64 %89 to %struct.avl_vtbl**
  %R492 = load %struct.avl_vtbl*, %struct.avl_vtbl** %90
  %R49260 = ptrtoint %struct.avl_vtbl* %R492 to i64
  %91 = add i64 %R49260, 0
  %92 = inttoptr i64 %91 to i32 (i8*, i8*)**
  %R493 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %92
  %R494 = bitcast i32 (i8*, i8*)* %R493 to i8*
  %R49461 = bitcast i8* %R494 to i32 (i8*, i8*)*
  %R49462 = call i32 %R49461(i8* %R488, i8* %R491)
  %R495 = icmp slt i32 %R49462, 0
  %R49563 = zext i1 %R495 to i32
  %cond64 = icmp ne i32 %R49563, 0
  br i1 %cond64, label %L197, label %L198

L197:                                             ; preds = %L196
  %p_000001C401BF3368.65 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %93 = add i64 %p_000001C401BF3368.65, 0
  %94 = inttoptr i64 %93 to %struct.AVLNode_st**
  %R496 = load %struct.AVLNode_st*, %struct.AVLNode_st** %94
  %n_000001C401BF3528.66 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %95 = add i64 %n_000001C401BF3528.66, 0
  %96 = inttoptr i64 %95 to %struct.AVLNode_st**
  %R497 = load %struct.AVLNode_st*, %struct.AVLNode_st** %96
  call void @AVL_SetLeft(%struct.AVLNode_st* %R496, %struct.AVLNode_st* %R497)
  br label %L199

L198:                                             ; preds = %L196
  %p_000001C401BF3368.67 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %97 = add i64 %p_000001C401BF3368.67, 0
  %98 = inttoptr i64 %97 to %struct.AVLNode_st**
  %R498 = load %struct.AVLNode_st*, %struct.AVLNode_st** %98
  %n_000001C401BF3528.68 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %99 = add i64 %n_000001C401BF3528.68, 0
  %100 = inttoptr i64 %99 to %struct.AVLNode_st**
  %R499 = load %struct.AVLNode_st*, %struct.AVLNode_st** %100
  call void @AVL_SetRight(%struct.AVLNode_st* %R498, %struct.AVLNode_st* %R499)
  br label %L199

L199:                                             ; preds = %L198, %L197
  %height_changed_000001C401BF3288.69 = ptrtoint i32* %height_changed_000001C401BF3288. to i64
  %101 = add i64 %height_changed_000001C401BF3288.69, 0
  %102 = inttoptr i64 %101 to i32*
  store i32 1, i32* %102
  br label %L200

L200:                                             ; preds = %L205, %L199
  %p_000001C401BF3368.70 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %103 = add i64 %p_000001C401BF3368.70, 0
  %104 = inttoptr i64 %103 to %struct.AVLNode_st**
  %R500 = load %struct.AVLNode_st*, %struct.AVLNode_st** %104
  %105 = ptrtoint %struct.AVLNode_st* %R500 to i64
  %R501 = icmp ne i64 %105, 0
  %R50171 = zext i1 %R501 to i32
  %height_changed_000001C401BF3288.72 = ptrtoint i32* %height_changed_000001C401BF3288. to i64
  %106 = add i64 %height_changed_000001C401BF3288.72, 0
  %107 = inttoptr i64 %106 to i32*
  %R502 = load i32, i32* %107
  %108 = icmp ne i32 %R50171, 0
  %109 = icmp ne i32 %R502, 0
  %R503 = and i1 %108, %109
  %R50373 = zext i1 %R503 to i32
  %cond74 = icmp ne i32 %R50373, 0
  br i1 %cond74, label %L201, label %L206

L201:                                             ; preds = %L200
  %n_000001C401BF3528.75 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %110 = add i64 %n_000001C401BF3528.75, 0
  %111 = inttoptr i64 %110 to %struct.AVLNode_st**
  %R504 = load %struct.AVLNode_st*, %struct.AVLNode_st** %111
  %p_000001C401BF3368.76 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %112 = add i64 %p_000001C401BF3368.76, 0
  %113 = inttoptr i64 %112 to %struct.AVLNode_st**
  %R505 = load %struct.AVLNode_st*, %struct.AVLNode_st** %113
  %R50577 = ptrtoint %struct.AVLNode_st* %R505 to i64
  %114 = add i64 %R50577, 8
  %115 = inttoptr i64 %114 to %struct.AVLNode_st**
  %R506 = load %struct.AVLNode_st*, %struct.AVLNode_st** %115
  %116 = ptrtoint %struct.AVLNode_st* %R504 to i64
  %117 = ptrtoint %struct.AVLNode_st* %R506 to i64
  %R507 = icmp eq i64 %116, %117
  %R50778 = zext i1 %R507 to i32
  %cond79 = icmp ne i32 %R50778, 0
  br i1 %cond79, label %L202, label %L203

L202:                                             ; preds = %L201
  %p_000001C401BF3368.80 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %118 = add i64 %p_000001C401BF3368.80, 0
  %119 = inttoptr i64 %118 to %struct.AVLNode_st**
  %R508 = load %struct.AVLNode_st*, %struct.AVLNode_st** %119
  %R510 = call %struct.AVLNode_st* @AVL_RebalanceHeavierLeft(%struct.AVLNode_st* %R508, i32* %height_changed_000001C401BF3288.)
  %p_000001C401BF3368.81 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %120 = add i64 %p_000001C401BF3368.81, 0
  %121 = inttoptr i64 %120 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R510, %struct.AVLNode_st** %121
  br label %L204

L203:                                             ; preds = %L201
  %p_000001C401BF3368.82 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %122 = add i64 %p_000001C401BF3368.82, 0
  %123 = inttoptr i64 %122 to %struct.AVLNode_st**
  %R511 = load %struct.AVLNode_st*, %struct.AVLNode_st** %123
  %R513 = call %struct.AVLNode_st* @AVL_RebalanceHeavierRight(%struct.AVLNode_st* %R511, i32* %height_changed_000001C401BF3288.)
  %p_000001C401BF3368.83 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %124 = add i64 %p_000001C401BF3368.83, 0
  %125 = inttoptr i64 %124 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R513, %struct.AVLNode_st** %125
  br label %L204

L204:                                             ; preds = %L203, %L202
  %p_000001C401BF3368.84 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %126 = add i64 %p_000001C401BF3368.84, 0
  %127 = inttoptr i64 %126 to %struct.AVLNode_st**
  %R514 = load %struct.AVLNode_st*, %struct.AVLNode_st** %127
  %n_000001C401BF3528.85 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %128 = add i64 %n_000001C401BF3528.85, 0
  %129 = inttoptr i64 %128 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R514, %struct.AVLNode_st** %129
  %p_000001C401BF3368.86 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %130 = add i64 %p_000001C401BF3368.86, 0
  %131 = inttoptr i64 %130 to %struct.AVLNode_st**
  %R515 = load %struct.AVLNode_st*, %struct.AVLNode_st** %131
  %R51587 = ptrtoint %struct.AVLNode_st* %R515 to i64
  %132 = add i64 %R51587, 0
  %133 = inttoptr i64 %132 to %struct.AVLNode_st**
  %R516 = load %struct.AVLNode_st*, %struct.AVLNode_st** %133
  %p_000001C401BF3368.88 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %134 = add i64 %p_000001C401BF3368.88, 0
  %135 = inttoptr i64 %134 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R516, %struct.AVLNode_st** %135
  br label %L205

L205:                                             ; preds = %L204
  br label %L200

L206:                                             ; preds = %L200
  %p_000001C401BF3368.89 = ptrtoint %struct.AVLNode_st** %p_000001C401BF3368. to i64
  %136 = add i64 %p_000001C401BF3368.89, 0
  %137 = inttoptr i64 %136 to %struct.AVLNode_st**
  %R517 = load %struct.AVLNode_st*, %struct.AVLNode_st** %137
  %138 = ptrtoint %struct.AVLNode_st* %R517 to i64
  %R518 = icmp eq i64 %138, 0
  %R51890 = zext i1 %R518 to i32
  %cond91 = icmp ne i32 %R51890, 0
  br i1 %cond91, label %L207, label %L208

L207:                                             ; preds = %L206
  %n_000001C401BF3528.92 = ptrtoint %struct.AVLNode_st** %n_000001C401BF3528. to i64
  %139 = add i64 %n_000001C401BF3528.92, 0
  %140 = inttoptr i64 %139 to %struct.AVLNode_st**
  %R519 = load %struct.AVLNode_st*, %struct.AVLNode_st** %140
  %root_000001C401BF2808.93 = ptrtoint %struct.AVLNode_st** %root_000001C401BF2808. to i64
  %141 = add i64 %root_000001C401BF2808.93, 0
  %142 = inttoptr i64 %141 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R519, %struct.AVLNode_st** %142
  br label %L208

L208:                                             ; preds = %L207, %L206
  br label %L209

L209:                                             ; preds = %L208, %L186
  %root_000001C401BF2808.94 = ptrtoint %struct.AVLNode_st** %root_000001C401BF2808. to i64
  %143 = add i64 %root_000001C401BF2808.94, 0
  %144 = inttoptr i64 %143 to %struct.AVLNode_st**
  %R520 = load %struct.AVLNode_st*, %struct.AVLNode_st** %144
  %R521 = bitcast %struct.AVLNode_st* %R520 to i8*
  %tree_000001C401BF23A8.95 = ptrtoint %struct.avltree** %tree_000001C401BF23A8. to i64
  %145 = add i64 %tree_000001C401BF23A8.95, 0
  %146 = inttoptr i64 %145 to %struct.avltree**
  %R522 = load %struct.avltree*, %struct.avltree** %146
  %R52296 = ptrtoint %struct.avltree* %R522 to i64
  %147 = add i64 %R52296, 8
  %148 = inttoptr i64 %147 to i8**
  store i8* %R521, i8** %148
  %found_000001C401BF29C8.97 = ptrtoint %struct.AVLNode_st** %found_000001C401BF29C8. to i64
  %149 = add i64 %found_000001C401BF29C8.97, 0
  %150 = inttoptr i64 %149 to %struct.AVLNode_st**
  %R523 = load %struct.AVLNode_st*, %struct.AVLNode_st** %150
  %R52398 = ptrtoint %struct.AVLNode_st* %R523 to i64
  %R524 = add i64 %R52398, 32
  %R52499 = inttoptr i64 %R524 to %struct.AVLNode_st*
  %R525 = bitcast %struct.AVLNode_st* %R52499 to i8*
  store i8* %R525, i8** %0
  br label %L210

L210:                                             ; preds = %L209, %L192
  %151 = load i8*, i8** %0
  ret i8* %151
}

define i32 @AVLTree_DeleteObject(%struct.avltree* %ARG1, i8* %ARG2) {
L211:
  %flag_000001C401BF5748. = alloca i32
  %vtbl_000001C401BF5588. = alloca %struct.avl_vtbl*
  %height_changed_000001C401BF54A8. = alloca i32
  %n_000001C401BF52E8. = alloca %struct.AVLNode_st*
  %p_000001C401BF5128. = alloca %struct.AVLNode_st*
  %discard_000001C401BF4F68. = alloca %struct.AVLNode_st*
  %root_000001C401BF4DA8. = alloca %struct.AVLNode_st*
  %obj_000001C401BF4B08. = alloca i8*
  %tree_000001C401BF4948. = alloca %struct.avltree*
  %0 = alloca i32
  %tree_000001C401BF4948.1 = ptrtoint %struct.avltree** %tree_000001C401BF4948. to i64
  %1 = add i64 %tree_000001C401BF4948.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %obj_000001C401BF4B08.2 = ptrtoint i8** %obj_000001C401BF4B08. to i64
  %3 = add i64 %obj_000001C401BF4B08.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %tree_000001C401BF4948.3 = ptrtoint %struct.avltree** %tree_000001C401BF4948. to i64
  %5 = add i64 %tree_000001C401BF4948.3, 0
  %6 = inttoptr i64 %5 to %struct.avltree**
  %R526 = load %struct.avltree*, %struct.avltree** %6
  %R5264 = ptrtoint %struct.avltree* %R526 to i64
  %7 = add i64 %R5264, 8
  %8 = inttoptr i64 %7 to i8**
  %R527 = load i8*, i8** %8
  %R528 = bitcast i8* %R527 to %struct.AVLNode_st*
  %root_000001C401BF4DA8.5 = ptrtoint %struct.AVLNode_st** %root_000001C401BF4DA8. to i64
  %9 = add i64 %root_000001C401BF4DA8.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R528, %struct.AVLNode_st** %10
  %discard_000001C401BF4F68.6 = ptrtoint %struct.AVLNode_st** %discard_000001C401BF4F68. to i64
  %11 = add i64 %discard_000001C401BF4F68.6, 0
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %12
  %p_000001C401BF5128.7 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %13 = add i64 %p_000001C401BF5128.7, 0
  %14 = inttoptr i64 %13 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %14
  %obj_000001C401BF4B08.8 = ptrtoint i8** %obj_000001C401BF4B08. to i64
  %15 = add i64 %obj_000001C401BF4B08.8, 0
  %16 = inttoptr i64 %15 to i8**
  %R529 = load i8*, i8** %16
  %R530 = bitcast i8* %R529 to %struct.AVLNode_st*
  %n_000001C401BF52E8.9 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %17 = add i64 %n_000001C401BF52E8.9, 0
  %18 = inttoptr i64 %17 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R530, %struct.AVLNode_st** %18
  %height_changed_000001C401BF54A8.10 = ptrtoint i32* %height_changed_000001C401BF54A8. to i64
  %19 = add i64 %height_changed_000001C401BF54A8.10, 0
  %20 = inttoptr i64 %19 to i32*
  store i32 0, i32* %20
  %tree_000001C401BF4948.11 = ptrtoint %struct.avltree** %tree_000001C401BF4948. to i64
  %21 = add i64 %tree_000001C401BF4948.11, 0
  %22 = inttoptr i64 %21 to %struct.avltree**
  %R531 = load %struct.avltree*, %struct.avltree** %22
  %R53112 = ptrtoint %struct.avltree* %R531 to i64
  %23 = add i64 %R53112, 0
  %24 = inttoptr i64 %23 to %struct.avl_vtbl**
  %R532 = load %struct.avl_vtbl*, %struct.avl_vtbl** %24
  %vtbl_000001C401BF5588.13 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %25 = add i64 %vtbl_000001C401BF5588.13, 0
  %26 = inttoptr i64 %25 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %R532, %struct.avl_vtbl** %26
  %flag_000001C401BF5748.14 = ptrtoint i32* %flag_000001C401BF5748. to i64
  %27 = add i64 %flag_000001C401BF5748.14, 0
  %28 = inttoptr i64 %27 to i32*
  store i32 0, i32* %28
  %n_000001C401BF52E8.15 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %29 = add i64 %n_000001C401BF52E8.15, 0
  %30 = inttoptr i64 %29 to %struct.AVLNode_st**
  %R533 = load %struct.AVLNode_st*, %struct.AVLNode_st** %30
  %31 = ptrtoint %struct.AVLNode_st* %R533 to i64
  %R534 = icmp eq i64 %31, 0
  %R53416 = zext i1 %R534 to i32
  %cond = icmp ne i32 %R53416, 0
  br i1 %cond, label %L212, label %L213

L212:                                             ; preds = %L211
  store i32 -1, i32* %0
  br label %L254

L213:                                             ; preds = %L211
  %n_000001C401BF52E8.17 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %32 = add i64 %n_000001C401BF52E8.17, 0
  %33 = inttoptr i64 %32 to %struct.AVLNode_st**
  %R536 = load %struct.AVLNode_st*, %struct.AVLNode_st** %33
  %R53618 = ptrtoint %struct.AVLNode_st* %R536 to i64
  %R537 = sub i64 %R53618, 32
  %R53719 = inttoptr i64 %R537 to %struct.AVLNode_st*
  %n_000001C401BF52E8.20 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %34 = add i64 %n_000001C401BF52E8.20, 0
  %35 = inttoptr i64 %34 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R53719, %struct.AVLNode_st** %35
  %n_000001C401BF52E8.21 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %36 = add i64 %n_000001C401BF52E8.21, 0
  %37 = inttoptr i64 %36 to %struct.AVLNode_st**
  %R538 = load %struct.AVLNode_st*, %struct.AVLNode_st** %37
  %R53822 = ptrtoint %struct.AVLNode_st* %R538 to i64
  %38 = add i64 %R53822, 8
  %39 = inttoptr i64 %38 to %struct.AVLNode_st**
  %R539 = load %struct.AVLNode_st*, %struct.AVLNode_st** %39
  %40 = ptrtoint %struct.AVLNode_st* %R539 to i64
  %R540 = icmp ne i64 %40, 0
  %R54023 = zext i1 %R540 to i32
  %cond24 = icmp ne i32 %R54023, 0
  br i1 %cond24, label %L214, label %L228

L214:                                             ; preds = %L213
  %n_000001C401BF52E8.25 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %41 = add i64 %n_000001C401BF52E8.25, 0
  %42 = inttoptr i64 %41 to %struct.AVLNode_st**
  %R541 = load %struct.AVLNode_st*, %struct.AVLNode_st** %42
  %p_000001C401BF5128.26 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %43 = add i64 %p_000001C401BF5128.26, 0
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R541, %struct.AVLNode_st** %44
  %n_000001C401BF52E8.27 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %45 = add i64 %n_000001C401BF52E8.27, 0
  %46 = inttoptr i64 %45 to %struct.AVLNode_st**
  %R542 = load %struct.AVLNode_st*, %struct.AVLNode_st** %46
  %R54228 = ptrtoint %struct.AVLNode_st* %R542 to i64
  %47 = add i64 %R54228, 8
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %R543 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %n_000001C401BF52E8.29 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %49 = add i64 %n_000001C401BF52E8.29, 0
  %50 = inttoptr i64 %49 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R543, %struct.AVLNode_st** %50
  br label %L215

L215:                                             ; preds = %L217, %L214
  %n_000001C401BF52E8.30 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %51 = add i64 %n_000001C401BF52E8.30, 0
  %52 = inttoptr i64 %51 to %struct.AVLNode_st**
  %R544 = load %struct.AVLNode_st*, %struct.AVLNode_st** %52
  %R54431 = ptrtoint %struct.AVLNode_st* %R544 to i64
  %53 = add i64 %R54431, 16
  %54 = inttoptr i64 %53 to %struct.AVLNode_st**
  %R545 = load %struct.AVLNode_st*, %struct.AVLNode_st** %54
  %55 = ptrtoint %struct.AVLNode_st* %R545 to i64
  %R546 = icmp ne i64 %55, 0
  %R54632 = zext i1 %R546 to i32
  %cond33 = icmp ne i32 %R54632, 0
  br i1 %cond33, label %L216, label %L218

L216:                                             ; preds = %L215
  br label %L217

L217:                                             ; preds = %L216
  %n_000001C401BF52E8.34 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %56 = add i64 %n_000001C401BF52E8.34, 0
  %57 = inttoptr i64 %56 to %struct.AVLNode_st**
  %R547 = load %struct.AVLNode_st*, %struct.AVLNode_st** %57
  %R54735 = ptrtoint %struct.AVLNode_st* %R547 to i64
  %58 = add i64 %R54735, 16
  %59 = inttoptr i64 %58 to %struct.AVLNode_st**
  %R548 = load %struct.AVLNode_st*, %struct.AVLNode_st** %59
  %n_000001C401BF52E8.36 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %60 = add i64 %n_000001C401BF52E8.36, 0
  %61 = inttoptr i64 %60 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R548, %struct.AVLNode_st** %61
  br label %L215

L218:                                             ; preds = %L215
  %vtbl_000001C401BF5588.37 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %62 = add i64 %vtbl_000001C401BF5588.37, 0
  %63 = inttoptr i64 %62 to %struct.avl_vtbl**
  %R549 = load %struct.avl_vtbl*, %struct.avl_vtbl** %63
  %R54938 = ptrtoint %struct.avl_vtbl* %R549 to i64
  %64 = add i64 %R54938, 16
  %65 = inttoptr i64 %64 to void (i8*, i8*)**
  %R550 = load void (i8*, i8*)*, void (i8*, i8*)** %65
  %66 = ptrtoint void (i8*, i8*)* %R550 to i64
  %R551 = icmp ne i64 %66, 0
  %R55139 = zext i1 %R551 to i32
  %cond40 = icmp ne i32 %R55139, 0
  br i1 %cond40, label %L219, label %L220

L219:                                             ; preds = %L218
  %p_000001C401BF5128.41 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %67 = add i64 %p_000001C401BF5128.41, 0
  %68 = inttoptr i64 %67 to %struct.AVLNode_st**
  %R552 = load %struct.AVLNode_st*, %struct.AVLNode_st** %68
  %R55242 = ptrtoint %struct.AVLNode_st* %R552 to i64
  %R553 = add i64 %R55242, 32
  %R55343 = inttoptr i64 %R553 to %struct.AVLNode_st*
  %R554 = bitcast %struct.AVLNode_st* %R55343 to i8*
  %n_000001C401BF52E8.44 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %69 = add i64 %n_000001C401BF52E8.44, 0
  %70 = inttoptr i64 %69 to %struct.AVLNode_st**
  %R555 = load %struct.AVLNode_st*, %struct.AVLNode_st** %70
  %R55545 = ptrtoint %struct.AVLNode_st* %R555 to i64
  %R556 = add i64 %R55545, 32
  %R55646 = inttoptr i64 %R556 to %struct.AVLNode_st*
  %R557 = bitcast %struct.AVLNode_st* %R55646 to i8*
  %vtbl_000001C401BF5588.47 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %71 = add i64 %vtbl_000001C401BF5588.47, 0
  %72 = inttoptr i64 %71 to %struct.avl_vtbl**
  %R558 = load %struct.avl_vtbl*, %struct.avl_vtbl** %72
  %R55848 = ptrtoint %struct.avl_vtbl* %R558 to i64
  %73 = add i64 %R55848, 16
  %74 = inttoptr i64 %73 to void (i8*, i8*)**
  %R559 = load void (i8*, i8*)*, void (i8*, i8*)** %74
  %75 = bitcast void (i8*, i8*)* %R559 to i8*
  %76 = bitcast i8* %75 to void (i8*, i8*)*
  call void %76(i8* %R554, i8* %R557)
  br label %L224

L220:                                             ; preds = %L218
  %vtbl_000001C401BF5588.49 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %77 = add i64 %vtbl_000001C401BF5588.49, 0
  %78 = inttoptr i64 %77 to %struct.avl_vtbl**
  %R560 = load %struct.avl_vtbl*, %struct.avl_vtbl** %78
  %R56050 = ptrtoint %struct.avl_vtbl* %R560 to i64
  %79 = add i64 %R56050, 24
  %80 = inttoptr i64 %79 to void (i8*)**
  %R561 = load void (i8*)*, void (i8*)** %80
  %81 = ptrtoint void (i8*)* %R561 to i64
  %R562 = icmp ne i64 %81, 0
  %R56251 = zext i1 %R562 to i32
  %cond52 = icmp ne i32 %R56251, 0
  br i1 %cond52, label %L221, label %L222

L221:                                             ; preds = %L220
  %p_000001C401BF5128.53 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %82 = add i64 %p_000001C401BF5128.53, 0
  %83 = inttoptr i64 %82 to %struct.AVLNode_st**
  %R563 = load %struct.AVLNode_st*, %struct.AVLNode_st** %83
  %R56354 = ptrtoint %struct.AVLNode_st* %R563 to i64
  %R564 = add i64 %R56354, 32
  %R56455 = inttoptr i64 %R564 to %struct.AVLNode_st*
  %R565 = bitcast %struct.AVLNode_st* %R56455 to i8*
  %vtbl_000001C401BF5588.56 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %84 = add i64 %vtbl_000001C401BF5588.56, 0
  %85 = inttoptr i64 %84 to %struct.avl_vtbl**
  %R566 = load %struct.avl_vtbl*, %struct.avl_vtbl** %85
  %R56657 = ptrtoint %struct.avl_vtbl* %R566 to i64
  %86 = add i64 %R56657, 24
  %87 = inttoptr i64 %86 to void (i8*)**
  %R567 = load void (i8*)*, void (i8*)** %87
  %88 = bitcast void (i8*)* %R567 to i8*
  %89 = bitcast i8* %88 to void (i8*)*
  call void %89(i8* %R565)
  br label %L223

L222:                                             ; preds = %L220
  br label %L223

L223:                                             ; preds = %L222, %L221
  %p_000001C401BF5128.58 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %90 = add i64 %p_000001C401BF5128.58, 0
  %91 = inttoptr i64 %90 to %struct.AVLNode_st**
  %R568 = load %struct.AVLNode_st*, %struct.AVLNode_st** %91
  %R56859 = ptrtoint %struct.AVLNode_st* %R568 to i64
  %R569 = add i64 %R56859, 32
  %R56960 = inttoptr i64 %R569 to %struct.AVLNode_st*
  %R570 = bitcast %struct.AVLNode_st* %R56960 to i8*
  %n_000001C401BF52E8.61 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %92 = add i64 %n_000001C401BF52E8.61, 0
  %93 = inttoptr i64 %92 to %struct.AVLNode_st**
  %R571 = load %struct.AVLNode_st*, %struct.AVLNode_st** %93
  %R57162 = ptrtoint %struct.AVLNode_st* %R571 to i64
  %R572 = add i64 %R57162, 32
  %R57263 = inttoptr i64 %R572 to %struct.AVLNode_st*
  %R573 = bitcast %struct.AVLNode_st* %R57263 to i8*
  %tree_000001C401BF4948.64 = ptrtoint %struct.avltree** %tree_000001C401BF4948. to i64
  %94 = add i64 %tree_000001C401BF4948.64, 0
  %95 = inttoptr i64 %94 to %struct.avltree**
  %R574 = load %struct.avltree*, %struct.avltree** %95
  %R57465 = ptrtoint %struct.avltree* %R574 to i64
  %96 = add i64 %R57465, 20
  %97 = inttoptr i64 %96 to i32*
  %R575 = load i32, i32* %97
  %R576 = call i8* @memcpy(i8* %R570, i8* %R573, i32 %R575)
  br label %L224

L224:                                             ; preds = %L223, %L219
  %n_000001C401BF52E8.66 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %98 = add i64 %n_000001C401BF52E8.66, 0
  %99 = inttoptr i64 %98 to %struct.AVLNode_st**
  %R577 = load %struct.AVLNode_st*, %struct.AVLNode_st** %99
  %R57767 = ptrtoint %struct.AVLNode_st* %R577 to i64
  %100 = add i64 %R57767, 0
  %101 = inttoptr i64 %100 to %struct.AVLNode_st**
  %R578 = load %struct.AVLNode_st*, %struct.AVLNode_st** %101
  %p_000001C401BF5128.68 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %102 = add i64 %p_000001C401BF5128.68, 0
  %103 = inttoptr i64 %102 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R578, %struct.AVLNode_st** %103
  %n_000001C401BF52E8.69 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %104 = add i64 %n_000001C401BF52E8.69, 0
  %105 = inttoptr i64 %104 to %struct.AVLNode_st**
  %R579 = load %struct.AVLNode_st*, %struct.AVLNode_st** %105
  %p_000001C401BF5128.70 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %106 = add i64 %p_000001C401BF5128.70, 0
  %107 = inttoptr i64 %106 to %struct.AVLNode_st**
  %R580 = load %struct.AVLNode_st*, %struct.AVLNode_st** %107
  %R58071 = ptrtoint %struct.AVLNode_st* %R580 to i64
  %108 = add i64 %R58071, 8
  %109 = inttoptr i64 %108 to %struct.AVLNode_st**
  %R581 = load %struct.AVLNode_st*, %struct.AVLNode_st** %109
  %110 = ptrtoint %struct.AVLNode_st* %R579 to i64
  %111 = ptrtoint %struct.AVLNode_st* %R581 to i64
  %R582 = icmp eq i64 %110, %111
  %R58272 = zext i1 %R582 to i32
  %cond73 = icmp ne i32 %R58272, 0
  br i1 %cond73, label %L225, label %L226

L225:                                             ; preds = %L224
  %flag_000001C401BF5748.74 = ptrtoint i32* %flag_000001C401BF5748. to i64
  %112 = add i64 %flag_000001C401BF5748.74, 0
  %113 = inttoptr i64 %112 to i32*
  store i32 1, i32* %113
  %p_000001C401BF5128.75 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %114 = add i64 %p_000001C401BF5128.75, 0
  %115 = inttoptr i64 %114 to %struct.AVLNode_st**
  %R583 = load %struct.AVLNode_st*, %struct.AVLNode_st** %115
  %n_000001C401BF52E8.76 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %116 = add i64 %n_000001C401BF52E8.76, 0
  %117 = inttoptr i64 %116 to %struct.AVLNode_st**
  %R584 = load %struct.AVLNode_st*, %struct.AVLNode_st** %117
  %R58477 = ptrtoint %struct.AVLNode_st* %R584 to i64
  %118 = add i64 %R58477, 8
  %119 = inttoptr i64 %118 to %struct.AVLNode_st**
  %R585 = load %struct.AVLNode_st*, %struct.AVLNode_st** %119
  call void @AVL_SetLeft(%struct.AVLNode_st* %R583, %struct.AVLNode_st* %R585)
  br label %L227

L226:                                             ; preds = %L224
  %p_000001C401BF5128.78 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %120 = add i64 %p_000001C401BF5128.78, 0
  %121 = inttoptr i64 %120 to %struct.AVLNode_st**
  %R586 = load %struct.AVLNode_st*, %struct.AVLNode_st** %121
  %n_000001C401BF52E8.79 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %122 = add i64 %n_000001C401BF52E8.79, 0
  %123 = inttoptr i64 %122 to %struct.AVLNode_st**
  %R587 = load %struct.AVLNode_st*, %struct.AVLNode_st** %123
  %R58780 = ptrtoint %struct.AVLNode_st* %R587 to i64
  %124 = add i64 %R58780, 8
  %125 = inttoptr i64 %124 to %struct.AVLNode_st**
  %R588 = load %struct.AVLNode_st*, %struct.AVLNode_st** %125
  call void @AVL_SetRight(%struct.AVLNode_st* %R586, %struct.AVLNode_st* %R588)
  br label %L227

L227:                                             ; preds = %L226, %L225
  %n_000001C401BF52E8.81 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %126 = add i64 %n_000001C401BF52E8.81, 0
  %127 = inttoptr i64 %126 to %struct.AVLNode_st**
  %R589 = load %struct.AVLNode_st*, %struct.AVLNode_st** %127
  %discard_000001C401BF4F68.82 = ptrtoint %struct.AVLNode_st** %discard_000001C401BF4F68. to i64
  %128 = add i64 %discard_000001C401BF4F68.82, 0
  %129 = inttoptr i64 %128 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R589, %struct.AVLNode_st** %129
  br label %L243

L228:                                             ; preds = %L213
  %n_000001C401BF52E8.83 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %130 = add i64 %n_000001C401BF52E8.83, 0
  %131 = inttoptr i64 %130 to %struct.AVLNode_st**
  %R590 = load %struct.AVLNode_st*, %struct.AVLNode_st** %131
  %R59084 = ptrtoint %struct.AVLNode_st* %R590 to i64
  %132 = add i64 %R59084, 0
  %133 = inttoptr i64 %132 to %struct.AVLNode_st**
  %R591 = load %struct.AVLNode_st*, %struct.AVLNode_st** %133
  %p_000001C401BF5128.85 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %134 = add i64 %p_000001C401BF5128.85, 0
  %135 = inttoptr i64 %134 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R591, %struct.AVLNode_st** %135
  %p_000001C401BF5128.86 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %136 = add i64 %p_000001C401BF5128.86, 0
  %137 = inttoptr i64 %136 to %struct.AVLNode_st**
  %R592 = load %struct.AVLNode_st*, %struct.AVLNode_st** %137
  %138 = ptrtoint %struct.AVLNode_st* %R592 to i64
  %R593 = icmp ne i64 %138, 0
  %R59387 = zext i1 %R593 to i32
  %cond88 = icmp ne i32 %R59387, 0
  br i1 %cond88, label %L229, label %L236

L229:                                             ; preds = %L228
  %n_000001C401BF52E8.89 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %139 = add i64 %n_000001C401BF52E8.89, 0
  %140 = inttoptr i64 %139 to %struct.AVLNode_st**
  %R594 = load %struct.AVLNode_st*, %struct.AVLNode_st** %140
  %p_000001C401BF5128.90 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %141 = add i64 %p_000001C401BF5128.90, 0
  %142 = inttoptr i64 %141 to %struct.AVLNode_st**
  %R595 = load %struct.AVLNode_st*, %struct.AVLNode_st** %142
  %R59591 = ptrtoint %struct.AVLNode_st* %R595 to i64
  %143 = add i64 %R59591, 8
  %144 = inttoptr i64 %143 to %struct.AVLNode_st**
  %R596 = load %struct.AVLNode_st*, %struct.AVLNode_st** %144
  %145 = ptrtoint %struct.AVLNode_st* %R594 to i64
  %146 = ptrtoint %struct.AVLNode_st* %R596 to i64
  %R597 = icmp eq i64 %145, %146
  %R59792 = zext i1 %R597 to i32
  %cond93 = icmp ne i32 %R59792, 0
  br i1 %cond93, label %L230, label %L231

L230:                                             ; preds = %L229
  %p_000001C401BF5128.94 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %147 = add i64 %p_000001C401BF5128.94, 0
  %148 = inttoptr i64 %147 to %struct.AVLNode_st**
  %R598 = load %struct.AVLNode_st*, %struct.AVLNode_st** %148
  %n_000001C401BF52E8.95 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %149 = add i64 %n_000001C401BF52E8.95, 0
  %150 = inttoptr i64 %149 to %struct.AVLNode_st**
  %R599 = load %struct.AVLNode_st*, %struct.AVLNode_st** %150
  %R59996 = ptrtoint %struct.AVLNode_st* %R599 to i64
  %151 = add i64 %R59996, 16
  %152 = inttoptr i64 %151 to %struct.AVLNode_st**
  %R600 = load %struct.AVLNode_st*, %struct.AVLNode_st** %152
  call void @AVL_SetLeft(%struct.AVLNode_st* %R598, %struct.AVLNode_st* %R600)
  %flag_000001C401BF5748.97 = ptrtoint i32* %flag_000001C401BF5748. to i64
  %153 = add i64 %flag_000001C401BF5748.97, 0
  %154 = inttoptr i64 %153 to i32*
  store i32 1, i32* %154
  br label %L232

L231:                                             ; preds = %L229
  %p_000001C401BF5128.98 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %155 = add i64 %p_000001C401BF5128.98, 0
  %156 = inttoptr i64 %155 to %struct.AVLNode_st**
  %R601 = load %struct.AVLNode_st*, %struct.AVLNode_st** %156
  %n_000001C401BF52E8.99 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %157 = add i64 %n_000001C401BF52E8.99, 0
  %158 = inttoptr i64 %157 to %struct.AVLNode_st**
  %R602 = load %struct.AVLNode_st*, %struct.AVLNode_st** %158
  %R602100 = ptrtoint %struct.AVLNode_st* %R602 to i64
  %159 = add i64 %R602100, 16
  %160 = inttoptr i64 %159 to %struct.AVLNode_st**
  %R603 = load %struct.AVLNode_st*, %struct.AVLNode_st** %160
  call void @AVL_SetRight(%struct.AVLNode_st* %R601, %struct.AVLNode_st* %R603)
  br label %L232

L232:                                             ; preds = %L231, %L230
  %vtbl_000001C401BF5588.101 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %161 = add i64 %vtbl_000001C401BF5588.101, 0
  %162 = inttoptr i64 %161 to %struct.avl_vtbl**
  %R604 = load %struct.avl_vtbl*, %struct.avl_vtbl** %162
  %R604102 = ptrtoint %struct.avl_vtbl* %R604 to i64
  %163 = add i64 %R604102, 24
  %164 = inttoptr i64 %163 to void (i8*)**
  %R605 = load void (i8*)*, void (i8*)** %164
  %165 = ptrtoint void (i8*)* %R605 to i64
  %R606 = icmp ne i64 %165, 0
  %R606103 = zext i1 %R606 to i32
  %cond104 = icmp ne i32 %R606103, 0
  br i1 %cond104, label %L233, label %L234

L233:                                             ; preds = %L232
  %n_000001C401BF52E8.105 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %166 = add i64 %n_000001C401BF52E8.105, 0
  %167 = inttoptr i64 %166 to %struct.AVLNode_st**
  %R607 = load %struct.AVLNode_st*, %struct.AVLNode_st** %167
  %R607106 = ptrtoint %struct.AVLNode_st* %R607 to i64
  %R608 = add i64 %R607106, 32
  %R608107 = inttoptr i64 %R608 to %struct.AVLNode_st*
  %R609 = bitcast %struct.AVLNode_st* %R608107 to i8*
  %vtbl_000001C401BF5588.108 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %168 = add i64 %vtbl_000001C401BF5588.108, 0
  %169 = inttoptr i64 %168 to %struct.avl_vtbl**
  %R610 = load %struct.avl_vtbl*, %struct.avl_vtbl** %169
  %R610109 = ptrtoint %struct.avl_vtbl* %R610 to i64
  %170 = add i64 %R610109, 24
  %171 = inttoptr i64 %170 to void (i8*)**
  %R611 = load void (i8*)*, void (i8*)** %171
  %172 = bitcast void (i8*)* %R611 to i8*
  %173 = bitcast i8* %172 to void (i8*)*
  call void %173(i8* %R609)
  br label %L235

L234:                                             ; preds = %L232
  br label %L235

L235:                                             ; preds = %L234, %L233
  %n_000001C401BF52E8.110 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %174 = add i64 %n_000001C401BF52E8.110, 0
  %175 = inttoptr i64 %174 to %struct.AVLNode_st**
  %R612 = load %struct.AVLNode_st*, %struct.AVLNode_st** %175
  %discard_000001C401BF4F68.111 = ptrtoint %struct.AVLNode_st** %discard_000001C401BF4F68. to i64
  %176 = add i64 %discard_000001C401BF4F68.111, 0
  %177 = inttoptr i64 %176 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R612, %struct.AVLNode_st** %177
  br label %L242

L236:                                             ; preds = %L228
  %n_000001C401BF52E8.112 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %178 = add i64 %n_000001C401BF52E8.112, 0
  %179 = inttoptr i64 %178 to %struct.AVLNode_st**
  %R613 = load %struct.AVLNode_st*, %struct.AVLNode_st** %179
  %R613113 = ptrtoint %struct.AVLNode_st* %R613 to i64
  %180 = add i64 %R613113, 16
  %181 = inttoptr i64 %180 to %struct.AVLNode_st**
  %R614 = load %struct.AVLNode_st*, %struct.AVLNode_st** %181
  %p_000001C401BF5128.114 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %182 = add i64 %p_000001C401BF5128.114, 0
  %183 = inttoptr i64 %182 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R614, %struct.AVLNode_st** %183
  %p_000001C401BF5128.115 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %184 = add i64 %p_000001C401BF5128.115, 0
  %185 = inttoptr i64 %184 to %struct.AVLNode_st**
  %R615 = load %struct.AVLNode_st*, %struct.AVLNode_st** %185
  %186 = ptrtoint %struct.AVLNode_st* %R615 to i64
  %R616 = icmp ne i64 %186, 0
  %R616116 = zext i1 %R616 to i32
  %cond117 = icmp ne i32 %R616116, 0
  br i1 %cond117, label %L237, label %L238

L237:                                             ; preds = %L236
  %p_000001C401BF5128.118 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %187 = add i64 %p_000001C401BF5128.118, 0
  %188 = inttoptr i64 %187 to %struct.AVLNode_st**
  %R617 = load %struct.AVLNode_st*, %struct.AVLNode_st** %188
  %R617119 = ptrtoint %struct.AVLNode_st* %R617 to i64
  %189 = add i64 %R617119, 0
  %190 = inttoptr i64 %189 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %190
  br label %L238

L238:                                             ; preds = %L237, %L236
  %vtbl_000001C401BF5588.120 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %191 = add i64 %vtbl_000001C401BF5588.120, 0
  %192 = inttoptr i64 %191 to %struct.avl_vtbl**
  %R618 = load %struct.avl_vtbl*, %struct.avl_vtbl** %192
  %R618121 = ptrtoint %struct.avl_vtbl* %R618 to i64
  %193 = add i64 %R618121, 24
  %194 = inttoptr i64 %193 to void (i8*)**
  %R619 = load void (i8*)*, void (i8*)** %194
  %195 = ptrtoint void (i8*)* %R619 to i64
  %R620 = icmp ne i64 %195, 0
  %R620122 = zext i1 %R620 to i32
  %cond123 = icmp ne i32 %R620122, 0
  br i1 %cond123, label %L239, label %L240

L239:                                             ; preds = %L238
  %n_000001C401BF52E8.124 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %196 = add i64 %n_000001C401BF52E8.124, 0
  %197 = inttoptr i64 %196 to %struct.AVLNode_st**
  %R621 = load %struct.AVLNode_st*, %struct.AVLNode_st** %197
  %R621125 = ptrtoint %struct.AVLNode_st* %R621 to i64
  %R622 = add i64 %R621125, 32
  %R622126 = inttoptr i64 %R622 to %struct.AVLNode_st*
  %R623 = bitcast %struct.AVLNode_st* %R622126 to i8*
  %vtbl_000001C401BF5588.127 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401BF5588. to i64
  %198 = add i64 %vtbl_000001C401BF5588.127, 0
  %199 = inttoptr i64 %198 to %struct.avl_vtbl**
  %R624 = load %struct.avl_vtbl*, %struct.avl_vtbl** %199
  %R624128 = ptrtoint %struct.avl_vtbl* %R624 to i64
  %200 = add i64 %R624128, 24
  %201 = inttoptr i64 %200 to void (i8*)**
  %R625 = load void (i8*)*, void (i8*)** %201
  %202 = bitcast void (i8*)* %R625 to i8*
  %203 = bitcast i8* %202 to void (i8*)*
  call void %203(i8* %R623)
  br label %L241

L240:                                             ; preds = %L238
  br label %L241

L241:                                             ; preds = %L240, %L239
  %tree_000001C401BF4948.129 = ptrtoint %struct.avltree** %tree_000001C401BF4948. to i64
  %204 = add i64 %tree_000001C401BF4948.129, 0
  %205 = inttoptr i64 %204 to %struct.avltree**
  %R626 = load %struct.avltree*, %struct.avltree** %205
  %R626130 = ptrtoint %struct.avltree* %R626 to i64
  %206 = add i64 %R626130, 24
  %207 = inttoptr i64 %206 to %struct.allocator_st**
  %R627 = load %struct.allocator_st*, %struct.allocator_st** %207
  %n_000001C401BF52E8.131 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %208 = add i64 %n_000001C401BF52E8.131, 0
  %209 = inttoptr i64 %208 to %struct.AVLNode_st**
  %R628 = load %struct.AVLNode_st*, %struct.AVLNode_st** %209
  %R629 = bitcast %struct.AVLNode_st* %R628 to i8*
  call void @dealloc_node(%struct.allocator_st* %R627, i8* %R629)
  %p_000001C401BF5128.132 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %210 = add i64 %p_000001C401BF5128.132, 0
  %211 = inttoptr i64 %210 to %struct.AVLNode_st**
  %R630 = load %struct.AVLNode_st*, %struct.AVLNode_st** %211
  %R631 = bitcast %struct.AVLNode_st* %R630 to i8*
  %tree_000001C401BF4948.133 = ptrtoint %struct.avltree** %tree_000001C401BF4948. to i64
  %212 = add i64 %tree_000001C401BF4948.133, 0
  %213 = inttoptr i64 %212 to %struct.avltree**
  %R632 = load %struct.avltree*, %struct.avltree** %213
  %R632134 = ptrtoint %struct.avltree* %R632 to i64
  %214 = add i64 %R632134, 8
  %215 = inttoptr i64 %214 to i8**
  store i8* %R631, i8** %215
  store i32 0, i32* %0
  br label %L254

L242:                                             ; preds = %L235
  br label %L243

L243:                                             ; preds = %L242, %L227
  %height_changed_000001C401BF54A8.135 = ptrtoint i32* %height_changed_000001C401BF54A8. to i64
  %216 = add i64 %height_changed_000001C401BF54A8.135, 0
  %217 = inttoptr i64 %216 to i32*
  store i32 1, i32* %217
  br label %L244

L244:                                             ; preds = %L250, %L243
  %p_000001C401BF5128.136 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %218 = add i64 %p_000001C401BF5128.136, 0
  %219 = inttoptr i64 %218 to %struct.AVLNode_st**
  %R633 = load %struct.AVLNode_st*, %struct.AVLNode_st** %219
  %220 = ptrtoint %struct.AVLNode_st* %R633 to i64
  %R634 = icmp ne i64 %220, 0
  %R634137 = zext i1 %R634 to i32
  %height_changed_000001C401BF54A8.138 = ptrtoint i32* %height_changed_000001C401BF54A8. to i64
  %221 = add i64 %height_changed_000001C401BF54A8.138, 0
  %222 = inttoptr i64 %221 to i32*
  %R635 = load i32, i32* %222
  %223 = icmp ne i32 %R634137, 0
  %224 = icmp ne i32 %R635, 0
  %R636 = and i1 %223, %224
  %R636139 = zext i1 %R636 to i32
  %cond140 = icmp ne i32 %R636139, 0
  br i1 %cond140, label %L245, label %L251

L245:                                             ; preds = %L244
  %flag_000001C401BF5748.141 = ptrtoint i32* %flag_000001C401BF5748. to i64
  %225 = add i64 %flag_000001C401BF5748.141, 0
  %226 = inttoptr i64 %225 to i32*
  %R637 = load i32, i32* %226
  %cond142 = icmp ne i32 %R637, 0
  br i1 %cond142, label %L247, label %L246

L246:                                             ; preds = %L245
  %n_000001C401BF52E8.143 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %227 = add i64 %n_000001C401BF52E8.143, 0
  %228 = inttoptr i64 %227 to %struct.AVLNode_st**
  %R638 = load %struct.AVLNode_st*, %struct.AVLNode_st** %228
  %p_000001C401BF5128.144 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %229 = add i64 %p_000001C401BF5128.144, 0
  %230 = inttoptr i64 %229 to %struct.AVLNode_st**
  %R639 = load %struct.AVLNode_st*, %struct.AVLNode_st** %230
  %R639145 = ptrtoint %struct.AVLNode_st* %R639 to i64
  %231 = add i64 %R639145, 8
  %232 = inttoptr i64 %231 to %struct.AVLNode_st**
  %R640 = load %struct.AVLNode_st*, %struct.AVLNode_st** %232
  %233 = ptrtoint %struct.AVLNode_st* %R638 to i64
  %234 = ptrtoint %struct.AVLNode_st* %R640 to i64
  %R641 = icmp eq i64 %233, %234
  %R641146 = zext i1 %R641 to i32
  %cond147 = icmp ne i32 %R641146, 0
  br i1 %cond147, label %L247, label %L248

L247:                                             ; preds = %L246, %L245
  %flag_000001C401BF5748.148 = ptrtoint i32* %flag_000001C401BF5748. to i64
  %235 = add i64 %flag_000001C401BF5748.148, 0
  %236 = inttoptr i64 %235 to i32*
  store i32 0, i32* %236
  %p_000001C401BF5128.149 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %237 = add i64 %p_000001C401BF5128.149, 0
  %238 = inttoptr i64 %237 to %struct.AVLNode_st**
  %R642 = load %struct.AVLNode_st*, %struct.AVLNode_st** %238
  %R644 = call %struct.AVLNode_st* @AVL_RebalanceShorterLeft(%struct.AVLNode_st* %R642, i32* %height_changed_000001C401BF54A8.)
  %p_000001C401BF5128.150 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %239 = add i64 %p_000001C401BF5128.150, 0
  %240 = inttoptr i64 %239 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R644, %struct.AVLNode_st** %240
  br label %L249

L248:                                             ; preds = %L246
  %p_000001C401BF5128.151 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %241 = add i64 %p_000001C401BF5128.151, 0
  %242 = inttoptr i64 %241 to %struct.AVLNode_st**
  %R645 = load %struct.AVLNode_st*, %struct.AVLNode_st** %242
  %R647 = call %struct.AVLNode_st* @AVL_RebalanceShorterRight(%struct.AVLNode_st* %R645, i32* %height_changed_000001C401BF54A8.)
  %p_000001C401BF5128.152 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %243 = add i64 %p_000001C401BF5128.152, 0
  %244 = inttoptr i64 %243 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R647, %struct.AVLNode_st** %244
  br label %L249

L249:                                             ; preds = %L248, %L247
  %p_000001C401BF5128.153 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %245 = add i64 %p_000001C401BF5128.153, 0
  %246 = inttoptr i64 %245 to %struct.AVLNode_st**
  %R648 = load %struct.AVLNode_st*, %struct.AVLNode_st** %246
  %n_000001C401BF52E8.154 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %247 = add i64 %n_000001C401BF52E8.154, 0
  %248 = inttoptr i64 %247 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R648, %struct.AVLNode_st** %248
  %p_000001C401BF5128.155 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %249 = add i64 %p_000001C401BF5128.155, 0
  %250 = inttoptr i64 %249 to %struct.AVLNode_st**
  %R649 = load %struct.AVLNode_st*, %struct.AVLNode_st** %250
  %R649156 = ptrtoint %struct.AVLNode_st* %R649 to i64
  %251 = add i64 %R649156, 0
  %252 = inttoptr i64 %251 to %struct.AVLNode_st**
  %R650 = load %struct.AVLNode_st*, %struct.AVLNode_st** %252
  %p_000001C401BF5128.157 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %253 = add i64 %p_000001C401BF5128.157, 0
  %254 = inttoptr i64 %253 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R650, %struct.AVLNode_st** %254
  br label %L250

L250:                                             ; preds = %L249
  br label %L244

L251:                                             ; preds = %L244
  %p_000001C401BF5128.158 = ptrtoint %struct.AVLNode_st** %p_000001C401BF5128. to i64
  %255 = add i64 %p_000001C401BF5128.158, 0
  %256 = inttoptr i64 %255 to %struct.AVLNode_st**
  %R651 = load %struct.AVLNode_st*, %struct.AVLNode_st** %256
  %257 = ptrtoint %struct.AVLNode_st* %R651 to i64
  %R652 = icmp eq i64 %257, 0
  %R652159 = zext i1 %R652 to i32
  %cond160 = icmp ne i32 %R652159, 0
  br i1 %cond160, label %L252, label %L253

L252:                                             ; preds = %L251
  %n_000001C401BF52E8.161 = ptrtoint %struct.AVLNode_st** %n_000001C401BF52E8. to i64
  %258 = add i64 %n_000001C401BF52E8.161, 0
  %259 = inttoptr i64 %258 to %struct.AVLNode_st**
  %R653 = load %struct.AVLNode_st*, %struct.AVLNode_st** %259
  %R654 = bitcast %struct.AVLNode_st* %R653 to i8*
  %tree_000001C401BF4948.162 = ptrtoint %struct.avltree** %tree_000001C401BF4948. to i64
  %260 = add i64 %tree_000001C401BF4948.162, 0
  %261 = inttoptr i64 %260 to %struct.avltree**
  %R655 = load %struct.avltree*, %struct.avltree** %261
  %R655163 = ptrtoint %struct.avltree* %R655 to i64
  %262 = add i64 %R655163, 8
  %263 = inttoptr i64 %262 to i8**
  store i8* %R654, i8** %263
  br label %L253

L253:                                             ; preds = %L252, %L251
  %tree_000001C401BF4948.164 = ptrtoint %struct.avltree** %tree_000001C401BF4948. to i64
  %264 = add i64 %tree_000001C401BF4948.164, 0
  %265 = inttoptr i64 %264 to %struct.avltree**
  %R656 = load %struct.avltree*, %struct.avltree** %265
  %R656165 = ptrtoint %struct.avltree* %R656 to i64
  %266 = add i64 %R656165, 24
  %267 = inttoptr i64 %266 to %struct.allocator_st**
  %R657 = load %struct.allocator_st*, %struct.allocator_st** %267
  %discard_000001C401BF4F68.166 = ptrtoint %struct.AVLNode_st** %discard_000001C401BF4F68. to i64
  %268 = add i64 %discard_000001C401BF4F68.166, 0
  %269 = inttoptr i64 %268 to %struct.AVLNode_st**
  %R658 = load %struct.AVLNode_st*, %struct.AVLNode_st** %269
  %R659 = bitcast %struct.AVLNode_st* %R658 to i8*
  call void @dealloc_node(%struct.allocator_st* %R657, i8* %R659)
  store i32 0, i32* %0
  br label %L254

L254:                                             ; preds = %L253, %L241, %L212
  %270 = load i32, i32* %0
  ret i32 %270
}

define i32 @AVLTree_Delete(%struct.avltree* %ARG1, i8* %ARG2) {
L255:
  %compresult_000001C401C11948. = alloca i32
  %vtbl_000001C401C10EC8. = alloca %struct.avl_vtbl*
  %n_000001C401C10D08. = alloca %struct.AVLNode_st*
  %root_000001C401C10B48. = alloca %struct.AVLNode_st*
  %k_000001C401C108A8. = alloca i8*
  %tree_000001C401C106E8. = alloca %struct.avltree*
  %0 = alloca i32
  %tree_000001C401C106E8.1 = ptrtoint %struct.avltree** %tree_000001C401C106E8. to i64
  %1 = add i64 %tree_000001C401C106E8.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %k_000001C401C108A8.2 = ptrtoint i8** %k_000001C401C108A8. to i64
  %3 = add i64 %k_000001C401C108A8.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %tree_000001C401C106E8.3 = ptrtoint %struct.avltree** %tree_000001C401C106E8. to i64
  %5 = add i64 %tree_000001C401C106E8.3, 0
  %6 = inttoptr i64 %5 to %struct.avltree**
  %R660 = load %struct.avltree*, %struct.avltree** %6
  %R6604 = ptrtoint %struct.avltree* %R660 to i64
  %7 = add i64 %R6604, 8
  %8 = inttoptr i64 %7 to i8**
  %R661 = load i8*, i8** %8
  %R662 = bitcast i8* %R661 to %struct.AVLNode_st*
  %root_000001C401C10B48.5 = ptrtoint %struct.AVLNode_st** %root_000001C401C10B48. to i64
  %9 = add i64 %root_000001C401C10B48.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R662, %struct.AVLNode_st** %10
  %n_000001C401C10D08.6 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %11 = add i64 %n_000001C401C10D08.6, 0
  %12 = inttoptr i64 %11 to %struct.AVLNode_st**
  store %struct.AVLNode_st* null, %struct.AVLNode_st** %12
  %tree_000001C401C106E8.7 = ptrtoint %struct.avltree** %tree_000001C401C106E8. to i64
  %13 = add i64 %tree_000001C401C106E8.7, 0
  %14 = inttoptr i64 %13 to %struct.avltree**
  %R663 = load %struct.avltree*, %struct.avltree** %14
  %R6638 = ptrtoint %struct.avltree* %R663 to i64
  %15 = add i64 %R6638, 0
  %16 = inttoptr i64 %15 to %struct.avl_vtbl**
  %R664 = load %struct.avl_vtbl*, %struct.avl_vtbl** %16
  %vtbl_000001C401C10EC8.9 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401C10EC8. to i64
  %17 = add i64 %vtbl_000001C401C10EC8.9, 0
  %18 = inttoptr i64 %17 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %R664, %struct.avl_vtbl** %18
  %root_000001C401C10B48.10 = ptrtoint %struct.AVLNode_st** %root_000001C401C10B48. to i64
  %19 = add i64 %root_000001C401C10B48.10, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R665 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %21 = ptrtoint %struct.AVLNode_st* %R665 to i64
  %R666 = icmp eq i64 %21, 0
  %R66611 = zext i1 %R666 to i32
  %cond = icmp ne i32 %R66611, 0
  br i1 %cond, label %L256, label %L257

L256:                                             ; preds = %L255
  store i32 -1, i32* %0
  br label %L270

L257:                                             ; preds = %L255
  %root_000001C401C10B48.12 = ptrtoint %struct.AVLNode_st** %root_000001C401C10B48. to i64
  %22 = add i64 %root_000001C401C10B48.12, 0
  %23 = inttoptr i64 %22 to %struct.AVLNode_st**
  %R668 = load %struct.AVLNode_st*, %struct.AVLNode_st** %23
  %n_000001C401C10D08.13 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %24 = add i64 %n_000001C401C10D08.13, 0
  %25 = inttoptr i64 %24 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R668, %struct.AVLNode_st** %25
  br label %L258

L258:                                             ; preds = %L266, %L257
  %n_000001C401C10D08.14 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %26 = add i64 %n_000001C401C10D08.14, 0
  %27 = inttoptr i64 %26 to %struct.AVLNode_st**
  %R669 = load %struct.AVLNode_st*, %struct.AVLNode_st** %27
  %28 = ptrtoint %struct.AVLNode_st* %R669 to i64
  %R670 = icmp ne i64 %28, 0
  %R67015 = zext i1 %R670 to i32
  %cond16 = icmp ne i32 %R67015, 0
  br i1 %cond16, label %L259, label %L267

L259:                                             ; preds = %L258
  %k_000001C401C108A8.17 = ptrtoint i8** %k_000001C401C108A8. to i64
  %29 = add i64 %k_000001C401C108A8.17, 0
  %30 = inttoptr i64 %29 to i8**
  %R671 = load i8*, i8** %30
  %n_000001C401C10D08.18 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %31 = add i64 %n_000001C401C10D08.18, 0
  %32 = inttoptr i64 %31 to %struct.AVLNode_st**
  %R672 = load %struct.AVLNode_st*, %struct.AVLNode_st** %32
  %R67219 = ptrtoint %struct.AVLNode_st* %R672 to i64
  %R673 = add i64 %R67219, 32
  %R67320 = inttoptr i64 %R673 to %struct.AVLNode_st*
  %R674 = bitcast %struct.AVLNode_st* %R67320 to i8*
  %vtbl_000001C401C10EC8.21 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401C10EC8. to i64
  %33 = add i64 %vtbl_000001C401C10EC8.21, 0
  %34 = inttoptr i64 %33 to %struct.avl_vtbl**
  %R675 = load %struct.avl_vtbl*, %struct.avl_vtbl** %34
  %R67522 = ptrtoint %struct.avl_vtbl* %R675 to i64
  %35 = add i64 %R67522, 0
  %36 = inttoptr i64 %35 to i32 (i8*, i8*)**
  %R676 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %36
  %R677 = bitcast i32 (i8*, i8*)* %R676 to i8*
  %R67723 = bitcast i8* %R677 to i32 (i8*, i8*)*
  %R67724 = call i32 %R67723(i8* %R671, i8* %R674)
  %compresult_000001C401C11948.25 = ptrtoint i32* %compresult_000001C401C11948. to i64
  %37 = add i64 %compresult_000001C401C11948.25, 0
  %38 = inttoptr i64 %37 to i32*
  store i32 %R67724, i32* %38
  %compresult_000001C401C11948.26 = ptrtoint i32* %compresult_000001C401C11948. to i64
  %39 = add i64 %compresult_000001C401C11948.26, 0
  %40 = inttoptr i64 %39 to i32*
  %R678 = load i32, i32* %40
  %R679 = icmp slt i32 %R678, 0
  %R67927 = zext i1 %R679 to i32
  %cond28 = icmp ne i32 %R67927, 0
  br i1 %cond28, label %L260, label %L261

L260:                                             ; preds = %L259
  %n_000001C401C10D08.29 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %41 = add i64 %n_000001C401C10D08.29, 0
  %42 = inttoptr i64 %41 to %struct.AVLNode_st**
  %R680 = load %struct.AVLNode_st*, %struct.AVLNode_st** %42
  %R68030 = ptrtoint %struct.AVLNode_st* %R680 to i64
  %43 = add i64 %R68030, 8
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  %R681 = load %struct.AVLNode_st*, %struct.AVLNode_st** %44
  %n_000001C401C10D08.31 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %45 = add i64 %n_000001C401C10D08.31, 0
  %46 = inttoptr i64 %45 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R681, %struct.AVLNode_st** %46
  br label %L265

L261:                                             ; preds = %L259
  %compresult_000001C401C11948.32 = ptrtoint i32* %compresult_000001C401C11948. to i64
  %47 = add i64 %compresult_000001C401C11948.32, 0
  %48 = inttoptr i64 %47 to i32*
  %R682 = load i32, i32* %48
  %R683 = icmp sgt i32 %R682, 0
  %R68333 = zext i1 %R683 to i32
  %cond34 = icmp ne i32 %R68333, 0
  br i1 %cond34, label %L262, label %L263

L262:                                             ; preds = %L261
  %n_000001C401C10D08.35 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %49 = add i64 %n_000001C401C10D08.35, 0
  %50 = inttoptr i64 %49 to %struct.AVLNode_st**
  %R684 = load %struct.AVLNode_st*, %struct.AVLNode_st** %50
  %R68436 = ptrtoint %struct.AVLNode_st* %R684 to i64
  %51 = add i64 %R68436, 16
  %52 = inttoptr i64 %51 to %struct.AVLNode_st**
  %R685 = load %struct.AVLNode_st*, %struct.AVLNode_st** %52
  %n_000001C401C10D08.37 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %53 = add i64 %n_000001C401C10D08.37, 0
  %54 = inttoptr i64 %53 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R685, %struct.AVLNode_st** %54
  br label %L264

L263:                                             ; preds = %L261
  br label %L267

L264:                                             ; preds = %L262
  br label %L265

L265:                                             ; preds = %L264, %L260
  br label %L266

L266:                                             ; preds = %L265
  br label %L258

L267:                                             ; preds = %L263, %L258
  %n_000001C401C10D08.38 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %55 = add i64 %n_000001C401C10D08.38, 0
  %56 = inttoptr i64 %55 to %struct.AVLNode_st**
  %R686 = load %struct.AVLNode_st*, %struct.AVLNode_st** %56
  %57 = ptrtoint %struct.AVLNode_st* %R686 to i64
  %R687 = icmp eq i64 %57, 0
  %R68739 = zext i1 %R687 to i32
  %cond40 = icmp ne i32 %R68739, 0
  br i1 %cond40, label %L268, label %L269

L268:                                             ; preds = %L267
  store i32 -1, i32* %0
  br label %L270

L269:                                             ; preds = %L267
  %tree_000001C401C106E8.41 = ptrtoint %struct.avltree** %tree_000001C401C106E8. to i64
  %58 = add i64 %tree_000001C401C106E8.41, 0
  %59 = inttoptr i64 %58 to %struct.avltree**
  %R688 = load %struct.avltree*, %struct.avltree** %59
  %n_000001C401C10D08.42 = ptrtoint %struct.AVLNode_st** %n_000001C401C10D08. to i64
  %60 = add i64 %n_000001C401C10D08.42, 0
  %61 = inttoptr i64 %60 to %struct.AVLNode_st**
  %R689 = load %struct.AVLNode_st*, %struct.AVLNode_st** %61
  %R68943 = ptrtoint %struct.AVLNode_st* %R689 to i64
  %R690 = add i64 %R68943, 32
  %R69044 = inttoptr i64 %R690 to %struct.AVLNode_st*
  %R691 = bitcast %struct.AVLNode_st* %R69044 to i8*
  %R692 = call i32 @AVLTree_DeleteObject(%struct.avltree* %R688, i8* %R691)
  store i32 0, i32* %0
  br label %L270

L270:                                             ; preds = %L269, %L268, %L256
  %62 = load i32, i32* %0
  ret i32 %62
}

define i8* @AVLTree_Search(%struct.avltree* %ARG1, i8* %ARG2) {
L271:
  %compresult_000001C401C12BA8. = alloca i32
  %current_000001C401C12828. = alloca %struct.AVLNode_st*
  %vtbl_000001C401C124A8. = alloca %struct.avl_vtbl*
  %root_000001C401C122E8. = alloca %struct.AVLNode_st*
  %k_000001C401C12048. = alloca i8*
  %tree_000001C401C11E88. = alloca %struct.avltree*
  %0 = alloca i8*
  %tree_000001C401C11E88.1 = ptrtoint %struct.avltree** %tree_000001C401C11E88. to i64
  %1 = add i64 %tree_000001C401C11E88.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %k_000001C401C12048.2 = ptrtoint i8** %k_000001C401C12048. to i64
  %3 = add i64 %k_000001C401C12048.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %tree_000001C401C11E88.3 = ptrtoint %struct.avltree** %tree_000001C401C11E88. to i64
  %5 = add i64 %tree_000001C401C11E88.3, 0
  %6 = inttoptr i64 %5 to %struct.avltree**
  %R693 = load %struct.avltree*, %struct.avltree** %6
  %R6934 = ptrtoint %struct.avltree* %R693 to i64
  %7 = add i64 %R6934, 8
  %8 = inttoptr i64 %7 to i8**
  %R694 = load i8*, i8** %8
  %R695 = bitcast i8* %R694 to %struct.AVLNode_st*
  %root_000001C401C122E8.5 = ptrtoint %struct.AVLNode_st** %root_000001C401C122E8. to i64
  %9 = add i64 %root_000001C401C122E8.5, 0
  %10 = inttoptr i64 %9 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R695, %struct.AVLNode_st** %10
  %tree_000001C401C11E88.6 = ptrtoint %struct.avltree** %tree_000001C401C11E88. to i64
  %11 = add i64 %tree_000001C401C11E88.6, 0
  %12 = inttoptr i64 %11 to %struct.avltree**
  %R696 = load %struct.avltree*, %struct.avltree** %12
  %R6967 = ptrtoint %struct.avltree* %R696 to i64
  %13 = add i64 %R6967, 0
  %14 = inttoptr i64 %13 to %struct.avl_vtbl**
  %R697 = load %struct.avl_vtbl*, %struct.avl_vtbl** %14
  %vtbl_000001C401C124A8.8 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401C124A8. to i64
  %15 = add i64 %vtbl_000001C401C124A8.8, 0
  %16 = inttoptr i64 %15 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %R697, %struct.avl_vtbl** %16
  %root_000001C401C122E8.9 = ptrtoint %struct.AVLNode_st** %root_000001C401C122E8. to i64
  %17 = add i64 %root_000001C401C122E8.9, 0
  %18 = inttoptr i64 %17 to %struct.AVLNode_st**
  %R698 = load %struct.AVLNode_st*, %struct.AVLNode_st** %18
  %cond = icmp ne %struct.AVLNode_st* %R698, null
  br i1 %cond, label %L272, label %L283

L272:                                             ; preds = %L271
  %root_000001C401C122E8.10 = ptrtoint %struct.AVLNode_st** %root_000001C401C122E8. to i64
  %19 = add i64 %root_000001C401C122E8.10, 0
  %20 = inttoptr i64 %19 to %struct.AVLNode_st**
  %R699 = load %struct.AVLNode_st*, %struct.AVLNode_st** %20
  %current_000001C401C12828.11 = ptrtoint %struct.AVLNode_st** %current_000001C401C12828. to i64
  %21 = add i64 %current_000001C401C12828.11, 0
  %22 = inttoptr i64 %21 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R699, %struct.AVLNode_st** %22
  br label %L273

L273:                                             ; preds = %L281, %L272
  %current_000001C401C12828.12 = ptrtoint %struct.AVLNode_st** %current_000001C401C12828. to i64
  %23 = add i64 %current_000001C401C12828.12, 0
  %24 = inttoptr i64 %23 to %struct.AVLNode_st**
  %R700 = load %struct.AVLNode_st*, %struct.AVLNode_st** %24
  %cond13 = icmp ne %struct.AVLNode_st* %R700, null
  br i1 %cond13, label %L274, label %L282

L274:                                             ; preds = %L273
  %k_000001C401C12048.14 = ptrtoint i8** %k_000001C401C12048. to i64
  %25 = add i64 %k_000001C401C12048.14, 0
  %26 = inttoptr i64 %25 to i8**
  %R701 = load i8*, i8** %26
  %current_000001C401C12828.15 = ptrtoint %struct.AVLNode_st** %current_000001C401C12828. to i64
  %27 = add i64 %current_000001C401C12828.15, 0
  %28 = inttoptr i64 %27 to %struct.AVLNode_st**
  %R702 = load %struct.AVLNode_st*, %struct.AVLNode_st** %28
  %R70216 = ptrtoint %struct.AVLNode_st* %R702 to i64
  %R703 = add i64 %R70216, 32
  %R70317 = inttoptr i64 %R703 to %struct.AVLNode_st*
  %R704 = bitcast %struct.AVLNode_st* %R70317 to i8*
  %vtbl_000001C401C124A8.18 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401C124A8. to i64
  %29 = add i64 %vtbl_000001C401C124A8.18, 0
  %30 = inttoptr i64 %29 to %struct.avl_vtbl**
  %R705 = load %struct.avl_vtbl*, %struct.avl_vtbl** %30
  %R70519 = ptrtoint %struct.avl_vtbl* %R705 to i64
  %31 = add i64 %R70519, 0
  %32 = inttoptr i64 %31 to i32 (i8*, i8*)**
  %R706 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %32
  %R707 = bitcast i32 (i8*, i8*)* %R706 to i8*
  %R70720 = bitcast i8* %R707 to i32 (i8*, i8*)*
  %R70721 = call i32 %R70720(i8* %R701, i8* %R704)
  %compresult_000001C401C12BA8.22 = ptrtoint i32* %compresult_000001C401C12BA8. to i64
  %33 = add i64 %compresult_000001C401C12BA8.22, 0
  %34 = inttoptr i64 %33 to i32*
  store i32 %R70721, i32* %34
  %compresult_000001C401C12BA8.23 = ptrtoint i32* %compresult_000001C401C12BA8. to i64
  %35 = add i64 %compresult_000001C401C12BA8.23, 0
  %36 = inttoptr i64 %35 to i32*
  %R708 = load i32, i32* %36
  %R709 = icmp eq i32 %R708, 0
  %R70924 = zext i1 %R709 to i32
  %cond25 = icmp ne i32 %R70924, 0
  br i1 %cond25, label %L275, label %L276

L275:                                             ; preds = %L274
  %current_000001C401C12828.26 = ptrtoint %struct.AVLNode_st** %current_000001C401C12828. to i64
  %37 = add i64 %current_000001C401C12828.26, 0
  %38 = inttoptr i64 %37 to %struct.AVLNode_st**
  %R710 = load %struct.AVLNode_st*, %struct.AVLNode_st** %38
  %R71027 = ptrtoint %struct.AVLNode_st* %R710 to i64
  %R711 = add i64 %R71027, 32
  %R71128 = inttoptr i64 %R711 to %struct.AVLNode_st*
  %R712 = bitcast %struct.AVLNode_st* %R71128 to i8*
  store i8* %R712, i8** %0
  br label %L284

L276:                                             ; preds = %L274
  %compresult_000001C401C12BA8.29 = ptrtoint i32* %compresult_000001C401C12BA8. to i64
  %39 = add i64 %compresult_000001C401C12BA8.29, 0
  %40 = inttoptr i64 %39 to i32*
  %R714 = load i32, i32* %40
  %R715 = icmp slt i32 %R714, 0
  %R71530 = zext i1 %R715 to i32
  %cond31 = icmp ne i32 %R71530, 0
  br i1 %cond31, label %L277, label %L278

L277:                                             ; preds = %L276
  %current_000001C401C12828.32 = ptrtoint %struct.AVLNode_st** %current_000001C401C12828. to i64
  %41 = add i64 %current_000001C401C12828.32, 0
  %42 = inttoptr i64 %41 to %struct.AVLNode_st**
  %R716 = load %struct.AVLNode_st*, %struct.AVLNode_st** %42
  %R71633 = ptrtoint %struct.AVLNode_st* %R716 to i64
  %43 = add i64 %R71633, 8
  %44 = inttoptr i64 %43 to %struct.AVLNode_st**
  %R717 = load %struct.AVLNode_st*, %struct.AVLNode_st** %44
  %current_000001C401C12828.34 = ptrtoint %struct.AVLNode_st** %current_000001C401C12828. to i64
  %45 = add i64 %current_000001C401C12828.34, 0
  %46 = inttoptr i64 %45 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R717, %struct.AVLNode_st** %46
  br label %L279

L278:                                             ; preds = %L276
  %current_000001C401C12828.35 = ptrtoint %struct.AVLNode_st** %current_000001C401C12828. to i64
  %47 = add i64 %current_000001C401C12828.35, 0
  %48 = inttoptr i64 %47 to %struct.AVLNode_st**
  %R718 = load %struct.AVLNode_st*, %struct.AVLNode_st** %48
  %R71836 = ptrtoint %struct.AVLNode_st* %R718 to i64
  %49 = add i64 %R71836, 16
  %50 = inttoptr i64 %49 to %struct.AVLNode_st**
  %R719 = load %struct.AVLNode_st*, %struct.AVLNode_st** %50
  %current_000001C401C12828.37 = ptrtoint %struct.AVLNode_st** %current_000001C401C12828. to i64
  %51 = add i64 %current_000001C401C12828.37, 0
  %52 = inttoptr i64 %51 to %struct.AVLNode_st**
  store %struct.AVLNode_st* %R719, %struct.AVLNode_st** %52
  br label %L279

L279:                                             ; preds = %L278, %L277
  br label %L280

L280:                                             ; preds = %L279
  br label %L281

L281:                                             ; preds = %L280
  br label %L273

L282:                                             ; preds = %L273
  br label %L283

L283:                                             ; preds = %L282, %L271
  store i8* null, i8** %0
  br label %L284

L284:                                             ; preds = %L283, %L275
  %53 = load i8*, i8** %0
  ret i8* %53
}

define %struct.avltree* @AVLTree_New(%struct.avltree* %ARG1, %struct.avl_vtbl* %ARG2, i32 %ARG3, i32 %ARG4) {
L285:
  %growby_000001C401C13708. = alloca i32
  %objsize_000001C401C13628. = alloca i32
  %vtbl_000001C401C13468. = alloca %struct.avl_vtbl*
  %tree_000001C401C132A8. = alloca %struct.avltree*
  %0 = alloca %struct.avltree*
  %tree_000001C401C132A8.1 = ptrtoint %struct.avltree** %tree_000001C401C132A8. to i64
  %1 = add i64 %tree_000001C401C132A8.1, 0
  %2 = inttoptr i64 %1 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %2
  %vtbl_000001C401C13468.2 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401C13468. to i64
  %3 = add i64 %vtbl_000001C401C13468.2, 0
  %4 = inttoptr i64 %3 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %ARG2, %struct.avl_vtbl** %4
  %objsize_000001C401C13628.3 = ptrtoint i32* %objsize_000001C401C13628. to i64
  %5 = add i64 %objsize_000001C401C13628.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 %ARG3, i32* %6
  %growby_000001C401C13708.4 = ptrtoint i32* %growby_000001C401C13708. to i64
  %7 = add i64 %growby_000001C401C13708.4, 0
  %8 = inttoptr i64 %7 to i32*
  store i32 %ARG4, i32* %8
  %tree_000001C401C132A8.5 = ptrtoint %struct.avltree** %tree_000001C401C132A8. to i64
  %9 = add i64 %tree_000001C401C132A8.5, 0
  %10 = inttoptr i64 %9 to %struct.avltree**
  %R720 = load %struct.avltree*, %struct.avltree** %10
  %R7206 = ptrtoint %struct.avltree* %R720 to i64
  %11 = add i64 %R7206, 8
  %12 = inttoptr i64 %11 to i8**
  store i8* null, i8** %12
  %vtbl_000001C401C13468.7 = ptrtoint %struct.avl_vtbl** %vtbl_000001C401C13468. to i64
  %13 = add i64 %vtbl_000001C401C13468.7, 0
  %14 = inttoptr i64 %13 to %struct.avl_vtbl**
  %R721 = load %struct.avl_vtbl*, %struct.avl_vtbl** %14
  %tree_000001C401C132A8.8 = ptrtoint %struct.avltree** %tree_000001C401C132A8. to i64
  %15 = add i64 %tree_000001C401C132A8.8, 0
  %16 = inttoptr i64 %15 to %struct.avltree**
  %R722 = load %struct.avltree*, %struct.avltree** %16
  %R7229 = ptrtoint %struct.avltree* %R722 to i64
  %17 = add i64 %R7229, 0
  %18 = inttoptr i64 %17 to %struct.avl_vtbl**
  store %struct.avl_vtbl* %R721, %struct.avl_vtbl** %18
  %objsize_000001C401C13628.10 = ptrtoint i32* %objsize_000001C401C13628. to i64
  %19 = add i64 %objsize_000001C401C13628.10, 0
  %20 = inttoptr i64 %19 to i32*
  %R723 = load i32, i32* %20
  %tree_000001C401C132A8.11 = ptrtoint %struct.avltree** %tree_000001C401C132A8. to i64
  %21 = add i64 %tree_000001C401C132A8.11, 0
  %22 = inttoptr i64 %21 to %struct.avltree**
  %R724 = load %struct.avltree*, %struct.avltree** %22
  %R72412 = ptrtoint %struct.avltree* %R724 to i64
  %23 = add i64 %R72412, 20
  %24 = inttoptr i64 %23 to i32*
  store i32 %R723, i32* %24
  %tree_000001C401C132A8.13 = ptrtoint %struct.avltree** %tree_000001C401C132A8. to i64
  %25 = add i64 %tree_000001C401C132A8.13, 0
  %26 = inttoptr i64 %25 to %struct.avltree**
  %R725 = load %struct.avltree*, %struct.avltree** %26
  %R72514 = ptrtoint %struct.avltree* %R725 to i64
  %27 = add i64 %R72514, 16
  %28 = inttoptr i64 %27 to i32*
  store i32 0, i32* %28
  %objsize_000001C401C13628.15 = ptrtoint i32* %objsize_000001C401C13628. to i64
  %29 = add i64 %objsize_000001C401C13628.15, 0
  %30 = inttoptr i64 %29 to i32*
  %R726 = load i32, i32* %30
  %R727 = sext i32 %R726 to i64
  %R728 = add i64 %R727, 32
  %R729 = trunc i64 %R728 to i32
  %growby_000001C401C13708.16 = ptrtoint i32* %growby_000001C401C13708. to i64
  %31 = add i64 %growby_000001C401C13708.16, 0
  %32 = inttoptr i64 %31 to i32*
  %R730 = load i32, i32* %32
  %R731 = call %struct.allocator_st* @new_allocator(i32 %R729, i32 %R730)
  %tree_000001C401C132A8.17 = ptrtoint %struct.avltree** %tree_000001C401C132A8. to i64
  %33 = add i64 %tree_000001C401C132A8.17, 0
  %34 = inttoptr i64 %33 to %struct.avltree**
  %R732 = load %struct.avltree*, %struct.avltree** %34
  %R73218 = ptrtoint %struct.avltree* %R732 to i64
  %35 = add i64 %R73218, 24
  %36 = inttoptr i64 %35 to %struct.allocator_st**
  store %struct.allocator_st* %R731, %struct.allocator_st** %36
  %tree_000001C401C132A8.19 = ptrtoint %struct.avltree** %tree_000001C401C132A8. to i64
  %37 = add i64 %tree_000001C401C132A8.19, 0
  %38 = inttoptr i64 %37 to %struct.avltree**
  %R733 = load %struct.avltree*, %struct.avltree** %38
  store %struct.avltree* %R733, %struct.avltree** %0
  br label %L286

L286:                                             ; preds = %L285
  %39 = load %struct.avltree*, %struct.avltree** %0
  ret %struct.avltree* %R733
}

define void @AVLTree_Destroy(%struct.avltree* %ARG1) {
L287:
  %tree_000001C401C13D28. = alloca %struct.avltree*
  %tree_000001C401C13D28.1 = ptrtoint %struct.avltree** %tree_000001C401C13D28. to i64
  %0 = add i64 %tree_000001C401C13D28.1, 0
  %1 = inttoptr i64 %0 to %struct.avltree**
  store %struct.avltree* %ARG1, %struct.avltree** %1
  %tree_000001C401C13D28.2 = ptrtoint %struct.avltree** %tree_000001C401C13D28. to i64
  %2 = add i64 %tree_000001C401C13D28.2, 0
  %3 = inttoptr i64 %2 to %struct.avltree**
  %R735 = load %struct.avltree*, %struct.avltree** %3
  %R7353 = ptrtoint %struct.avltree* %R735 to i64
  %4 = add i64 %R7353, 0
  %5 = inttoptr i64 %4 to %struct.avl_vtbl**
  %R736 = load %struct.avl_vtbl*, %struct.avl_vtbl** %5
  %R7364 = ptrtoint %struct.avl_vtbl* %R736 to i64
  %6 = add i64 %R7364, 24
  %7 = inttoptr i64 %6 to void (i8*)**
  %R737 = load void (i8*)*, void (i8*)** %7
  %8 = ptrtoint void (i8*)* %R737 to i64
  %R738 = icmp ne i64 %8, 0
  %R7385 = zext i1 %R738 to i32
  %cond = icmp ne i32 %R7385, 0
  br i1 %cond, label %L288, label %L289

L288:                                             ; preds = %L287
  %tree_000001C401C13D28.6 = ptrtoint %struct.avltree** %tree_000001C401C13D28. to i64
  %9 = add i64 %tree_000001C401C13D28.6, 0
  %10 = inttoptr i64 %9 to %struct.avltree**
  %R739 = load %struct.avltree*, %struct.avltree** %10
  %R7397 = ptrtoint %struct.avltree* %R739 to i64
  %11 = add i64 %R7397, 8
  %12 = inttoptr i64 %11 to i8**
  %R740 = load i8*, i8** %12
  %R741 = bitcast i8* %R740 to %struct.AVLNode_st*
  %tree_000001C401C13D28.8 = ptrtoint %struct.avltree** %tree_000001C401C13D28. to i64
  %13 = add i64 %tree_000001C401C13D28.8, 0
  %14 = inttoptr i64 %13 to %struct.avltree**
  %R742 = load %struct.avltree*, %struct.avltree** %14
  %R7429 = ptrtoint %struct.avltree* %R742 to i64
  %15 = add i64 %R7429, 0
  %16 = inttoptr i64 %15 to %struct.avl_vtbl**
  %R743 = load %struct.avl_vtbl*, %struct.avl_vtbl** %16
  %R74310 = ptrtoint %struct.avl_vtbl* %R743 to i64
  %17 = add i64 %R74310, 24
  %18 = inttoptr i64 %17 to void (i8*)**
  %R744 = load void (i8*)*, void (i8*)** %18
  call void @AVLTree_ForwardApply(%struct.AVLNode_st* %R741, void (i8*)* %R744)
  br label %L289

L289:                                             ; preds = %L288, %L287
  %tree_000001C401C13D28.11 = ptrtoint %struct.avltree** %tree_000001C401C13D28. to i64
  %19 = add i64 %tree_000001C401C13D28.11, 0
  %20 = inttoptr i64 %19 to %struct.avltree**
  %R745 = load %struct.avltree*, %struct.avltree** %20
  %R74512 = ptrtoint %struct.avltree* %R745 to i64
  %21 = add i64 %R74512, 24
  %22 = inttoptr i64 %21 to %struct.allocator_st**
  %R746 = load %struct.allocator_st*, %struct.allocator_st** %22
  call void @destroy_allocator(%struct.allocator_st* %R746)
  br label %L290

L290:                                             ; preds = %L289
  ret void
}

define internal i32 @comparekeys(i8* %ARG1, i8* %ARG2) {
L291:
  %rec_000001C401C14C08. = alloca %struct.record*
  %ikey_000001C401C14A48. = alloca i32*
  %object_000001C401C147A8. = alloca i8*
  %key_000001C401C145E8. = alloca i8*
  %0 = alloca i32
  %key_000001C401C145E8.1 = ptrtoint i8** %key_000001C401C145E8. to i64
  %1 = add i64 %key_000001C401C145E8.1, 0
  %2 = inttoptr i64 %1 to i8**
  store i8* %ARG1, i8** %2
  %object_000001C401C147A8.2 = ptrtoint i8** %object_000001C401C147A8. to i64
  %3 = add i64 %object_000001C401C147A8.2, 0
  %4 = inttoptr i64 %3 to i8**
  store i8* %ARG2, i8** %4
  %key_000001C401C145E8.3 = ptrtoint i8** %key_000001C401C145E8. to i64
  %5 = add i64 %key_000001C401C145E8.3, 0
  %6 = inttoptr i64 %5 to i8**
  %R747 = load i8*, i8** %6
  %R748 = bitcast i8* %R747 to i32*
  %ikey_000001C401C14A48.4 = ptrtoint i32** %ikey_000001C401C14A48. to i64
  %7 = add i64 %ikey_000001C401C14A48.4, 0
  %8 = inttoptr i64 %7 to i32**
  store i32* %R748, i32** %8
  %object_000001C401C147A8.5 = ptrtoint i8** %object_000001C401C147A8. to i64
  %9 = add i64 %object_000001C401C147A8.5, 0
  %10 = inttoptr i64 %9 to i8**
  %R749 = load i8*, i8** %10
  %R750 = bitcast i8* %R749 to %struct.record*
  %rec_000001C401C14C08.6 = ptrtoint %struct.record** %rec_000001C401C14C08. to i64
  %11 = add i64 %rec_000001C401C14C08.6, 0
  %12 = inttoptr i64 %11 to %struct.record**
  store %struct.record* %R750, %struct.record** %12
  %ikey_000001C401C14A48.7 = ptrtoint i32** %ikey_000001C401C14A48. to i64
  %13 = add i64 %ikey_000001C401C14A48.7, 0
  %14 = inttoptr i64 %13 to i32**
  %R751 = load i32*, i32** %14
  %R7518 = ptrtoint i32* %R751 to i64
  %15 = add i64 %R7518, 0
  %16 = inttoptr i64 %15 to i32*
  %R752 = load i32, i32* %16
  %rec_000001C401C14C08.9 = ptrtoint %struct.record** %rec_000001C401C14C08. to i64
  %17 = add i64 %rec_000001C401C14C08.9, 0
  %18 = inttoptr i64 %17 to %struct.record**
  %R753 = load %struct.record*, %struct.record** %18
  %R75310 = ptrtoint %struct.record* %R753 to i64
  %19 = add i64 %R75310, 0
  %20 = inttoptr i64 %19 to i32*
  %R754 = load i32, i32* %20
  %R755 = sub i32 %R752, %R754
  store i32 %R755, i32* %0
  br label %L292

L292:                                             ; preds = %L291
  %21 = load i32, i32* %0
  ret i32 %R755
}

define internal void @createobject(i8* %ARG1, i8* %ARG2) {
L293:
  %rec_000001C401C15928. = alloca %struct.record*
  %ikey_000001C401C15768. = alloca i32*
  %key_000001C401C154C8. = alloca i8*
  %object_000001C401C15308. = alloca i8*
  %object_000001C401C15308.1 = ptrtoint i8** %object_000001C401C15308. to i64
  %0 = add i64 %object_000001C401C15308.1, 0
  %1 = inttoptr i64 %0 to i8**
  store i8* %ARG1, i8** %1
  %key_000001C401C154C8.2 = ptrtoint i8** %key_000001C401C154C8. to i64
  %2 = add i64 %key_000001C401C154C8.2, 0
  %3 = inttoptr i64 %2 to i8**
  store i8* %ARG2, i8** %3
  %key_000001C401C154C8.3 = ptrtoint i8** %key_000001C401C154C8. to i64
  %4 = add i64 %key_000001C401C154C8.3, 0
  %5 = inttoptr i64 %4 to i8**
  %R757 = load i8*, i8** %5
  %R758 = bitcast i8* %R757 to i32*
  %ikey_000001C401C15768.4 = ptrtoint i32** %ikey_000001C401C15768. to i64
  %6 = add i64 %ikey_000001C401C15768.4, 0
  %7 = inttoptr i64 %6 to i32**
  store i32* %R758, i32** %7
  %object_000001C401C15308.5 = ptrtoint i8** %object_000001C401C15308. to i64
  %8 = add i64 %object_000001C401C15308.5, 0
  %9 = inttoptr i64 %8 to i8**
  %R759 = load i8*, i8** %9
  %R760 = bitcast i8* %R759 to %struct.record*
  %rec_000001C401C15928.6 = ptrtoint %struct.record** %rec_000001C401C15928. to i64
  %10 = add i64 %rec_000001C401C15928.6, 0
  %11 = inttoptr i64 %10 to %struct.record**
  store %struct.record* %R760, %struct.record** %11
  %ikey_000001C401C15768.7 = ptrtoint i32** %ikey_000001C401C15768. to i64
  %12 = add i64 %ikey_000001C401C15768.7, 0
  %13 = inttoptr i64 %12 to i32**
  %R761 = load i32*, i32** %13
  %R7618 = ptrtoint i32* %R761 to i64
  %14 = add i64 %R7618, 0
  %15 = inttoptr i64 %14 to i32*
  %R762 = load i32, i32* %15
  %rec_000001C401C15928.9 = ptrtoint %struct.record** %rec_000001C401C15928. to i64
  %16 = add i64 %rec_000001C401C15928.9, 0
  %17 = inttoptr i64 %16 to %struct.record**
  %R763 = load %struct.record*, %struct.record** %17
  %R76310 = ptrtoint %struct.record* %R763 to i64
  %18 = add i64 %R76310, 0
  %19 = inttoptr i64 %18 to i32*
  store i32 %R762, i32* %19
  br label %L294

L294:                                             ; preds = %L293
  ret void
}

define internal void @destroyobject(i8* %ARG1) {
L295:
  %object_000001C401C16028. = alloca i8*
  %object_000001C401C16028.1 = ptrtoint i8** %object_000001C401C16028. to i64
  %0 = add i64 %object_000001C401C16028.1, 0
  %1 = inttoptr i64 %0 to i8**
  store i8* %ARG1, i8** %1
  br label %L296

L296:                                             ; preds = %L295
  ret void
}

define internal void @assignobject(i8* %ARG1, i8* %ARG2) {
L297:
  %rec2_000001C401C16AA8. = alloca %struct.record*
  %rec1_000001C401C168E8. = alloca %struct.record*
  %srcobj_000001C401C16648. = alloca i8*
  %dstobj_000001C401C16488. = alloca i8*
  %dstobj_000001C401C16488.1 = ptrtoint i8** %dstobj_000001C401C16488. to i64
  %0 = add i64 %dstobj_000001C401C16488.1, 0
  %1 = inttoptr i64 %0 to i8**
  store i8* %ARG1, i8** %1
  %srcobj_000001C401C16648.2 = ptrtoint i8** %srcobj_000001C401C16648. to i64
  %2 = add i64 %srcobj_000001C401C16648.2, 0
  %3 = inttoptr i64 %2 to i8**
  store i8* %ARG2, i8** %3
  %dstobj_000001C401C16488.3 = ptrtoint i8** %dstobj_000001C401C16488. to i64
  %4 = add i64 %dstobj_000001C401C16488.3, 0
  %5 = inttoptr i64 %4 to i8**
  %R764 = load i8*, i8** %5
  %R765 = bitcast i8* %R764 to %struct.record*
  %rec1_000001C401C168E8.4 = ptrtoint %struct.record** %rec1_000001C401C168E8. to i64
  %6 = add i64 %rec1_000001C401C168E8.4, 0
  %7 = inttoptr i64 %6 to %struct.record**
  store %struct.record* %R765, %struct.record** %7
  %srcobj_000001C401C16648.5 = ptrtoint i8** %srcobj_000001C401C16648. to i64
  %8 = add i64 %srcobj_000001C401C16648.5, 0
  %9 = inttoptr i64 %8 to i8**
  %R766 = load i8*, i8** %9
  %R767 = bitcast i8* %R766 to %struct.record*
  %rec2_000001C401C16AA8.6 = ptrtoint %struct.record** %rec2_000001C401C16AA8. to i64
  %10 = add i64 %rec2_000001C401C16AA8.6, 0
  %11 = inttoptr i64 %10 to %struct.record**
  store %struct.record* %R767, %struct.record** %11
  %rec2_000001C401C16AA8.7 = ptrtoint %struct.record** %rec2_000001C401C16AA8. to i64
  %12 = add i64 %rec2_000001C401C16AA8.7, 0
  %13 = inttoptr i64 %12 to %struct.record**
  %R768 = load %struct.record*, %struct.record** %13
  %R7688 = ptrtoint %struct.record* %R768 to i64
  %14 = add i64 %R7688, 0
  %15 = inttoptr i64 %14 to i32*
  %R769 = load i32, i32* %15
  %rec1_000001C401C168E8.9 = ptrtoint %struct.record** %rec1_000001C401C168E8. to i64
  %16 = add i64 %rec1_000001C401C168E8.9, 0
  %17 = inttoptr i64 %16 to %struct.record**
  %R770 = load %struct.record*, %struct.record** %17
  %R77010 = ptrtoint %struct.record* %R770 to i64
  %18 = add i64 %R77010, 0
  %19 = inttoptr i64 %18 to i32*
  store i32 %R769, i32* %19
  br label %L298

L298:                                             ; preds = %L297
  ret void
}

define i32 @main() {
L299:
  %rec_000001C401C17D08. = alloca %struct.record*
  %key_000001C401C17C28. = alloca i32
  %i_000001C401C17988. = alloca i32
  %tree_000001C401C176E8. = alloca %struct.avltree
  %vtable_000001C401C177C8. = alloca %struct.avl_vtbl
  %testdata_000001C401C17528. = alloca [20 x i32]
  %0 = alloca i32
  store i32 0, i32* @once
  %testdata_000001C401C17528.1 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %1 = add i64 %testdata_000001C401C17528.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 97, i32* %2
  %testdata_000001C401C17528.2 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %3 = add i64 %testdata_000001C401C17528.2, 4
  %4 = inttoptr i64 %3 to i32*
  store i32 103, i32* %4
  %testdata_000001C401C17528.3 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %5 = add i64 %testdata_000001C401C17528.3, 8
  %6 = inttoptr i64 %5 to i32*
  store i32 113, i32* %6
  %testdata_000001C401C17528.4 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %7 = add i64 %testdata_000001C401C17528.4, 12
  %8 = inttoptr i64 %7 to i32*
  store i32 119, i32* %8
  %testdata_000001C401C17528.5 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %9 = add i64 %testdata_000001C401C17528.5, 16
  %10 = inttoptr i64 %9 to i32*
  store i32 101, i32* %10
  %testdata_000001C401C17528.6 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %11 = add i64 %testdata_000001C401C17528.6, 20
  %12 = inttoptr i64 %11 to i32*
  store i32 102, i32* %12
  %testdata_000001C401C17528.7 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %13 = add i64 %testdata_000001C401C17528.7, 24
  %14 = inttoptr i64 %13 to i32*
  store i32 98, i32* %14
  %testdata_000001C401C17528.8 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %15 = add i64 %testdata_000001C401C17528.8, 28
  %16 = inttoptr i64 %15 to i32*
  store i32 120, i32* %16
  %testdata_000001C401C17528.9 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %17 = add i64 %testdata_000001C401C17528.9, 32
  %18 = inttoptr i64 %17 to i32*
  store i32 107, i32* %18
  %testdata_000001C401C17528.10 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %19 = add i64 %testdata_000001C401C17528.10, 36
  %20 = inttoptr i64 %19 to i32*
  store i32 108, i32* %20
  %testdata_000001C401C17528.11 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %21 = add i64 %testdata_000001C401C17528.11, 40
  %22 = inttoptr i64 %21 to i32*
  store i32 112, i32* %22
  %testdata_000001C401C17528.12 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %23 = add i64 %testdata_000001C401C17528.12, 44
  %24 = inttoptr i64 %23 to i32*
  store i32 109, i32* %24
  %testdata_000001C401C17528.13 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %25 = add i64 %testdata_000001C401C17528.13, 48
  %26 = inttoptr i64 %25 to i32*
  store i32 115, i32* %26
  %testdata_000001C401C17528.14 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %27 = add i64 %testdata_000001C401C17528.14, 52
  %28 = inttoptr i64 %27 to i32*
  store i32 121, i32* %28
  %testdata_000001C401C17528.15 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %29 = add i64 %testdata_000001C401C17528.15, 56
  %30 = inttoptr i64 %29 to i32*
  store i32 116, i32* %30
  %testdata_000001C401C17528.16 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %31 = add i64 %testdata_000001C401C17528.16, 60
  %32 = inttoptr i64 %31 to i32*
  store i32 117, i32* %32
  %testdata_000001C401C17528.17 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %33 = add i64 %testdata_000001C401C17528.17, 64
  %34 = inttoptr i64 %33 to i32*
  store i32 111, i32* %34
  %testdata_000001C401C17528.18 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %35 = add i64 %testdata_000001C401C17528.18, 68
  %36 = inttoptr i64 %35 to i32*
  store i32 114, i32* %36
  %testdata_000001C401C17528.19 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %37 = add i64 %testdata_000001C401C17528.19, 72
  %38 = inttoptr i64 %37 to i32*
  store i32 106, i32* %38
  %testdata_000001C401C17528.20 = ptrtoint [20 x i32]* %testdata_000001C401C17528. to i64
  %39 = add i64 %testdata_000001C401C17528.20, 76
  %40 = inttoptr i64 %39 to i32*
  store i32 48, i32* %40
  %vtable_000001C401C177C8.21 = ptrtoint %struct.avl_vtbl* %vtable_000001C401C177C8. to i64
  %41 = add i64 %vtable_000001C401C177C8.21, 0
  %42 = inttoptr i64 %41 to i32 (i8*, i8*)**
  store i32 (i8*, i8*)* @comparekeys, i32 (i8*, i8*)** %42
  %vtable_000001C401C177C8.22 = ptrtoint %struct.avl_vtbl* %vtable_000001C401C177C8. to i64
  %43 = add i64 %vtable_000001C401C177C8.22, 8
  %44 = inttoptr i64 %43 to void (i8*, i8*)**
  store void (i8*, i8*)* @createobject, void (i8*, i8*)** %44
  %vtable_000001C401C177C8.23 = ptrtoint %struct.avl_vtbl* %vtable_000001C401C177C8. to i64
  %45 = add i64 %vtable_000001C401C177C8.23, 24
  %46 = inttoptr i64 %45 to void (i8*)**
  store void (i8*)* @destroyobject, void (i8*)** %46
  %vtable_000001C401C177C8.24 = ptrtoint %struct.avl_vtbl* %vtable_000001C401C177C8. to i64
  %47 = add i64 %vtable_000001C401C177C8.24, 16
  %48 = inttoptr i64 %47 to void (i8*, i8*)**
  store void (i8*, i8*)* @assignobject, void (i8*, i8*)** %48
  %R777 = call %struct.avltree* @AVLTree_New(%struct.avltree* %tree_000001C401C176E8., %struct.avl_vtbl* %vtable_000001C401C177C8., i32 4, i32 1000)
  %i_000001C401C17988.25 = ptrtoint i32* %i_000001C401C17988. to i64
  %49 = add i64 %i_000001C401C17988.25, 0
  %50 = inttoptr i64 %49 to i32*
  store i32 0, i32* %50
  br label %L300

L300:                                             ; preds = %L302, %L299
  %i_000001C401C17988.26 = ptrtoint i32* %i_000001C401C17988. to i64
  %51 = add i64 %i_000001C401C17988.26, 0
  %52 = inttoptr i64 %51 to i32*
  %R778 = load i32, i32* %52
  %R779 = icmp slt i32 %R778, 20
  %R77927 = zext i1 %R779 to i32
  %cond = icmp ne i32 %R77927, 0
  br i1 %cond, label %L301, label %L303

L301:                                             ; preds = %L300
  %R780 = bitcast [20 x i32]* %testdata_000001C401C17528. to i32*
  %i_000001C401C17988.28 = ptrtoint i32* %i_000001C401C17988. to i64
  %53 = add i64 %i_000001C401C17988.28, 0
  %54 = inttoptr i64 %53 to i32*
  %R781 = load i32, i32* %54
  %R782 = sext i32 %R781 to i64
  %R783 = mul i64 %R782, 4
  %R78029 = ptrtoint i32* %R780 to i64
  %R784 = add i64 %R78029, %R783
  %R78430 = inttoptr i64 %R784 to i32*
  %R7843031 = ptrtoint i32* %R78430 to i64
  %55 = add i64 %R7843031, 0
  %56 = inttoptr i64 %55 to i32*
  %R785 = load i32, i32* %56
  %key_000001C401C17C28.32 = ptrtoint i32* %key_000001C401C17C28. to i64
  %57 = add i64 %key_000001C401C17C28.32, 0
  %58 = inttoptr i64 %57 to i32*
  store i32 %R785, i32* %58
  %R788 = bitcast i32* %key_000001C401C17C28. to i8*
  %R789 = call i8* @AVLTree_Insert(%struct.avltree* %tree_000001C401C176E8., i8* %R788)
  br label %L302

L302:                                             ; preds = %L301
  %i_000001C401C17988.33 = ptrtoint i32* %i_000001C401C17988. to i64
  %59 = add i64 %i_000001C401C17988.33, 0
  %60 = inttoptr i64 %59 to i32*
  %R790 = load i32, i32* %60
  %R791 = add i32 %R790, 1
  %i_000001C401C17988.34 = ptrtoint i32* %i_000001C401C17988. to i64
  %61 = add i64 %i_000001C401C17988.34, 0
  %62 = inttoptr i64 %61 to i32*
  store i32 %R791, i32* %62
  br label %L300

L303:                                             ; preds = %L300
  %R793 = call i8* @AVLTree_FindFirst(%struct.avltree* %tree_000001C401C176E8.)
  %R794 = bitcast i8* %R793 to %struct.record*
  %rec_000001C401C17D08.35 = ptrtoint %struct.record** %rec_000001C401C17D08. to i64
  %63 = add i64 %rec_000001C401C17D08.35, 0
  %64 = inttoptr i64 %63 to %struct.record**
  store %struct.record* %R794, %struct.record** %64
  br label %L304

L304:                                             ; preds = %L306, %L303
  %rec_000001C401C17D08.36 = ptrtoint %struct.record** %rec_000001C401C17D08. to i64
  %65 = add i64 %rec_000001C401C17D08.36, 0
  %66 = inttoptr i64 %65 to %struct.record**
  %R795 = load %struct.record*, %struct.record** %66
  %67 = ptrtoint %struct.record* %R795 to i64
  %R796 = icmp ne i64 %67, 0
  %R79637 = zext i1 %R796 to i32
  %cond38 = icmp ne i32 %R79637, 0
  br i1 %cond38, label %L305, label %L307

L305:                                             ; preds = %L304
  %rec_000001C401C17D08.39 = ptrtoint %struct.record** %rec_000001C401C17D08. to i64
  %68 = add i64 %rec_000001C401C17D08.39, 0
  %69 = inttoptr i64 %68 to %struct.record**
  %R798 = load %struct.record*, %struct.record** %69
  %R79840 = ptrtoint %struct.record* %R798 to i64
  %70 = add i64 %R79840, 0
  %71 = inttoptr i64 %70 to i32*
  %R799 = load i32, i32* %71
  %R800 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %R799)
  %rec_000001C401C17D08.41 = ptrtoint %struct.record** %rec_000001C401C17D08. to i64
  %72 = add i64 %rec_000001C401C17D08.41, 0
  %73 = inttoptr i64 %72 to %struct.record**
  %R802 = load %struct.record*, %struct.record** %73
  %R803 = bitcast %struct.record* %R802 to i8*
  %R804 = call i8* @AVLTree_FindNext(%struct.avltree* %tree_000001C401C176E8., i8* %R803)
  %R805 = bitcast i8* %R804 to %struct.record*
  %rec_000001C401C17D08.42 = ptrtoint %struct.record** %rec_000001C401C17D08. to i64
  %74 = add i64 %rec_000001C401C17D08.42, 0
  %75 = inttoptr i64 %74 to %struct.record**
  store %struct.record* %R805, %struct.record** %75
  br label %L306

L306:                                             ; preds = %L305
  br label %L304

L307:                                             ; preds = %L304
  call void @AVLTree_Destroy(%struct.avltree* %tree_000001C401C176E8.)
  store i32 0, i32* %0
  br label %L308

L308:                                             ; preds = %L307
  %76 = load i32, i32* %0
  ret i32 0
}

attributes #0 = { argmemonly nounwind }
