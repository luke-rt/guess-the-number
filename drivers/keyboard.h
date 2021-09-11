#ifndef KEYBOARD_H
#define KEYBOARD_H

#include "../arch/i386/isr.h"
#include "../kernel/kernel.h"
#include "../kernel/util.h"
#include "../sys/ports.h"
#include "screen.h"
#include <function.h>
#include <string.h>

#define BACKSPACE 0x0E
#define ENTER 0x1C
#define SC_MAX 57

void init_keyboard();

#endif
