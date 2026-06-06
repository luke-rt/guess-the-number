CC = i686-linux-gnu-gcc -m32
LD = i686-linux-gnu-ld -m elf_i386
AS = nasm
EMU = qemu-system-i386 -display curses

CFLAGS = -g -Wall -Wextra -Wpedantic -Ilibc/include
CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
LDFLAGS = -Ttext 0x1000 --oformat binary

C_SRC = $(wildcard kernel/*.c sys/*.c libc/**/*.c drivers/*.c arch/i386/*.c)
HEADERS = $(wildcard kernel/*.h sys/*.h libc/**/*.h drivers/*.h arch/i386/*.h)
C_OBJ = ${C_SRC:.c=.o arch/i386/interrupt.o}
OBJ = ${wildcard ./**/*.o ./**/**/*.o ./**/**/**/*.o}

all: bin/guess-the-number.iso

bin/guess-the-number.iso: boot/bootsect.bin kernel.bin
	mkdir -p bin
	cat $^ > bin/guess-the-number.iso
	rm -rf $^

kernel.bin: boot/entry.o ${C_OBJ}
	${LD} -o $@ $^ ${LDFLAGS}

qemu: bin/guess-the-number.iso
	${EMU} -drive file=bin/guess-the-number.iso,format=raw,media=disk

fmt:
	clang-format -i -style=file ${C_SRC} ${HEADERS}

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	${AS} $< -f elf -o $@

%.bin: %.asm
	${AS} $< -f bin -o $@

clean:
	rm -rf bin/*
	rm -rf ${OBJ}
