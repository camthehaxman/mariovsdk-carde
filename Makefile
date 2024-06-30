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

BIN2C    := tools/bin2c/bin2c
LVLCKSUM := tools/lvlcksum/lvlcksum

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -O2 -fhex-asm -fno-common -ffreestanding
CPPFLAGS := -I tools/agbcc/include -iquote . -iquote include -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork


#### Files ####

ROM      := mariovsdk-carde-18.bin
ELF      := $(ROM:.bin=.elf)
MAP      := $(ROM:.bin=.map)
LDSCRIPT := ldscript.txt
CFILES   := $(wildcard src/*.c)
SFILES   := $(wildcard src/*.s)
OFILES   := $(SFILES:.s=.o) $(CFILES:.c=.o)
LEVELS   := $(wildcard levels/%.s)

#### Main Targets ####

compare: $(ROM)
	$(QUIET) md5sum -c checksum.md5

clean:
	$(RM) $(ROM) $(ELF) $(MAP) $(OFILES) levels/*.bin levels/*.inc.c levels/*.o
	$(MAKE) -C tools/bin2c clean
	$(MAKE) -C tools/lvlcksum clean

src/code.o: levels/08-the_thwamplet.inc.c

#### Recipes ####

$(ELF): $(OFILES) $(LDSCRIPT)
	@echo 'Linking $@'
	$(QUIET) $(LD) -T $(LDSCRIPT) -Map $(MAP) $(OFILES) tools/agbcc/lib/libgcc.a -o $@

%.bin: %.elf
	@echo 'Generating ROM $@'
	$(QUIET) $(OBJCOPY) -O binary $< $@

%.o: %.c
	@echo 'Compiling $<'
	$(QUIET) $(CPP) $(CPPFLAGS) $< | $(CC1) $(CC1FLAGS) -o - | $(AS) $(ASFLAGS) -o $*.o

%.o: %.s
	@echo 'Assembling $<'
	$(QUIET) $(AS) $(ASFLAGS) $< -o $@

# compile level into binary file
levels/%.bin: levels/%.s levels/%.lvl.lz $(LVLCKSUM)
	@echo 'Assembling $<'
	$(QUIET) $(AS) $(ASFLAGS) $< -o $(<:.s=.o) && $(OBJCOPY) -O binary $(<:.s=.o) $@
	$(LVLCKSUM) $@

# binary file to C include
%.inc.c: %.bin $(BIN2C)
	$(BIN2C) $< gLevelData -noconst > $@

$(BIN2C):    ; $(MAKE) -C $(@D)
$(LVLCKSUM): ; $(MAKE) -C $(@D)
