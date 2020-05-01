LDFLAG= -melf_i386 -static  -L ./  -T ./arch/$(ARCH)/linker.ld
SC=x86_64-elf-g++
FLAG= $(INCDIR) -g -O2 -w -trigraphs -fno-builtin  -fno-exceptions -fno-stack-protector -O0 -m32  -fno-rtti -nostdlib -nodefaultlibs -nostdinc -std=gnu++11
ASM=nasm
ASMFLAG=-f elf
LD=x86_64-elf-ld
NM=nm
OBJDUMP=objdump
