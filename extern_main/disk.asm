[bits 32]
[org 0x9000]
;second sector to test disk load

mov ebx, msg_pmd
mov cx, 0

pm_drx:
	mov al, [ebx]
	mov ah, 0x0f
	mov [edx], ax
	cmp cx, 25
	je pm_drx_done
	inc cx
	inc ebx
	add edx, 2
	jmp pm_drx

pm_drx_done:
	hlt

msg_pmd db 'PM sector read verfied', 0xd, 0xa

times 510-($-$$) db 0
dw 0xffdd