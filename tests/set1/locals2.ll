; ModuleID = 'out.bc'
source_filename = "dmrC"

%struct.mytype = type { i32, i32, double }

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @init(%struct.mytype* %ARG1) {
L0:
  %v_000001A111D2DBA8. = alloca %struct.mytype*
  %v_000001A111D2DBA8.1 = ptrtoint %struct.mytype** %v_000001A111D2DBA8. to i64
  %0 = add i64 %v_000001A111D2DBA8.1, 0
  %1 = inttoptr i64 %0 to %struct.mytype**
  store %struct.mytype* %ARG1, %struct.mytype** %1
  %v_000001A111D2DBA8.2 = ptrtoint %struct.mytype** %v_000001A111D2DBA8. to i64
  %2 = add i64 %v_000001A111D2DBA8.2, 0
  %3 = inttoptr i64 %2 to %struct.mytype**
  %R1 = load %struct.mytype*, %struct.mytype** %3
  %R13 = ptrtoint %struct.mytype* %R1 to i64
  %4 = add i64 %R13, 0
  %5 = inttoptr i64 %4 to i32*
  store i32 5, i32* %5
  %v_000001A111D2DBA8.4 = ptrtoint %struct.mytype** %v_000001A111D2DBA8. to i64
  %6 = add i64 %v_000001A111D2DBA8.4, 0
  %7 = inttoptr i64 %6 to %struct.mytype**
  %R2 = load %struct.mytype*, %struct.mytype** %7
  %R25 = ptrtoint %struct.mytype* %R2 to i64
  %8 = add i64 %R25, 4
  %9 = inttoptr i64 %8 to i32*
  store i32 5, i32* %9
  br label %L1

L1:                                               ; preds = %L0
  ret void
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L2:
  %x_000001A111D2E8C8. = alloca [6 x %struct.mytype]
  %x_000001A111D2E548. = alloca [5 x %struct.mytype]
  %n_000001A111D2E468. = alloca i32
  %argv_000001A111D2E0E8. = alloca i8**
  %argc_000001A111D2E008. = alloca i32
  %0 = alloca i32
  %argc_000001A111D2E008.1 = ptrtoint i32* %argc_000001A111D2E008. to i64
  %1 = add i64 %argc_000001A111D2E008.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %argv_000001A111D2E0E8.2 = ptrtoint i8*** %argv_000001A111D2E0E8. to i64
  %3 = add i64 %argv_000001A111D2E0E8.2, 0
  %4 = inttoptr i64 %3 to i8***
  store i8** %ARG2, i8*** %4
  store i32 0, i32* %n_000001A111D2E468.
  %n_000001A111D2E468.3 = ptrtoint i32* %n_000001A111D2E468. to i64
  %5 = add i64 %n_000001A111D2E468.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  %R3 = bitcast [5 x %struct.mytype]* %x_000001A111D2E548. to %struct.mytype*
  call void @init(%struct.mytype* %R3)
  %x_000001A111D2E548.4 = ptrtoint [5 x %struct.mytype]* %x_000001A111D2E548. to i64
  %7 = add i64 %x_000001A111D2E548.4, 4
  %8 = inttoptr i64 %7 to i32*
  %R5 = load i32, i32* %8
  %n_000001A111D2E468.5 = ptrtoint i32* %n_000001A111D2E468. to i64
  %9 = add i64 %n_000001A111D2E468.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R6 = load i32, i32* %10
  %R8 = add i32 %R6, %R5
  %n_000001A111D2E468.6 = ptrtoint i32* %n_000001A111D2E468. to i64
  %11 = add i64 %n_000001A111D2E468.6, 0
  %12 = inttoptr i64 %11 to i32*
  store i32 %R8, i32* %12
  %R10 = bitcast [6 x %struct.mytype]* %x_000001A111D2E8C8. to %struct.mytype*
  call void @init(%struct.mytype* %R10)
  %x_000001A111D2E8C8.7 = ptrtoint [6 x %struct.mytype]* %x_000001A111D2E8C8. to i64
  %13 = add i64 %x_000001A111D2E8C8.7, 0
  %14 = inttoptr i64 %13 to i32*
  %R12 = load i32, i32* %14
  %n_000001A111D2E468.8 = ptrtoint i32* %n_000001A111D2E468. to i64
  %15 = add i64 %n_000001A111D2E468.8, 0
  %16 = inttoptr i64 %15 to i32*
  %R13 = load i32, i32* %16
  %R15 = add i32 %R13, %R12
  %n_000001A111D2E468.9 = ptrtoint i32* %n_000001A111D2E468. to i64
  %17 = add i64 %n_000001A111D2E468.9, 0
  %18 = inttoptr i64 %17 to i32*
  store i32 %R15, i32* %18
  %n_000001A111D2E468.10 = ptrtoint i32* %n_000001A111D2E468. to i64
  %19 = add i64 %n_000001A111D2E468.10, 0
  %20 = inttoptr i64 %19 to i32*
  %R17 = load i32, i32* %20
  %R18 = icmp eq i32 %R17, 10
  %R1811 = zext i1 %R18 to i32
  %cond = icmp ne i32 %R1811, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %21 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
