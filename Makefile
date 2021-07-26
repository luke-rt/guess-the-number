CC=gcc -elf_i386
AS=nasm

CFLAGS = -g -Wall -Wextra
LDFLAGS =


all: dirs src/boot.bin
	qemu-system-i386 src/boot.bin

dirs:
	mkdir -p bin

%.bin: %.asm
	nasm $< -f bin -o $@
