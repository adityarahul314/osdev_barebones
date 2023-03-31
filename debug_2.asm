[bits 32]
[org 0x7e00]

jmp $

pusha
loop_debug:
	mov ebx, debug
	mov cx, 0
	mov edx, 0xb8000
	mov al, [ebx]
	mov ah, 0x0f
	mov [edx], ax
	cmp cx, 3
	je end_debug
	inc cx
	inc ebx
	add edx, 2
	jmp loop_debug

end_debug:
	popa
	hlt

debug db 'XYZ', 0

times 510-($-$$) db 0
dw 0xaa55