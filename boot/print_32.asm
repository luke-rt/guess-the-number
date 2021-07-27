[bits 32] ; using 32-bit protected mode

VIDEO_MEMORY equ 0xb8000
WHITE_OB_BLACK equ 0x0f ; color bytes

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx] ; address of char
    mov ah, WHITE_OB_BLACK

    cmp al, 0 ; check if end of string
    je print_string_pm_done

    mov [edx], ax ; store in vid mem
    add ebx, 1 ; next char
    add edx, 2 ; next video mem position

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret
