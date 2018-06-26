cmake_minimum_required(VERSION 2.8)
project(dmr_c)

enable_language(C)
enable_language(CXX)

message(STATUS "OS type is ${CMAKE_SYSTEM_NAME}")
message(STATUS "System processor is ${CMAKE_HOST_SYSTEM_PROCESSOR}")
message(STATUS "Build type is ${CMAKE_BUILD_TYPE}")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")

option(PARSER_ONLY "Controls whether a Parser only version of dmrC is required" OFF)
option(LLVM_JIT "Controls whether LLVM JIT compilation will be enabled, default is OFF" OFF)
option(NANO_JIT "Controls whether NANOJIT compilation will be enabled, default is OFF" OFF)
option(OMR_JIT "Controls whether OMRJIT backend will be enabled, default is OFF" OFF)
set(LIBRARY_TYPE SHARED)

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

    set(LIBRARY_TYPE STATIC)
endif ()


if (UNIX AND NOT APPLE)
    # -fsanitize=bounds -fsanitize=alignment -fsanitize=object-size
    # set(SANITIZER_FLAGS "-fsanitize=address")
    set(CMAKE_C_FLAGS "${SANITIZER_FLAGS} -fno-omit-frame-pointer -std=c99 -O2 -g -Wall -Wno-comment ${CXX_OPTIONS}")
    set(CMAKE_C_FLAGS_DEBUG "${SANITIZER_FLAGS} -fno-omit-frame-pointer -std=c99 -O0 -g3 -Wall -Wno-comment ${CXX_OPTIONS}")
    set(CMAKE_C_FLAGS_RELEASE "-std=c99 -O3 -Wall -Wno-comment ${CXX_OPTIONS}")
    set(CMAKE_C_FLAGS_RELWITHDEBINFO "${SANITIZER_FLAGS} -std=c99 -O1 -g3 -Wall  ${CXX_OPTIONS}")
    set(CMAKE_CXX_FLAGS "${SANITIZER_FLAGS} -fno-omit-frame-pointer -O0 -g3 -Wall -Wno-sign-compare -std=c++11 -fno-exceptions ${CXX_OPTIONS}")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -Wno-sign-compare -std=c++11 -fno-exceptions ${CXX_OPTIONS}")
    set(CMAKE_CXX_FLAGS_DEBUG "${SANITIZER_FLAGS} -fno-omit-frame-pointer -O0 -g3 -Wall -Wno-sign-compare -std=c++11 -fno-exceptions ${CXX_OPTIONS}")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${SANITIZER_FLAGS} -O1 -g3 -Wall -Wno-sign-compare -std=c++11 -fno-exceptions ${CXX_OPTIONS}")
endif ()

if (APPLE)
    set(CMAKE_C_FLAGS "-std=c99 -O1 -g3 -Wall")
    set(CMAKE_C_FLAGS_DEBUG "-std=c99 -O0 -g3 -Wall")
    set(CMAKE_C_FLAGS_RELEASE "-std=c99 -O3 -Wall")
    set(CMAKE_C_FLAGS_RELWITHDEBINFO "-std=c99 -O1 -g3 -Wall")
    set(CMAKE_CXX_FLAGS "-O1 -g3 -Wall -Wno-sign-compare -std=c++11 -fno-exceptions")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3 -Wall -Wno-sign-compare -std=c++11 -fno-exceptions")
    set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g3 -Wall -Wno-sign-compare -std=c++11 -fno-exceptions")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O1 -g3 -Wall -Wno-sign-compare -std=c++11 -fno-exceptions")
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

if (NOT PARSER_ONLY)
    if (LLVM_JIT)
        find_package(LLVM REQUIRED CONFIG)
        message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
        message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
        include_directories(${LLVM_INCLUDE_DIRS})
        add_definitions(${LLVM_DEFINITIONS})
    elseif (NANO_JIT)
        find_package(NanoJIT REQUIRED)
        include_directories(${NANOJITEXTRA_INCLUDE_DIRS})
    elseif (OMR_JIT)
        find_package(OMRJIT REQUIRED)
        include_directories(${NJ_INCLUDE_DIRS})
    else()
        include_directories("${CMAKE_SOURCE_DIR}/null-backend")
    endif()

    if (LLVM_JIT)
        set(DIST_LIB_H
            llvm-backend/dmr_c.h
            )
		add_definitions(-DLLVM_JIT=1)
    elseif (NANO_JIT)
        set(DIST_LIB_H
            nanojit-backend/dmr_c.h
            )
		add_definitions(-DNANO_JIT=1)
    elseif (OMR_JIT)
        set(DIST_LIB_H
            omrjit-backend/dmr_c.h
            )
		add_definitions(-DOMR_JIT=1)
    else()
        set(DIST_LIB_H
            null-backend/dmr_c.h
            )
    endif()
