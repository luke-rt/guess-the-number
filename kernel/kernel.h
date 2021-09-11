#ifndef KERNEL_H
#define KERNEL_H

#include "../arch/i386/isr.h"
#include "../drivers/screen.h"
#include <mem.h>
#include <random.h>
#include <string.h>

void user_input(char *input);

#endif
