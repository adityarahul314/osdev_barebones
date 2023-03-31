[bits 32]
[org 0x1000]

mov ebx, msg_32d
call print_string_pm

print_string_pm:
	mov al, [ebx]
	mov ah, 0x0f
	mov [edx], ax
	cmp cx, 10
	je done32
	inc cx
	inc ebx
	add edx, 2
	jmp print_string_pm
	
done32:
	hlt

msg_32d	db 'Fuck me'

times 510-($-$$) db 0
dw 0xaa55
