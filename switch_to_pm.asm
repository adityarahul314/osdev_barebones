switch_to_pm:
	cli
	lgdt[gdt_descriptor]
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	jmp CODE_SEG:start32
	
[bits 32]

start32:
	mov ax, DATA_SEG
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov ebp, 0x2000 ;8kb stack
	mov esp, ebp
	mov ebx, msg_32
	jmp init32

init32:
	mov edx, 0xb8000 ;vid mem start
	mov cx, 0
	call print_string_pm
	call 0x3000
	ret
