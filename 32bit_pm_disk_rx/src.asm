[bits 16]
[org 0x7c00]

;store boot drive index
mov [boot_drive], dl

;set stack 32kb
mov bp, 0x2000
mov sp, bp

;src init debug print
mov ah, 0x0e
mov al, 0x42
int 0x10

;loading sectors into memory
mov ax, 0;CODE_SEG
mov es, ax
mov bx, 0x9000
mov ah, 0x02
mov al, 1
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, [boot_drive]
int 0x13

;disk read complete
mov ah, 0x0e
mov al, 0x43
int 0x10

;load gdt table and jump to 32 bit pm
cli
lgdt[gdtr]
mov eax, cr0
or eax, 0x1
mov cr0, eax
jmp CODE_SEG:start32

;need this instruction for next interupt to happen?
hlt

;jump to loaded sector
;jmp 0x7e00

%include "gdt.asm"
boot_drive db 0
msg_pm db 'Entered 32bit PM', 0xd, 0xa
msg_pm2 db 'TGT'

[bits 32]

start32:
	mov ax, DATA_SEG
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov ebp, 0x2000 ;8kb stack
	mov esp, ebp
	jmp print_setup

print_setup:
	mov ebx, msg_pm
	mov edx, 0xb8000
	mov cx, 0
	call print_msg

print_msg:
	mov al, [ebx]
	mov ah, 0x0f
	mov [edx], ax
	cmp cx, 18
	je print_done
	inc cx
	inc ebx
	add edx, 2
	jmp print_msg

print_done:
	mov ebx, msg_pm2
	mov al, [ebx]
	mov ah, 0x0f
	mov [edx], ax
	add edx, 2
	jmp 0x9000

times 510-($-$$) db 0
dw 0xaa55