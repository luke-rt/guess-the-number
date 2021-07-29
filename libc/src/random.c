#include "random.h"

u32 state = 777;

int rand(void)
{
    state = state * 1664525 + 1013904223;
    return state >> 24;

}

