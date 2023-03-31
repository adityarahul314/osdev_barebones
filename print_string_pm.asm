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
	ret
