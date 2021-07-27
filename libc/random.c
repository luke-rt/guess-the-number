#include "random.h"

u16 lfsr = 0xACE1u;
u32 bit;

u32 rand() {
    // random number generator using Linear Feedback Shift Register
    bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ) & 1;
    return lfsr =  (lfsr >> 1) | (bit << 15);
}
