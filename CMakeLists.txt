cmake_minimum_required(VERSION 2.8)
project(dmr_c)

enable_language(C)
enable_language(CXX)
enable_testing()

option(LLVM_JIT "Controls whether LLVM JIT compilation will be enabled, default is OFF" OFF)

if (LLVM_JIT)
    find_package(LLVM REQUIRED CONFIG)

    message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
    message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

    include_directories(${LLVM_INCLUDE_DIRS})
    add_definitions(${LLVM_DEFINITIONS})
endif()


if (MSVC)
    message( STATUS "MSVC selected" )
    set(CMAKE_C_FLAGS_DEBUG "/Od /D_DEBUG /MDd /Zi /RTC1 /EHsc")
    set(CMAKE_C_FLAGS_RELEASE "/DNDEBUG /O2 /MD /EHsc")
    set(CMAKE_C_FLAGS_RELWITHDEBINFO "/DNDEBUG /O2 /MDd /Zi /EHsc")
    set(CMAKE_C_FLAGS_MINSIZEREL "/DNDEBUG /O2 /MD /EHsc")

    set(CMAKE_CXX_FLAGS "/EHsc")
    set(CMAKE_CXX_FLAGS_DEBUG "/Od /D_DEBUG /MDd /Zi /RTC1 /EHsc")
    set(CMAKE_CXX_FLAGS_RELEASE "/DNDEBUG /O2 /MD /EHsc")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/DNDEBUG /O2 /MDd /Zi /EHsc")
    set(CMAKE_CXX_FLAGS_MINSIZEREL "/DNDEBUG /O2 /MD /EHsc")

    # Disable signed/unsigned int conversion warnings.
    add_definitions("/wd4018")
    # Disable warning about using struct/class for the same symobl.
    # add_definitions("/wd4099")
    # Disable performance warning about int-to-bool conversion.
    add_definitions("/wd4800")
    # Disable signed/unsigned int conversion warnings.
    add_definitions("/wd4018")
    # Disable warning about the insecurity of using "std::copy".
    add_definitions("/wd4996")
    add_definitions("/wd4291")
    add_definitions("/wd4624")
endif ()


if (UNIX AND NOT APPLE)
    # -fsanitize=bounds -fsanitize=alignment -fsanitize=object-size
    set(SANITIZER_FLAGS "-fsanitize=address")
    set(CMAKE_C_FLAGS "${SANITIZER_FLAGS} -fno-omit-frame-pointer -std=c99 -O0 -g3 -Wall -Wextra ${CXX_OPTIONS}")
    set(CMAKE_C_FLAGS_DEBUG "${SANITIZER_FLAGS} -fno-omit-frame-pointer -std=c99 -O0 -g3 -Wall -Wextra ${CXX_OPTIONS}")
    set(CMAKE_C_FLAGS_RELEASE "-std=c99 -O3 -Wall -Wextra ${CXX_OPTIONS}")
    set(CMAKE_C_FLAGS_RELWITHDEBINFO "${SANITIZER_FLAGS} -std=c99 -O1 -g3 -Wall -Wextra ${CXX_OPTIONS}")
    set(CMAKE_CXX_FLAGS "${SANITIZER_FLAGS} -fno-omit-frame-pointer -O0 -g3 -Wall -Wno-sign-compare -std=c++14 -fno-exceptions ${CXX_OPTIONS}")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -Wno-sign-compare -std=c++14 -fno-exceptions ${CXX_OPTIONS}")
    set(CMAKE_CXX_FLAGS_DEBUG "${SANITIZER_FLAGS} -fno-omit-frame-pointer -O0 -g3 -Wall -Wno-sign-compare -std=c++14 -fno-exceptions ${CXX_OPTIONS}")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${SANITIZER_FLAGS} -O1 -g3 -Wall -Wno-sign-compare -std=c++14 -fno-exceptions ${CXX_OPTIONS}")
    # In case we are using gcc 5.1 set ABI version
    # add_definitions("-D_GLIBCXX_USE_CXX11_ABI=0")
endif ()

if (APPLE)
    set(CMAKE_C_FLAGS "-std=c99 -O1 -g3 -Wall -Wextra")
    set(CMAKE_C_FLAGS_DEBUG "-std=c99 -O0 -g3 -Wall -Wextra")
    set(CMAKE_C_FLAGS_RELEASE "-std=c99 -O3 -Wall -Wextra")
    set(CMAKE_C_FLAGS_RELWITHDEBINFO "-std=c99 -O1 -g3 -Wall -Wextra")
    set(CMAKE_CXX_FLAGS "-O1 -g3 -Wall -Wno-sign-compare -std=c++14 -fno-exceptions")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -Wno-sign-compare -std=c++14 -fno-exceptions")
    set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g3 -Wall -Wno-sign-compare -std=c++14 -fno-exceptions")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O1 -g3 -Wall -Wno-sign-compare -std=c++14 -fno-exceptions")
