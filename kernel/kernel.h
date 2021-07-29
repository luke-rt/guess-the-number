#ifndef KERNEL_H
#define KERNEL_H


#include "../arch/i386/isr.h"
#include "../drivers/screen.h"
#include "../libc/string.h"
#include "../libc/mem.h"
#include "../libc/random.h"

void user_input(char *input);


#endif