else()
    set(LLVM_JIT OFF)
    set(NANO_JIT OFF)
    set(OMR_JIT OFF)
	include_directories("${CMAKE_SOURCE_DIR}/null-backend")
	set(DIST_LIB_H
		null-backend/dmr_c.h
		)
    add_definitions(-DPARSER_ONLY=1)
endif()

include_directories("${PROJECT_SOURCE_DIR}/src")

set(PARSER_LIB_H 
    src/allocate.h
    src/char.h
    src/expression.h
    src/ident-list.h
    src/lib.h
    src/parse.h
    src/port.h 
    src/ptrlist.h
    src/scope.h
    src/symbol.h
    src/target.h
    src/token.h 
    src/walksymbol.h
    )

set(PARSER_LIB_SRCS 
    src/allocate.c
    src/builtin.c
    src/char.c
    src/expression.c
    src/evaluate.c
    src/expand.c
    src/inline.c
    src/lib.c
    src/parse.c
    src/target.c
    src/tokenize.c
    src/pre-process.c
    src/ptrlist.c
    src/scope.c
    src/show-parse.c
    src/symbol.c
    src/walksymbol.c
    )

if (NOT PARSER_ONLY)
	set(LINEARIZER_LIB_H 
		src/linearize.h
        src/flow.h
		)
	set(LINEARIZER_LIB_SRCS 
		src/cse.c
		src/flow.c
		src/linearize.c
		src/liveness.c
		src/memops.c
		src/simplify.c
		src/unssa.c
		)
endif()

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

    set(LIB_LLVM_SRCS llvm-backend/sparse-llvm.c)
    include_directories("${PROJECT_SOURCE_DIR}/llvm-backend")
elseif (NANO_JIT)
    set(LIB_LLVM_SRCS nanojit-backend/sparse-nanojit.c)
    include_directories("${PROJECT_SOURCE_DIR}/nanojit-backend")
    set(LLVM_LIBS ${NANOJITEXTRA_LIBRARIES})
	if (NOT WIN32)
		set(ADDITIONAL_LIBS m)
	endif()
elseif (OMR_JIT)
    set(LIB_LLVM_SRCS omrjit-backend/sparse-omrjit.c)
    include_directories("${PROJECT_SOURCE_DIR}/omrjit-backend")
    set(LLVM_LIBS ${NJ_LIBRARIES})
	if (NOT WIN32)
		set(ADDITIONAL_LIBS m)
	endif()
endif ()

if (MSVC OR APPLE)
    source_group("Headers" FILES ${PARSER_LIB_H} ${LINEARIZER_LIB_H})
    source_group("Source Files" FILES ${PARSER_LIB_SRCS} ${LINEARIZER_LIB_SRCS})
    if (NOT PARSER_ONLY)
        source_group("Backend Source Files" FILES ${LIB_LLVM_SRCS})
    endif()
endif ()

#Main library
add_library(dmr_c ${LIBRARY_TYPE}
        ${PARSER_LIB_H}
        ${LINEARIZER_LIB_H}
        ${DIST_LIB_H}
        ${PARSER_LIB_SRCS}
        ${LINEARIZER_LIB_SRCS}
        ${LIB_LLVM_SRCS} )
target_link_libraries(dmr_c ${LLVM_LIBS} ${ADDITIONAL_LIBS})

if (NOT PARSER_ONLY)
    add_executable(runtests src/runtests.c)
    target_link_libraries(runtests dmr_c) 

    add_executable(sparse sparse/sparse.c)
    target_link_libraries(sparse dmr_c) 

    add_executable(linearize samples/show-linearize.c)
    target_link_libraries(linearize dmr_c) 

    if (LLVM_JIT)
        add_executable(sparse-llvm llvm-backend/llvmbackend.c)
        target_link_libraries(sparse-llvm dmr_c) 
    elseif (NANO_JIT)
        add_executable(sparse-nanojit nanojit-backend/nanobackend.c)
        target_link_libraries(sparse-nanojit dmr_c)

        add_executable(test-nanojit nanojit-backend/testnanobackend.c)
        target_link_libraries(test-nanojit dmr_c)   
    elseif (OMR_JIT)
        add_executable(sparse-omrjit omrjit-backend/omrbackend.c)
        target_link_libraries(sparse-omrjit dmr_c)

        add_executable(test-omrjit omrjit-backend/testomrbackend.c)
        target_link_libraries(test-omrjit dmr_c)   
    endif()

endif()

add_executable(showparsetree samples/show-parsetree.c)
target_link_libraries(showparsetree dmr_c) 

add_executable(showsymbols samples/show-symbols.c)
target_link_libraries(showsymbols dmr_c) 

install(FILES ${DIST_LIB_H}
        DESTINATION include/dmr_c)
install(TARGETS dmr_c
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib)
