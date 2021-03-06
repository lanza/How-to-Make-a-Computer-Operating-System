ARCH=x86
KERNEL=kernel.elf
SDKDIR=../sdk
INCDIR= -I ./ -I ./modules -I ./core -I ./arch/$(ARCH) -I../sdk/include/


include ./arch/$(ARCH)/config.make

include ./runtime/Makefile
include ./core/Makefile
include ./modules/Makefile
include ./arch/$(ARCH)/Makefile

FLAG :=$(FLAG) -D__$(ARCH)__ -fpermissive -nostdinc -std=gnu++11
PLATFORMS= `find ./arch/ -type d | sed "s/.*\///" | sort`


all: $(KERNEL)

$(KERNEL): $(OBJS)
	$(LD) $(LDFLAG) -o $@ $^ 
	cp $(KERNEL) $(SDKDIR)/bootdisk/
	
help:
	@echo "Makefile for Kernel."
	@echo "Please see COPYING for licensing information."
	@echo "Output should be: "$(KERNEL)
	@echo "Usage: make [ all | clean] " 
	@echo "Currently supported platforms:"
	@echo $(PLATFORMS)
	@echo

tosdk:
	cp $(KERNEL) $(SDKDIR)/disk/

install:
	sudo cp $(KERNEL) /boot/
	
debug:
	$(NM) -n $(KERNEL)


hinfo:
	$(OBJDUMP) -f $(KERNEL)
	
dasm:
	$(OBJDUMP) -d $(KERNEL) > dasm.txt
	
				
run:
	cd $(SDKDIR) &&	sh ./diskimage.sh
	cd $(SDKDIR) &&	sh ./qemu.sh
	
geniso:
	cd $(SDKDIR) &&	sh ./cdrom.sh

%.o: %.cc
	$(SC) $(FLAG) -c $< -o  $@
	
%.o: %.S
	$(SC) $(FLAG) -c $< -o  $@
	
%.o: %.asm
	$(ASM) $(ASMFLAG) $< -o  $@


clean:
	rm -f $(OBJS)  $(KERNEL) dasm.txt
	
	