endif ()

if (CMAKE_COMPILER_IS_GNUCC)
    execute_process(COMMAND ${CMAKE_C_COMPILER} --print-file-name=
       OUTPUT_VARIABLE GCC_BASE OUTPUT_STRIP_TRAILING_WHITESPACE)
    execute_process(COMMAND ${CMAKE_C_COMPILER} -print-multiarch
       OUTPUT_VARIABLE MULTIARCH_TRIPLET ERROR_QUIET OUTPUT_STRIP_TRAILING_WHITESPACE)

    add_definitions(-DGCC_BASE="${GCC_BASE}")
    add_definitions(-DMULTIARCH_TRIPLET="${MULTIARCH_TRIPLET}")
endif()

message( STATUS "GCC_BASE_DIR      : " ${GCC_BASE})
message( STATUS "MULTIARCH_TRIPLET : " ${MULTIARCH_TRIPLET} )

include_directories("${PROJECT_SOURCE_DIR}/src")

set(LIB_H 
	src/allocate.h
	src/char.h
	src/dmr_c.h
	src/expression.h
	src/flow.h
	src/ident-list.h
	src/linearize.h
	src/parse.h
	src/port.h 
	src/ptrlist.h
	src/scope.h
	src/symbol.h
	src/target.h
	src/token.h 
	)

set(LIB_SRCS 
	src/allocate.c
	src/char.c
	src/cse.c
	src/dmr_c.c
	src/expression.c
	src/evaluate.c
	src/expand.c
	src/flow.c
	src/inline.c
	src/linearize.c
	src/liveness.c
	src/memops.c
	src/parse.c
	src/target.c
	src/tokenize.c
	src/pre-process.c
	src/ptrlist.c
	src/scope.c
	src/show-parse.c
	src/simplify.c
	src/symbol.c
	src/unssa.c
	)

if (MSVC OR APPLE)
    source_group("Headers" FILES ${LIB_H})
    source_group("Source Files" FILES ${LIB_SRCS})
endif ()

# Enable minimal required LLVM components so that the
# the size of the resulting binary is manageable
if (LLVM_JIT)
    if (${LLVM_PACKAGE_VERSION} VERSION_LESS "3.8")
        set(LLVM_EXTRA_LIBS ipa)
    endif()
    message(STATUS "SYSTEM_PROCESSOR ${CMAKE_SYSTEM_PROCESSOR}")
    if (CMAKE_SYSTEM_PROCESSOR MATCHES "(x86)|(X86)|(amd64)|(AMD64)")
    set(LLVM_LIBS_PROCESSOR
        X86CodeGen
        X86AsmParser
        X86Disassembler
        X86AsmPrinter
        X86Desc
        X86Info
        X86Utils
        )
    elseif (CMAKE_SYSTEM_PROCESSOR MATCHES "arm")
    set(LLVM_LIBS_PROCESSOR
        ARMCodeGen
        ARMAsmParser
        ARMDisassembler
        ARMAsmPrinter
        ARMDesc
        ARMInfo
        )
    endif()
    llvm_map_components_to_libnames(LLVM_LIBS
            Analysis
            Core
            CodeGen
            AsmParser
            AsmPrinter
            BitReader
            ExecutionEngine
            InstCombine
            ${LLVM_EXTRA_LIBS}
            ipo
            MC
            MCJIT
            MCParser
            Object
            RuntimeDyld
            ScalarOpts
            Support
            Target
            TransformUtils
        ${LLVM_LIBS_PROCESSOR}
            )
    message(STATUS "LLVM_LIBS ${LLVM_LIBS}")
endif ()

set (ASMJIT_EMBED TRUE)
add_definitions(-DASMJIT_STATIC)
set (ASMJIT_DIR asmjit)
include ("${ASMJIT_DIR}/CMakeLists.txt")

include_directories("${ASMJIT_DIR}/src")

#Main library
add_library(dmr_c STATIC 
        ${LIB_H}
        ${LIB_SRCS} )

add_executable(runtests src/runtests.c)
target_link_libraries(runtests dmr_c) 

add_executable(sparse driver/sparse.c)
target_link_libraries(sparse dmr_c) 

add_executable(linearize samples/show-linearize.c)
target_link_libraries(linearize dmr_c) 

add_executable(showparse samples/show-parse.c)
target_link_libraries(showparse dmr_c) 

add_executable(showsymbols samples/show-symbols.c)
target_link_libraries(showsymbols dmr_c) 

add_executable(jittest asmjit-backend/main.cpp ${ASMJIT_SRC})
target_link_libraries(jittest dmr_c) 

if (LLVM_JIT)
    add_executable(sparse-llvm llvm/sparse-llvm.c)
    target_link_libraries(sparse-llvm dmr_c ${LLVM_LIBS}) 
endif()