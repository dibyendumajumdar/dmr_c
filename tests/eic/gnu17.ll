; ModuleID = 'out.bc'
source_filename = "sparse"

%union.memory_word = type { [4 x i8] }

@mem = private global [10 x %union.memory_word] zeroinitializer, align 4
@fewest_demerits = private global i32 0, align 4
@best_bet = private global i16 0, align 2
@best_line = private global i16 -1, align 2
@.str = private constant [13 x i8] c"Test passed\0A\00"
@.str.1 = private constant [29 x i8] c"Test failed, best_line = %d\0A\00"

define internal void @foo(i16 %ARG1) {
L0:
  %0 = alloca i16
  store i16 %ARG1, i16* %0
  br label %L1

L1:                                               ; preds = %L4, %L0
  %1 = load i16, i16* %0
  %R3 = zext i16 %1 to i64
  %R4 = mul i64 %R3, 4
  %2 = getelementptr inbounds i8, i8* getelementptr inbounds ([10 x %union.memory_word], [10 x %union.memory_word]* @mem, i32 0, i32 0, i32 0, i32 0), i64 %R4
  %3 = bitcast i8* %2 to %union.memory_word*
  %4 = bitcast %union.memory_word* %3 to i8*
  %5 = getelementptr inbounds i8, i8* %4, i64 0
  %load_target = load i8, i8* %5
  %R7 = zext i8 %load_target to i32
  %R8 = icmp ne i32 %R7, 2
  %R81 = zext i1 %R8 to i32
  %cond = icmp ne i32 %R81, 0
  br i1 %cond, label %L2, label %L4

L2:                                               ; preds = %L1
  %R11 = zext i16 %1 to i32
  %R12 = add i32 %R11, 2
  %R13 = sext i32 %R12 to i64
  %R14 = mul i64 %R13, 4
  %6 = getelementptr inbounds i8, i8* getelementptr inbounds ([10 x %union.memory_word], [10 x %union.memory_word]* @mem, i32 0, i32 0, i32 0, i32 0), i64 %R14
  %7 = bitcast i8* %6 to %union.memory_word*
  %8 = bitcast %union.memory_word* %7 to i32*
  %9 = bitcast i32* %8 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = bitcast i8* %10 to i32*
  %load_target2 = load i32, i32* %11
  %load_target3 = load i32, i32* @fewest_demerits
  %R19 = icmp ult i32 %load_target2, %load_target3
  %R194 = zext i1 %R19 to i32
  %cond5 = icmp ne i32 %R194, 0
  br i1 %cond5, label %L3, label %L4

L3:                                               ; preds = %L2
  store i16 %1, i16* @best_bet
  br label %L4

L4:                                               ; preds = %L3, %L2, %L1
  %12 = bitcast %union.memory_word* %3 to i16*
  %13 = bitcast i16* %12 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 2
  %15 = bitcast i8* %14 to i16*
  %load_target6 = load i16, i16* %15
  store i16 %load_target6, i16* %0
  %R28 = zext i16 %load_target6 to i32
  %R29 = icmp ne i32 %R28, 65494
  %R297 = zext i1 %R29 to i32
  %cond8 = icmp ne i32 %R297, 0
  br i1 %cond8, label %L1, label %L5

L5:                                               ; preds = %L4
  %load_target9 = load i16, i16* @best_bet
  %R32 = zext i16 %load_target9 to i32
  %R33 = add i32 %R32, 1
  %R34 = sext i32 %R33 to i64
  %R35 = mul i64 %R34, 4
  %16 = getelementptr inbounds i8, i8* getelementptr inbounds ([10 x %union.memory_word], [10 x %union.memory_word]* @mem, i32 0, i32 0, i32 0, i32 0), i64 %R35
  %17 = bitcast i8* %16 to %union.memory_word*
  %18 = bitcast %union.memory_word* %17 to i16*
  %19 = bitcast i16* %18 to i8*
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = bitcast i8* %20 to i16*
  %load_target10 = load i16, i16* %21
  store i16 %load_target10, i16* @best_line
  ret void
}

define i32 @main() {
L6:
  store i8 0, i8* getelementptr inbounds ([10 x %union.memory_word], [10 x %union.memory_word]* @mem, i32 0, i32 0, i32 0, i32 0)
  store i16 -42, i16* bitcast (i8* getelementptr inbounds ([10 x %union.memory_word], [10 x %union.memory_word]* @mem, i32 0, i32 0, i32 0, i64 2) to i16*)
  store i16 456, i16* bitcast (i8* getelementptr inbounds (i8, i8* getelementptr inbounds ([10 x %union.memory_word], [10 x %union.memory_word]* @mem, i32 0, i32 0, i32 0, i32 0), i64 4) to i16*)
  store i32 30, i32* bitcast (i8* getelementptr inbounds (i8, i8* getelementptr inbounds ([10 x %union.memory_word], [10 x %union.memory_word]* @mem, i32 0, i32 0, i32 0, i32 0), i64 8) to i32*)
  call void @foo(i16 0)
  %load_target = load i16, i16* @best_line
  %R39 = zext i16 %load_target to i32
  %R40 = icmp eq i32 %R39, 456
  %R401 = zext i1 %R40 to i32
  %R47 = icmp ne i32 %R39, 456
  %R472 = zext i1 %R47 to i32
  %cond = icmp ne i32 %R401, 0
  br i1 %cond, label %L7, label %L8

L7:                                               ; preds = %L6
  %R42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  br label %L9

L8:                                               ; preds = %L6
  %R46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0), i32 %R39)
  br label %L9

L9:                                               ; preds = %L8, %L7
  ret i32 %R472
}

declare i32 @printf(i8*, ...)
