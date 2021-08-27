CC=/usr/local/bin/i386-elf-gcc
LD=/usr/local/bin/i386-elf-gcc
AS=/usr/local/bin/nasm
EMU=/usr/local/bin/qemu-system-i386


CFLAGS += -fno-pie -ffreestanding -fno-stack-protector
LDFLAGS += -install_name 0x1000
