CC=gcc -elf_i386 -m32
LD=ld -m elf_i386
AS=nasm
EMU=qemu-system-i386


CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
