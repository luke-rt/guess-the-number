CC=gcc -elf_i386 -m32
LD=ld -m elf_i386
AS=nasm
EMU=qemu-system-i386

C_SRC = $(wildcard kernel/*.c cpu/*.c libc/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h cpu/*.h libc/*.h drivers/*.h)
C_OBJ = ${C_SRC:.c=.o cpu/interrupt.o}

CFLAGS = -g -Wall -Wextra
CFLAGS += -fno-pie -ffreestanding -fno-stack-protector

bin/guess-the-number.iso: boot/bootsect.bin kernel.bin
	cat $^ > bin/guess-the-number.iso
	rm -rf $^

kernel.bin: boot/entry.o ${C_OBJ}
	${LD} -o $@ -Ttext 0x1000 $^ --oformat binary

run: bin/guess-the-number.iso
	${EMU} -hda bin/guess-the-number.iso

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

clean:
	rm -rf *.o *.bin *.iso
	rm -rf kernel/*.o boot/*.bin boot/*.o bin/*.iso cpu/*.o libc/*.o drivers/*.o
	rm -rf drivers/screen/*.o drivers/ports/*.o
