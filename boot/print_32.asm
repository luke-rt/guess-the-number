[bits 32] ; 32 bit protected mode

; consts
VIDEO_MEM equ 0xb8000
WHITE equ 0x0f

print_string_pm:
	pusha
	mov edx, VIDEO_MEM

print_string_pm_loop:
	mov al, [ebx]
	mov ah, WHITE

	cmp al, 0 ; check if end of string \0
	je print_string_pm_done

	mov [edx], ax ; store char + attr in video mem
	add ebx, 1 ; next char
	add edx, 2 ; next pos

	jmp print_string_pm_loop

print_string_pm_done:
	popa
	ret
