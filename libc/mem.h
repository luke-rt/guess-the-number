#ifndef MEM_H
#define MEM_H

#include "../kernel/util.h"

void memcpy(u8 *source, u8 *dest, int nbytes);
void memset(u8 *dest, u8 val, u32 len);
u32 kmalloc(size_t size, int align, u32* address);

#endif
