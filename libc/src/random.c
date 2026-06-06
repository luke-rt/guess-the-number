#include "random.h"

u32 state = 777;

void srand(u32 seed) {
  state = seed;
}

int rand(void) {
  state = state * 1664525 + 1013904223;
  return state >> 24;
}
