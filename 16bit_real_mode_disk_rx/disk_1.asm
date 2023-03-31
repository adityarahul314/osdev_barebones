[bits 16]
[org 0x7c00]

mov [boot_drive], dl

mov bp, 0x8000
mov sp, bp

mov ah, 0x0e
mov al, 0x4a
int 0x10

mov ax, 0
mov es, ax
mov ah, 0x02
mov al, 1
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, [boot_drive]
mov bx, 0x9000
int 0x13

mov ah, 0x0e
mov al, 0x49
int 0x10

jmp 0x9000

boot_drive db 0

times 510-($-$$) db 0
dw 0xaa55