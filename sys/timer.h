#ifndef TIMER_H
#define TIMER_H


#include "../arch/i386/isr.h"
#include "ports.h"
#include "../libc/function.h"
#include "../kernel/util.h"

void init_timer(u32 freq);

#endif
