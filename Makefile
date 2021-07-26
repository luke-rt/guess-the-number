CC=gcc -elf_i386
AS=nasm

CFLAGS = -g -Wall -Wextra
LDFLAGS =


all: dirs boot/bootsect.bin
	qemu-system-i386 boot/bootsect.bin

dirs:
	mkdir -p bin

%.bin: %.asm
	nasm $< -f bin -o $@ -i boot
