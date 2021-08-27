CC=/usr/local/bin/i386-elf-gcc
LD=/usr/bin/ld -arch i386
AS=/usr/local/bin/nasm
EMU=/usr/local/bin/qemu-system-i386


CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
LDFLAGS += -install_name
