CC=/opt/homebrew/bin/i386-elf-gcc
LD=/usr/bin/ld -arch i386
AS=/opt/homebrew/bin/nasm
EMU=/opt/homebrew/bin/qemu-system-i386


CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
