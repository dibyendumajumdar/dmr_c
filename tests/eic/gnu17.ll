; ModuleID = 'out.bc'
source_filename = "dmrC"

%union.memory_word = type { [4 x i8] }

@mem = private global [10 x %union.memory_word] zeroinitializer, align 4
@fewest_demerits = private global i32 0, align 4
@best_bet = private global i16 0, align 2
@best_line = private global i16 -1, align 2
@.str = private constant [13 x i8] c"Test passed\0A\00"
@.str.1 = private constant [29 x i8] c"Test failed, best_line = %d\0A\00"

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture writeonly, i8, i32, i32, i1) #0

define internal void @foo(i16 %ARG1) {
L0:
  %r_00000209F3FDF618. = alloca i16
  %r_00000209F3FDF618.1 = ptrtoint i16* %r_00000209F3FDF618. to i64
  %0 = add i64 %r_00000209F3FDF618.1, 0
  %1 = inttoptr i64 %0 to i16*
  store i16 %ARG1, i16* %1
  br label %L1

L1:                                               ; preds = %L5, %L0
  %r_00000209F3FDF618.2 = ptrtoint i16* %r_00000209F3FDF618. to i64
  %2 = add i64 %r_00000209F3FDF618.2, 0
  %3 = inttoptr i64 %2 to i16*
  %R2 = load i16, i16* %3
  %R3 = zext i16 %R2 to i64
  %R4 = mul i64 %R3, 4
  %R5 = add i64 ptrtoint ([10 x %union.memory_word]* @mem to i64), %R4
  %R53 = inttoptr i64 %R5 to %union.memory_word*
  %R534 = ptrtoint %union.memory_word* %R53 to i64
  %4 = add i64 %R534, 0
  %5 = inttoptr i64 %4 to i8*
  %R6 = load i8, i8* %5
  %R7 = zext i8 %R6 to i32
  %R8 = icmp ne i32 %R7, 2
  %R85 = zext i1 %R8 to i32
  %cond = icmp ne i32 %R85, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %r_00000209F3FDF618.6 = ptrtoint i16* %r_00000209F3FDF618. to i64
  %6 = add i64 %r_00000209F3FDF618.6, 0
  %7 = inttoptr i64 %6 to i16*
  %R10 = load i16, i16* %7
  %R11 = zext i16 %R10 to i32
  %R12 = add i32 %R11, 2
  %R13 = sext i32 %R12 to i64
  %R14 = mul i64 %R13, 4
  %R15 = add i64 ptrtoint ([10 x %union.memory_word]* @mem to i64), %R14
  %R157 = inttoptr i64 %R15 to %union.memory_word*
  %R1578 = ptrtoint %union.memory_word* %R157 to i64
  %8 = add i64 %R1578, 0
  %9 = inttoptr i64 %8 to i32*
  %R16 = load i32, i32* %9
  %R18 = load i32, i32* @fewest_demerits
  %R19 = icmp ult i32 %R16, %R18
  %R199 = zext i1 %R19 to i32
  %cond10 = icmp ne i32 %R199, 0
  br i1 %cond10, label %L3, label %L4

L3:                                               ; preds = %L2
  %r_00000209F3FDF618.11 = ptrtoint i16* %r_00000209F3FDF618. to i64
  %10 = add i64 %r_00000209F3FDF618.11, 0
  %11 = inttoptr i64 %10 to i16*
  %R20 = load i16, i16* %11
  store i16 %R20, i16* @best_bet
  br label %L4

L4:                                               ; preds = %L3, %L2, %L1
  %r_00000209F3FDF618.12 = ptrtoint i16* %r_00000209F3FDF618. to i64
  %12 = add i64 %r_00000209F3FDF618.12, 0
  %13 = inttoptr i64 %12 to i16*
  %R22 = load i16, i16* %13
  %R23 = zext i16 %R22 to i64
  %R24 = mul i64 %R23, 4
  %R25 = add i64 ptrtoint ([10 x %union.memory_word]* @mem to i64), %R24
  %R2513 = inttoptr i64 %R25 to %union.memory_word*
  %R251314 = ptrtoint %union.memory_word* %R2513 to i64
  %14 = add i64 %R251314, 2
  %15 = inttoptr i64 %14 to i16*
  %R26 = load i16, i16* %15
  %r_00000209F3FDF618.15 = ptrtoint i16* %r_00000209F3FDF618. to i64
  %16 = add i64 %r_00000209F3FDF618.15, 0
  %17 = inttoptr i64 %16 to i16*
  store i16 %R26, i16* %17
  br label %L5

L5:                                               ; preds = %L4
  %r_00000209F3FDF618.16 = ptrtoint i16* %r_00000209F3FDF618. to i64
  %18 = add i64 %r_00000209F3FDF618.16, 0
  %19 = inttoptr i64 %18 to i16*
  %R27 = load i16, i16* %19
  %R28 = zext i16 %R27 to i32
  %R29 = icmp ne i32 %R28, 65494
  %R2917 = zext i1 %R29 to i32
  %cond18 = icmp ne i32 %R2917, 0
  br i1 %cond18, label %L1, label %L6

L6:                                               ; preds = %L5
  %R31 = load i16, i16* @best_bet
  %R32 = zext i16 %R31 to i32
  %R33 = add i32 %R32, 1
  %R34 = sext i32 %R33 to i64
  %R35 = mul i64 %R34, 4
  %R36 = add i64 ptrtoint ([10 x %union.memory_word]* @mem to i64), %R35
  %R3619 = inttoptr i64 %R36 to %union.memory_word*
  %R361920 = ptrtoint %union.memory_word* %R3619 to i64
  %20 = add i64 %R361920, 0
  %21 = inttoptr i64 %20 to i16*
  %R37 = load i16, i16* %21
  store i16 %R37, i16* @best_line
  br label %L7

L7:                                               ; preds = %L6
  ret void
}

define i32 @main() {
L8:
  %0 = alloca i32
  store i8 0, i8* getelementptr inbounds ([10 x %union.memory_word], [10 x %union.memory_word]* @mem, i32 0, i32 0, i32 0, i32 0)
  store i16 -42, i16* inttoptr (i64 add (i64 ptrtoint ([10 x %union.memory_word]* @mem to i64), i64 2) to i16*)
  store i16 456, i16* inttoptr (i64 add (i64 ptrtoint ([10 x %union.memory_word]* @mem to i64), i64 4) to i16*)
  store i32 30, i32* inttoptr (i64 add (i64 ptrtoint ([10 x %union.memory_word]* @mem to i64), i64 8) to i32*)
  call void @foo(i16 0)
  %R38 = load i16, i16* @best_line
  %R39 = zext i16 %R38 to i32
  %R40 = icmp eq i32 %R39, 456
  %R401 = zext i1 %R40 to i32
  %cond = icmp ne i32 %R401, 0
  br i1 %cond, label %L9, label %L10

L9:                                               ; preds = %L8
  %R42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  br label %L11

L10:                                              ; preds = %L8
  %R44 = load i16, i16* @best_line
  %R45 = zext i16 %R44 to i32
  %R46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0), i32 %R45)
  store i32 1, i32* %0
  br label %L12

L11:                                              ; preds = %L9
  store i32 0, i32* %0
  br label %L12

L12:                                              ; preds = %L11, %L10
  %1 = load i32, i32* %0
  ret i32 %1
}

declare i32 @printf(i8*, ...)

attributes #0 = { argmemonly nounwind }
