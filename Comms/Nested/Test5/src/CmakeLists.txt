cmake_minimum_required(VERSION 3.20)
enable_language(C CXX ASM)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../../../Other/cmake/version-checker.cmake)

set_lib_info("LibTest3" 1.4.0+commit)

set(LIB_SRC
  ${CMAKE_CURRENT_SOURCE_DIR}/libfile4.c
)
use_lib(../../../Test4/transitive_src 0.5.0-alpha APPROX "${CMAKE_CURRENT_BINARY_DIR}/transitive_build")
add_library(${LIBRARY_NAME} STATIC 
  ${LIB_SRC}
)

target_sources(${LIBRARY_NAME} PUBLIC ${LIB_SRC})
target_include_directories(${LIBRARY_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(${LIBRARY_NAME}
    stm32cubemx
    # Add user defined libraries
    TransitiveLibTest
)