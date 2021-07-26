[org 0x7c00] ; offset

mov bx, HELLO
call print
call print_nl

mov bx, WORLD
call print
call print_nl

mov dx, 0x01ab
call print_hex


jmp $

%include "print.asm"
%include "print_hex.asm"


HELLO:
	db 'Hello', 0

WORLD:
	db 'World', 0

; padding and hex aa55
times 510-($-$$) db 0
dw 0xaa55
