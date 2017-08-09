; ModuleID = 'out.bc'
source_filename = "dmrC"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @init(i32* %ARG1) {
L0:
  %v_000002C3A1BDB998. = alloca i32*
  %v_000002C3A1BDB998.1 = ptrtoint i32** %v_000002C3A1BDB998. to i64
  %0 = add i64 %v_000002C3A1BDB998.1, 0
  %1 = inttoptr i64 %0 to i32**
  store i32* %ARG1, i32** %1
  %v_000002C3A1BDB998.2 = ptrtoint i32** %v_000002C3A1BDB998. to i64
  %2 = add i64 %v_000002C3A1BDB998.2, 0
  %3 = inttoptr i64 %2 to i32**
  %R1 = load i32*, i32** %3
  %R13 = ptrtoint i32* %R1 to i64
  %4 = add i64 %R13, 0
  %5 = inttoptr i64 %4 to i32*
  store i32 5, i32* %5
  br label %L1

L1:                                               ; preds = %L0
  ret void
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L2:
  %x_000002C3A1BDC6B8. = alloca [6 x i32]
  %x_000002C3A1BDC338. = alloca [5 x i32]
  %n_000002C3A1BDC258. = alloca i32
  %argv_000002C3A1BDBED8. = alloca i8**
  %argc_000002C3A1BDBDF8. = alloca i32
  %0 = alloca i32
  %argc_000002C3A1BDBDF8.1 = ptrtoint i32* %argc_000002C3A1BDBDF8. to i64
  %1 = add i64 %argc_000002C3A1BDBDF8.1, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 %ARG1, i32* %2
  %argv_000002C3A1BDBED8.2 = ptrtoint i8*** %argv_000002C3A1BDBED8. to i64
  %3 = add i64 %argv_000002C3A1BDBED8.2, 0
  %4 = inttoptr i64 %3 to i8***
  store i8** %ARG2, i8*** %4
  store i32 0, i32* %n_000002C3A1BDC258.
  %n_000002C3A1BDC258.3 = ptrtoint i32* %n_000002C3A1BDC258. to i64
  %5 = add i64 %n_000002C3A1BDC258.3, 0
  %6 = inttoptr i64 %5 to i32*
  store i32 0, i32* %6
  %R2 = bitcast [5 x i32]* %x_000002C3A1BDC338. to i32*
  call void @init(i32* %R2)
  %x_000002C3A1BDC338.4 = ptrtoint [5 x i32]* %x_000002C3A1BDC338. to i64
  %7 = add i64 %x_000002C3A1BDC338.4, 0
  %8 = inttoptr i64 %7 to i32*
  %R4 = load i32, i32* %8
  %n_000002C3A1BDC258.5 = ptrtoint i32* %n_000002C3A1BDC258. to i64
  %9 = add i64 %n_000002C3A1BDC258.5, 0
  %10 = inttoptr i64 %9 to i32*
  %R5 = load i32, i32* %10
  %R7 = add i32 %R5, %R4
  %n_000002C3A1BDC258.6 = ptrtoint i32* %n_000002C3A1BDC258. to i64
  %11 = add i64 %n_000002C3A1BDC258.6, 0
  %12 = inttoptr i64 %11 to i32*
  store i32 %R7, i32* %12
  %R9 = bitcast [6 x i32]* %x_000002C3A1BDC6B8. to i32*
  call void @init(i32* %R9)
  %x_000002C3A1BDC6B8.7 = ptrtoint [6 x i32]* %x_000002C3A1BDC6B8. to i64
  %13 = add i64 %x_000002C3A1BDC6B8.7, 0
  %14 = inttoptr i64 %13 to i32*
  %R11 = load i32, i32* %14
  %n_000002C3A1BDC258.8 = ptrtoint i32* %n_000002C3A1BDC258. to i64
  %15 = add i64 %n_000002C3A1BDC258.8, 0
  %16 = inttoptr i64 %15 to i32*
  %R12 = load i32, i32* %16
  %R14 = add i32 %R12, %R11
  %n_000002C3A1BDC258.9 = ptrtoint i32* %n_000002C3A1BDC258. to i64
  %17 = add i64 %n_000002C3A1BDC258.9, 0
  %18 = inttoptr i64 %17 to i32*
  store i32 %R14, i32* %18
  %n_000002C3A1BDC258.10 = ptrtoint i32* %n_000002C3A1BDC258. to i64
  %19 = add i64 %n_000002C3A1BDC258.10, 0
  %20 = inttoptr i64 %19 to i32*
  %R16 = load i32, i32* %20
  %R17 = icmp eq i32 %R16, 10
  %R1711 = zext i1 %R17 to i32
  %cond = icmp ne i32 %R1711, 0
  %select = select i1 %cond, i32 0, i32 1
  store i32 %select, i32* %0
  br label %L3

L3:                                               ; preds = %L2
  %21 = load i32, i32* %0
  ret i32 %select
}

attributes #0 = { argmemonly nounwind }
