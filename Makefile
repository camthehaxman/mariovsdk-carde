#### Options ####

# Don't echo build commands unless VERBOSE is set
VERBOSE ?= 0
ifeq ($(VERBOSE),0)
  QUIET := @
endif


#### Tools ####

CC1      := tools/agbcc/bin/agbcc
CC1_OLD  := tools/agbcc/bin/old_agbcc
CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
AS       := $(DEVKITARM)/bin/arm-none-eabi-as
LD       := $(DEVKITARM)/bin/arm-none-eabi-ld
OBJCOPY  := $(DEVKITARM)/bin/arm-none-eabi-objcopy

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -O2 -fhex-asm -fno-common
CPPFLAGS := -I tools/agbcc/include -iquote include -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork -I asminclude


#### Files ####

ROM      := mariovsdk-carde-18.bin
ELF      := $(ROM:.bin=.elf)
MAP      := $(ROM:.bin=.map)
LDSCRIPT := ldscript.txt
CFILES   := $(wildcard src/*.c)
SFILES   := $(wildcard asm/*.s) $(wildcard data/*.s)
OFILES   := $(SFILES:.s=.o) $(CFILES:.c=.o)


#### Main Targets ####

compare: $(ROM)
	$(QUIET) md5sum -c checksum.md5

clean:
	$(RM) $(ROM) $(ELF) $(MAP) $(OFILES) src/*.s


#### Recipes ####

$(ELF): $(OFILES) $(LDSCRIPT)
	@echo 'Linking $@'
	$(QUIET) $(LD) -T $(LDSCRIPT) -Map $(MAP) $(OFILES) tools/agbcc/lib/libgcc.a -o $@

%.bin: %.elf
	@echo 'Generating ROM $@'
	$(QUIET) $(OBJCOPY) -O binary $< $@

%.o: %.c
	@echo 'Compiling $<'
	$(QUIET) $(CPP) $(CPPFLAGS) $< | $(CC1) $(CC1FLAGS) -o $*.s
	$(QUIET) $(AS) $(ASFLAGS) $*.s -o $*.o

%.o: %.s
	@echo 'Assembling $<'
	$(QUIET) $(AS) $(ASFLAGS) $< -o $@
