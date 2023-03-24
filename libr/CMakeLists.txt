cuda_add_library(test_lib STATIC main.h main.cu)


set_target_properties(test_lib PROPERTIES CUDA_SEPARABLE_COMPILATION ON)
set_target_properties(test_lib PROPERTIES CUDA_RUNTIME_LIBRARY shared)

add_library(${project}::test_lib ALIAS test_lib)