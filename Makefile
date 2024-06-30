#### Options ####

# Don't echo build commands unless VERBOSE is set
VERBOSE ?= 0
ifeq ($(VERBOSE),0)
  QUIET := @
endif

SHELL=/bin/bash -o pipefail

.DELETE_ON_ERROR:

#### Tools ####

CC1      := tools/agbcc/bin/agbcc
CC1_OLD  := tools/agbcc/bin/old_agbcc
CPP      := $(DEVKITARM)/bin/arm-none-eabi-cpp
AS       := $(DEVKITARM)/bin/arm-none-eabi-as
LD       := $(DEVKITARM)/bin/arm-none-eabi-ld
OBJCOPY  := $(DEVKITARM)/bin/arm-none-eabi-objcopy
HOSTCC   := cc

BIN2C    := tools/bin2c/bin2c
LVLCKSUM := tools/lvlcksum/lvlcksum
NEDCMAKE := tools/nedclib/nedcmake
NEVPK    := tools/nedclib/nevpk

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -O2 -fhex-asm -fno-common -ffreestanding
CPPFLAGS := -I tools/agbcc/include -iquote . -iquote include -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork

#### Files ####

LEVELS   := $(wildcard levels/*.s)
ROMS     := $(addsuffix -card.bin,$(basename $(notdir $(LEVELS))))
DOTCODES := $(ROMS:.bin=.dotcode.01.bin)
LDSCRIPT := ldscript.txt

#### Main Targets ####

compare: $(ROMS)
	$(QUIET) md5sum -c checksum.md5

dotcodes: $(DOTCODES)

%.dotcode.01.bin: %.vpk $(NEDCMAKE)
	$(NEDCMAKE) -i $< -o $(<:.vpk=.dotcode) -type 2 -region 0 -bin -titlemode 2 -title 'MARIOVSDK'

%.vpk: %.bin $(NEVPK)
	$(NEVPK) -i $< -o $@ -c

clean:
	$(RM) $(ROMS) $(OFILES) levels/*.bin levels/*.inc.c levels/*.o *.dotcode.*.bin *.elf *.map
	$(MAKE) -C tools/bin2c clean
	$(MAKE) -C tools/lvlcksum clean
	$(RM) $(NEDCMAKE) $(NEVPK)

src/code.o: levels/08-the_thwamplet.inc.c

#### Recipes ####

%-card.elf: src/%-loader.o src/entry.o $(LDSCRIPT)
	@echo 'Linking $@'
	$(QUIET) $(LD) -T $(LDSCRIPT) -Map $(@:.elf=.map) $(filter %.o,$^) tools/agbcc/lib/libgcc.a -o $@

%.bin: %.elf
	@echo 'Generating ROM $@'
	$(QUIET) $(OBJCOPY) -O binary $< $@

src/%-loader.o: src/loader.c levels/%.inc.c
	@echo 'Compiling $<'
	@rm -f $@
	$(QUIET) $(CPP) $(CPPFLAGS) -DLEVEL_DATA_INCLUDE=\"$(filter %.inc.c, $^)\" $< | $(CC1) $(CC1FLAGS) -o - | $(AS) $(ASFLAGS) -o $@

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

#### Tool Recipes ####

$(BIN2C):    ; $(MAKE) -C $(@D)
$(LVLCKSUM): ; $(MAKE) -C $(@D)

NEDCMAKE_SRC := \
	tools/nedclib/src/nedcmake.cpp \
	tools/nedclib/src/lib/nedclib2.cpp \
	tools/nedclib/src/lib/nes.cpp \
	tools/nedclib/src/lib/vpk/vpk.cpp \
	$(wildcard tools/nedclib/src/lib/rawbin/*.cpp) \
	$(wildcard tools/nedclib/src/lib/rawbmp/*.cpp)

$(NEDCMAKE): $(NEDCMAKE_SRC)

NEVPK_SRC := \
	tools/nedclib/src/nevpk.cpp \
	tools/nedclib/src/lib/nedclib2.cpp \
	tools/nedclib/src/lib/vpk/vpk.cpp \
	$(wildcard tools/nedclib/src/lib/rawbin/*.cpp)

$(NEVPK): $(NEVPK_SRC)

$(NEDCMAKE) $(NEVPK):
	$(HOSTCC) -I tools/nedclib/src/lib -O2 -std=c++11 -Wno-pointer-arith $^ -o $@

