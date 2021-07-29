CC=gcc -elf_i386 -m32
LD=ld -m elf_i386
AS=nasm
EMU=qemu-system-i386

C_SRC = $(wildcard kernel/*.c sys/*.c libc/**/*.c drivers/*.c arch/i386/*.c)
HEADERS = $(wildcard kernel/*.h sys/*.h libc/**/*.h drivers/*.h arch/i386/*.h)
C_OBJ = ${C_SRC:.c=.o arch/i386/interrupt.o}
OBJ = ${wildcard ./**/*.o ./**/**/*.o ./**/**/**/*.o}

CFLAGS = -g -Wall -Wextra
CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
CFLAGS += -Ilibc/include

bin/guess-the-number.iso: boot/bootsect.bin kernel.bin
	cat $^ > bin/guess-the-number.iso
	rm -rf $^

kernel.bin: boot/entry.o ${C_OBJ}
	${LD} -o $@ -Ttext 0x1000 $^ --oformat binary

qemu: bin/guess-the-number.iso
	${EMU} -drive file=bin/guess-the-number.iso,format=raw,media=disk

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

clean:
	rm -rf *.bin *.iso
	rm -rf ${OBJ}
