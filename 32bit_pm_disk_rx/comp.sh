nasm src.asm -o boot.bin
nasm disk.asm -o disk.bin
cat boot.bin disk.bin > os.bin
dd if=/dev/zero of=myos.img bs=512 count=2880
dd if=boot.bin of=myos.img bs=512 conv=notrunc
dd if=disk.bin of=myos.img bs=512 seek=1 conv=notrunc