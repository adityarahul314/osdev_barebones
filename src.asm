[bits 16]
[org 0x7c00]

KERNEL_OFFSET equ 0x7E00

	mov [BOOT_DRIVE], dl
	
	mov bp, 0x7E00
	mov sp, bp
	
	mov bx, msg_16
	mov cx, 13
	call print_string_16
	call load_kernel
	call switch_to_pm
	jmp 0x7E00
	hlt
	
%include "print_string_16.asm"
%include "load_kernel.asm"
%include "disk_load.asm"
%include "gdt.asm"
%include "switch_to_pm.asm"
%include "print_string_pm.asm"

BOOT_DRIVE	db 0
msg_16		db '16 bit mode', 0xd, 0xa
msg_32		db '32 bit hide', 0xd, 0xa
msg_ko		db 'Loading kernel', 0xd, 0xa
msg_da		db 'Accessing disk', 0xd, 0xa
msg_end	db 'End of prog', 0xd, 0xa
msg_debug	db 'Reached this area', 0xd, 0xa

times 510-($-$$) db 0
dw 0xaa55
