[org 0x7c00] ; offset
KERNEL_OFFSET equ 0x1000

	mov [BOOT_DRIVE], dl
	mov bp, 0x9000
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print ; written after BIOS messages
	call print_nl

	call load_kernel
	call switch_to_pm

	jmp $


%include "print.asm"
%include "print_hex.asm"
%include "print_32.asm"
%include "disk.asm"
%include "gdt.asm"
%include "switch_pm.asm"
[bits 16]
load_kernel:
	mov bx, MSG_LOAD_KERNEL
	call print
	call print_nl

	mov bx, KERNEL_OFFSET
	mov dh, 2
	mov dl, [BOOT_DRIVE]
	call disk_load
	ret

[bits 32]
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm ; written at top left corner
	call KERNEL_OFFSET

	jmp $

BOOT_DRIVE db 0
MSG_REAL_MODE db "Loaded 16-bit real mode", 0
MSG_PROT_MODE db "Loaded 32-bit protected mode", 0
MSG_LOAD_KERNEL db "Loaded kernel into memory", 0

; padding and hex aa55
times 510-($-$$) db 0
dw 0xaa55
