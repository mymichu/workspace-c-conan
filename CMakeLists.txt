cmake_minimum_required(VERSION 3.22)
project(simple-example C CXX)
set (CMAKE_CXX_STANDARD 11)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

enable_testing()
add_subdirectory(src)
add_subdirectory(test)