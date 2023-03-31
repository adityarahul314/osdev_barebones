# osdev_barebones
barebones OS development using intel x86 assembly

This project is my personal attempt at learning assembly and booting a barebones OS written from scratch using intel x86 assembly.

Current progress:
  - Initialise a single CPU core in 16-bit real mode with 1MB memory in segmentation mode
  - Switch to 32-bit protected mode by enabling A20 line and loading Global Descriptor Table
  - Load bare Interrupts Descriptor Table and jump to kernel.c blob
  - Intialise Video Output from kernel.c binary
