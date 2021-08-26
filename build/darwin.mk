CC=i386-elf-gcc
LD=ld -arch i386
AS=nasm
EMU=qemu-system-i386


CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
