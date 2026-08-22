cmake_minimum_required(VERSION 3.20)
enable_language(C CXX ASM)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../../Other/cmake/version-checker.cmake)

set_lib_info("LibTest" 1.2.0)

set(LIB_SRC
  ${CMAKE_CURRENT_SOURCE_DIR}/libfile.c
)
use_lib(../transitive_src 0.5.0-alpha APPROX "${CMAKE_CURRENT_BINARY_DIR}/transitive_build")
use_lib(../thirdparty "" ANY "${CMAKE_CURRENT_BINARY_DIR}/thirdparty_build")

add_library(libtest STATIC 
  ${LIB_SRC}
)
target_sources(libtest PUBLIC ${LIB_SRC})
target_include_directories(libtest PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(libtest
    stm32cubemx
    # Add user defined libraries
    thirdparty
)
