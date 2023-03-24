cmake_minimum_required(VERSION 3.16.0)
set(project debug)
set(version 1.0.0)
project(${project} VERSION ${version} LANGUAGES CUDA CXX)
find_package(CUDA REQUIRED)
include_directories(${CUDA_INCLUDE_DIRS})

set(CMAKE_CUDA_FLAGS ${CMAKE_CUDA_FLAGS} "-g -G") 

add_subdirectory(libr)

# this is working
set(Target1 debugable)
add_executable(${Target1} main.cpp libr/main.cu)

set_target_properties(${Target1} PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

# this is not working
set(Target2 not_debugable)
cuda_add_executable(${Target2} main.cpp)

set_target_properties(${Target2} PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
target_link_libraries(${Target2} debug::test_lib)