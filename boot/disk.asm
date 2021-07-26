disk_load:
	pusha

	push dx

	mov ah, 0x02
	mov al, dh
	mov cl, 0x02

	mov ch, 0x00
	mov dh, 0x00

	int 0x13
	jc disk_err

	pop dx
	cmp al, dh
	jne sector_err
	popa
	ret

disk_err:
	mov bx, DISK_ERROR
	call print
	call print_nl
	mov dh, ah
	call print_hex
	jmp disk_loop

sector_err:
	mov bx, SECTOR_ERROR
	call print

disk_loop:
	jmp $

DISK_ERROR: db "Disk reading error", 0
SECTOR_ERROR: db "Invalid number of sectors read", 0
