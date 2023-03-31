load_kernel:
	pusha
	mov bx, msg_ko
	mov cx, 16
	call print_string_16
	
	mov bx, KERNEL_OFFSET
	mov dh, 2
	mov dl, [BOOT_DRIVE]
	call disk_load
	popa
	ret
