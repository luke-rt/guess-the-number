CC=/opt/homebrew/bin/gcc-11 -elf_i386
LD=/usr/bin/ld -arch i386
AS=/opt/homebrew/bin/nasm
EMU=/opt/homebrew/bin/qemu-system-i386


CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
