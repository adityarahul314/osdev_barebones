nasm disk_1.asm -o disk_1.bin
nasm disk_2.asm -o disk_2.bin
cat disk_1.bin disk_2.bin > disk_3.bin
dd if=/dev/zero of=myos.img bs=512 count=2880
dd if=disk_1.bin of=myos.img bs=512 conv=notrunc
dd if=disk_2.bin of=myos.img bs=512 seek=1 conv=notrunc