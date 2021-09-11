#ifndef TIMER_H
#define TIMER_H

#include "../arch/i386/isr.h"
#include "../kernel/util.h"
#include "ports.h"
#include <function.h>

void init_timer(u32 freq);

#endif
