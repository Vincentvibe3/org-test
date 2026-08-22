cmake_minimum_required(VERSION 3.20)
enable_language(C CXX ASM)

set(LIB_SRC
  ${CMAKE_CURRENT_SOURCE_DIR}/libfile5.c
)

add_library(thirdparty STATIC 
  ${LIB_SRC}
)
target_sources(thirdparty PUBLIC ${LIB_SRC})
target_include_directories(thirdparty PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_link_libraries(thirdparty
    stm32cubemx
    # Add user defined libraries
)
