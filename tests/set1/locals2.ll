; ModuleID = 'out.bc'
source_filename = "sparse"

%struct.mytype = type { i32, i32, double }

define internal void @init(%struct.mytype* %ARG1) {
L0:
  %0 = ptrtoint %struct.mytype* %ARG1 to i64
  %1 = add i64 %0, 0
  %2 = inttoptr i64 %1 to i32*
  store i32 5, i32* %2
  %3 = ptrtoint %struct.mytype* %ARG1 to i64
  %4 = add i64 %3, 4
  %5 = inttoptr i64 %4 to i32*
  store i32 5, i32* %5
  ret void
}

define i32 @main(i32 %ARG1, i8** %ARG2) {
L1:
  %x_00000223EC930838 = alloca [6 x %struct.mytype]
  %x_00000223EC9304B8 = alloca [5 x %struct.mytype]
  %R3 = bitcast [5 x %struct.mytype]* %x_00000223EC9304B8 to %struct.mytype*
  call void @init(%struct.mytype* %R3)
  %0 = ptrtoint [5 x %struct.mytype]* %x_00000223EC9304B8 to i64
  %1 = add i64 %0, 4
  %2 = inttoptr i64 %1 to i32*
  %load_target = load i32, i32* %2
  %R10 = bitcast [6 x %struct.mytype]* %x_00000223EC930838 to %struct.mytype*
  call void @init(%struct.mytype* %R10)
  %3 = ptrtoint [6 x %struct.mytype]* %x_00000223EC930838 to i64
  %4 = add i64 %3, 0
  %5 = inttoptr i64 %4 to i32*
  %load_target1 = load i32, i32* %5
  %R15 = add i32 %load_target, %load_target1
  %R19 = icmp ne i32 %R15, 10
  %R192 = zext i1 %R19 to i32
  ret i32 %R192
}
