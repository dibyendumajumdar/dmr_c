; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.mytype = type { i32, i32, double }

define internal void @init(%struct.mytype* %ARG1) {
L0:
  %0 = bitcast %struct.mytype* %ARG1 to i32*
  %1 = bitcast i32* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 0
  %3 = bitcast i8* %2 to i32*
  store i32 5, i32* %3
  %4 = bitcast %struct.mytype* %ARG1 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 4
  %7 = bitcast i8* %6 to i32*
  store i32 5, i32* %7
  ret void
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L1:
  %x_00000228F3BD9DA8 = alloca [6 x %struct.mytype]
  %x_00000228F3BD9A28 = alloca [5 x %struct.mytype]
  %R3 = bitcast [5 x %struct.mytype]* %x_00000228F3BD9A28 to %struct.mytype*
  call void @init(%struct.mytype* %R3)
  %0 = bitcast [5 x %struct.mytype]* %x_00000228F3BD9A28 to i32*
  %1 = bitcast i32* %0 to i8*
  %2 = getelementptr inbounds i8, i8* %1, i64 4
  %3 = bitcast i8* %2 to i32*
  %load_target = load i32, i32* %3
  %R10 = bitcast [6 x %struct.mytype]* %x_00000228F3BD9DA8 to %struct.mytype*
  call void @init(%struct.mytype* %R10)
  %4 = bitcast [6 x %struct.mytype]* %x_00000228F3BD9DA8 to i32*
  %5 = bitcast i32* %4 to i8*
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  %7 = bitcast i8* %6 to i32*
  %load_target1 = load i32, i32* %7
  %R15 = add i32 %load_target, %load_target1
  %R19 = icmp ne i32 %R15, 10
  %R192 = zext i1 %R19 to i32
  ret i32 %R192
}
