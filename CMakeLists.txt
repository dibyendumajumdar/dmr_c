cmake_minimum_required(VERSION 2.8)
project(dmr_c)

enable_language(C)
enable_testing()

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

#Main library
add_library(dmr_c STATIC 
        ${LIB_H}
        ${LIB_SRCS})

add_executable(runtests src/runtests.c)
target_link_libraries(runtests dmr_c) 
