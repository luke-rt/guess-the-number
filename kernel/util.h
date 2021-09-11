#ifndef UTIL_H
#define UTIL_H

#include <stddef.h>
#include <stdint.h>

#define low16(address) (u16)((address)&0xFFFF)
#define high16(address) (u16)(((address) >> 16) & 0xFFFF)

typedef unsigned int u32;
typedef int s32;
typedef unsigned short u16;
typedef short s16;
typedef unsigned char u8;
typedef char s8;

#endif
