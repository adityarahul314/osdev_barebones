print_string_16:
	pusha
	mov si, bx
	mov ah, 0x0e
	jmp print_loop_16
	
print_loop_16:
	lodsb
	int 0x10
	dec cx
	cmp cx,0
	je done_print_16
	jmp print_loop_16
	
done_print_16:
	popa
	ret
