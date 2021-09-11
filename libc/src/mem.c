#include "mem.h"

void memcpy(u8 *source, u8 *dest, int nbytes) {
  int i;
  for (i = 0; i < nbytes; i++) {
    *(dest + i) = *(source + i);
  }
}

void memset(u8 *dest, u8 val, u32 len) {
  u8 *temp = (u8 *)dest;
  for (; len != 0; len--)
    *temp++ = val;
}

u32 freemem = 0x10000;

u32 kmalloc(size_t size, int align, u32 *address) {
  if (align == 1 && (freemem & 0xFFFFF000)) {
    freemem &= 0xFFFFF000;
    freemem += 0x1000;
  }

  if (address)
    *address = freemem;

  u32 ret = freemem;
  freemem += size;

  return ret;
}
