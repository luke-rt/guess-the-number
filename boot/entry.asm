global _start;
[bits 32]

_start:
	[extern kmain]
	call kmain
	jmp $
