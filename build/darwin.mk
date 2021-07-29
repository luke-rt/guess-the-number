CC=gcc -elf_i386 -m32
LD=i386-elf-ld
AS=nasm
EMU=qemu-system-i386


CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
