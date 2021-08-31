#include "kernel.h"

int num;

void new_game() {
    clear_screen();

    num = rand() % 100;
    kprint("Guess a number between 1 and 100\n> ");
}

void user_input(char *input) {
    if (strcmp(input, "END") == 0) {
        kprint("Stopping the CPU\n");
        asm volatile("hlt");
    }
    else if(strtonum(input) == num) {
        kprint("You guessed right!\n");
        new_game();
    }
    else if(strtonum(input) > num) {
        kprint("Too high! Try again\n> ");
    }
    else if(strtonum(input) < num) {
        kprint("Too low! Try again\n> ");
    }
    else {
        kprint("Invalid input\n> ");
    }

}

void kmain() {
    isr_install();
    irq_install();


    new_game();
}
