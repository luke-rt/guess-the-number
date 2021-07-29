#ifndef TIMER_H
#define TIMER_H

#include <function.h>
#include "../arch/i386/isr.h"
#include "ports.h"
#include "../kernel/util.h"

void init_timer(u32 freq);

#endif
