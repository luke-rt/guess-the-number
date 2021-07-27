#ifndef TIMER_H
#define TIMER_H


#include "isr.h"
#include "ports.h"
#include "../libc/function.h"
#include "util.h"

void init_timer(u32 freq);

#endif
