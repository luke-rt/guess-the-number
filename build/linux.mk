CC=/usr/bin/gcc -elf_i386 -m32
LD=/usr/bin/ld -m elf_i386
AS=/usr/bin/nasm
EMU=/usr/bin/qemu-system-i386


CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
LDFLAGS +=
