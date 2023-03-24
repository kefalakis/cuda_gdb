#include "main.h"
#include <cstdio>

__global__ void kernel()
{
    const auto thread_id = threadIdx.x + blockDim.x * threadIdx.y;
    printf("just testing");
}

void kernelLaunch()
{
    kernel<<<1, 5>>>();
}