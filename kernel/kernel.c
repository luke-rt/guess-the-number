#include "kernel.h"


void main() {
    isr_install();
    irq_install();

    kprint("Type stuff\n> ");
}

void user_input(char *input) {
    if (strcmp(input, "END") == 0) {
        kprint("Stopping the CPU. Bye!\n");
        asm volatile("hlt");
    }
    kprint("You typed '");
    kprint(input);
    kprint("'\n> ");
}
