nasm src.asm -o boot.bin
nasm debug_2.asm -o debug_2.bin
gcc -ffreestanding -c kernel.c -o kernel.o
ld -o kernel.bin -Ttext 0x1000 kernel.o --oformat binary
cat boot.bin kernel.bin > os-image.bin
cat boot.bin debug_2.bin > os-debug.bin
#qemu-system-x86_64 os-image.bin
