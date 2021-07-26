[bits 16]
switch_to_pm:
	cli ; disable BIOS interrupts
	lgdt [gdt_descriptor] ; gdt descriptor
	mov eax, cr0
	or eax, 0x1 ; set 32 bit mode
	mov cr0, eax
	jmp CODE_SEG:init_pm ; diff seg

[bits 32] ; switch to 32 bit
init_pm:
	mov ax, DATA_SEG
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax

	mov ebp, 0x90000
	mov esp, ebp

	call BEGIN_PM
