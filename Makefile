CC=gcc -elf_i386 -m32
LD=ld -m elf_i386
AS=nasm
EMU=qemu-system-i386

C_SRC = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)
C_OBJ = ${C_SRC:.c=.o}

CFLAGS = -g -Wall -Wextra -fno-pie -ffreestanding
LDFLAGS =

bin/img.bin: boot/bootsect.bin kernel.bin
	cat $^ > bin/img.bin

kernel.bin: boot/entry.o ${C_OBJ}
	${LD} -o $@ -Ttext 0x1000 $^ --oformat binary

run: bin/img.bin
	${EMU} -fda bin/img.bin

%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@ -i boot

%.bin: %.asm
	nasm $< -f bin -o $@ -i boot

clean:
	rm -rf *.o *.bin
	rm -rf kernel/*.o boot/*.bin drivers/*.o boot/*.o bin/*.bin
