#################################################################
#                  Bomberman 64 (USA) Makefile                  #
#################################################################

BASEROM = baserom.z64
BASEROM_DECOMPRESSED = baserom.decomp.z64
TARGET = bm64
NON_MATCHING ?= 0
RUN_CC_CHECK ?= 1
WERROR ?= 0

# Fail early if baserom does not exist
ifeq ($(wildcard $(BASEROM)),)
$(error Baserom `$(BASEROM)' not found.)
endif

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
  HOST_OS := linux
else ifeq ($(UNAME_S),Darwin)
  HOST_OS := macos
else
  $(error Unsupported host/building OS <$(UNAME_S)>)
endif

BUILD_DIR := build
ROM := $(TARGET).z64
ELF := $(BUILD_DIR)/$(TARGET).elf
LD_SCRIPT := $(TARGET).ld
LD_MAP := $(BUILD_DIR)/$(TARGET).map
ASM_DIRS := asm asm/data asm/libultra asm/libultra/os asm/libultra/io asm/libultra/gu asm/libultra/libc asm/libultra/al asm/libultra/audio asm/data/libultra asm/data/libultra/gu asm/data/libultra/os asm/overlays
DATA_DIRS := bin assets
# not implemented
SRC_DIRS := $(shell find src -type d)

OVL_DIRS := ovl_1 \
                ovl_2 \
                ovl_3 \
                ovl_4 \
                ovl_5 \
                ovl_6 \
                ovl_7 \
                ovl_8 \
                ovl_9 \
                ovl_10 \
                ovl_11 \
                ovl_12 \
                ovl_13 \
                ovl_14 \
                ovl_15 \
                ovl_16 \
                ovl_17 \
                ovl_18 \
                ovl_19 \
                ovl_20 \
                ovl_21 \
                ovl_22 \
                ovl_23 \
                ovl_24 \
                ovl_25 \
                ovl_26 \
                ovl_27 \
                ovl_28 \
                ovl_29 \
                ovl_30 \
                ovl_31 \
                ovl_32 \
                ovl_33 \
                ovl_34 \
                ovl_35 \
                ovl_36 \
                ovl_37 \
                ovl_38 \
                ovl_39 \
                ovl_40 \
                ovl_41 \
                ovl_42 \
                ovl_43 \
                ovl_44 \
                ovl_45 \
                ovl_46 \
                ovl_47 \
                ovl_48 \
                ovl_49 \
                ovl_50 \
                ovl_51 \
                ovl_52 \
                ovl_53 \
                ovl_54 \
                ovl_55 \
                ovl_56 \
                ovl_57 \
                ovl_58 \
                ovl_59 \
                ovl_60 \
                ovl_61 \
                ovl_62 \
                ovl_63 \
                ovl_64 \
                ovl_65 \
                ovl_66 \
                ovl_67 \
                ovl_68 \
                ovl_69 \
                ovl_70 \
                ovl_71 \
                ovl_72 \
                ovl_73 \
                ovl_74 \
                ovl_75 \
                ovl_76 \
                ovl_77 \
                ovl_78 \
                ovl_79 \
                ovl_80 \
                ovl_81 \
                ovl_82 \
                ovl_83 \
                ovl_84 \
                ovl_85 \
                ovl_86 \
                ovl_87 \
                ovl_88 \
                ovl_89 \
                ovl_90 \
                ovl_91 \
                ovl_92 \
                ovl_93 \
                ovl_94 \
                ovl_95 \
                ovl_96 \
                ovl_97 \
                ovl_98 \
                ovl_99 \
                ovl_100 \
                ovl_101 \
                ovl_102 \
                ovl_103 \
                ovl_104 \
                ovl_105 \
                ovl_106 \
                ovl_107 \
                ovl_108 \
                ovl_109

OVL_DIRS := $(addprefix asm/overlays/,$(OVL_DIRS))
ASM_DIRS += $(OVL_DIRS)

########## Make tools ##########

DUMMY != make -s -C tools >&2 || echo FAIL
ifeq ($(DUMMY),FAIL)
  $(error Failed to build tools)
endif

###################### Other Tools ######################

N64CRC = tools/n64crc
BM64DECOMPRESS = tools/bm64decompress

C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
S_FILES := $(foreach dir,$(SRC_DIRS) $(ASM_DIRS),$(wildcard $(dir)/*.s))
DATA_FILES := $(foreach dir,$(DATA_DIRS),$(wildcard $(dir)/*.bin))
PNG_FILES     := $(foreach dir,$(DATA_DIRS),$(wildcard $(dir)/*.png))

PNG_INC_FILES := $(foreach f,$(PNG_FILES:.png=.inc),$(BUILD_DIR)/$f)

# Object files
O_FILES := $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file:.c=.c.o)) \
           $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file:.s=.s.o)) \
           $(foreach file,$(DATA_FILES),$(BUILD_DIR)/$(file:.bin=.bin.o)) \

DECOMP_C_OBJS := $(filter %.c.o,$(filter-out $(BUILD_DIR)/src/libultra%,$(O_FILES)))
DECOMP_BM64 := $(DECOMP_C_OBJS)
DEP_FILES := $(O_FILES:.o=.d) $(DECOMP_C_OBJS:.o=.asmproc.d)

SPLAT_YAML := splat.yaml
SPLAT = $(PYTHON) tools/n64splat/split.py $(SPLAT_YAML)

##################### Compiler Options #######################
findcmd = $(shell type $(1) >/dev/null 2>/dev/null; echo $$?)

ifeq ($(call findcmd,mips-linux-gnu-ld),0)
  CROSS := mips-linux-gnu-
else ifeq ($(call findcmd,mips64-elf-ld),0)
  CROSS := mips64-elf-
else ifeq ($(call findcmd,mips-elf-ld),0)
  CROSS := mips-elf-
else
  $(error Missing cross compilation toolchain)
endif

AS = $(CROSS)as
LD = $(CROSS)ld
OBJDUMP = $(CROSS)objdump
OBJCOPY = $(CROSS)objcopy
ifeq ($(HOST_OS),macos)
  CPP := clang -E -P -x c
else
  CPP := cpp
endif

#CC         := $(QEMU_IRIX) -L tools/ido7.1_compiler tools/ido7.1_compiler/usr/bin/cc
#CC_OLD     := $(QEMU_IRIX) -L tools/ido5.3_compiler tools/ido5.3_compiler/usr/bin/cc

# game uses IDO 5.3
CC = tools/ido_recomp/$(HOST_OS)/5.3/cc
CC_OLD = tools/ido_recomp/$(HOST_OS)/5.3/cc
ASMPROC = python3 tools/asmproc/build.py
ASMPROC_FLAGS :=

# unverified
MIPS_VERSION := -mips1

# unverified
OPTFLAGS := -O2

OBJDUMP_FLAGS := -d -r -z -Mreg-names=32

# include locations
INC_DIRS := include include/PR include/audio include/ido . src/boot/malloc
IINCS := $(foreach d,$(INC_DIRS),-I$d)
# defines for SGI IDO
CDEFS := -D_LANGUAGE_C

ifneq ($(RUN_CC_CHECK),0)
  CHECK_WARNINGS := -Wall -Wextra
  CHECK_DEFS := -D_MIPS_SZLONG=32 -DNON_MATCHING
  CHECK_FLAGS := -fno-builtin -funsigned-char -fdiagnostics-color -std=gnu89 $(CDEFS) $(CHECK_DEFS) $(IINCS) -nostdinc -Wno-unknown-pragmas
  CC_CHECK := gcc -fsyntax-only

  ifeq ($(HOST_OS),linux)
    CC_CHECK += -m32
  endif

  ifneq ($(WERROR),0)
    CHECK_WARNINGS += -Werror
  endif
else
  CC_CHECK := @:
endif

######################## Flags #############################

ASFLAGS = -EB -mtune=vr4300 -march=vr4300 $(IINCS) -32

# we support Microsoft extensions such as anonymous structs, which the compiler does support but warns for their usage. Surpress the warnings with -woff.
CFLAGS  = -G 0 -non_shared -Xfullwarn -Xcpluscomm $(IINCS) -Wab,-r4300_mul $(CDEFS) -woff 649,838,712,807 $(MIPS_VERSION)

LDFLAGS = -T undefined_syms_auto.txt -T undefined_funcs_auto.txt -T $(BUILD_DIR)/$(LD_SCRIPT) -Map $(BUILD_DIR)/$(TARGET).map --no-check-sections


######################## Targets #############################

$(foreach dir,$(SRC_DIRS) $(ASM_DIRS) $(DATA_DIRS) $(COMPRESSED_DIRS) $(MAP_DIRS) $(BGM_DIRS),$(shell mkdir -p build/$(dir)))

# this uses -O3 for some reason
build/src/10D0.c.o: OPTFLAGS := -O3
build/src/13F0.c.o: OPTFLAGS := -O3

build/src/40000.c.o: OPTFLAGS := -g

# Get a list of files which only have GLOBAL_ASM in them... via this piece of work.
DECOMP_BM64_FILTERED := $(addprefix build/,$(addsuffix .o,$(foreach file,$(patsubst build/src/%,src/%,$(basename $(DECOMP_BM64))),$(if $(shell grep GLOBAL_ASM <${file}),${file}))))

# run ASM-processor on non-libultra source files which have GLOBAL_ASM in them.
$(DECOMP_BM64_FILTERED): CC := $(ASMPROC) $(ASMPROC_FLAGS) $(CC) -- $(AS) $(ASFLAGS) --

######################## Build #############################

default: all

LD_SCRIPT = $(TARGET).ld

all: $(BUILD_DIR) $(BUILD_DIR)/$(ROM) verify tools

tools:
	make -C tools

distclean:
	rm -rf asm bin assets $(BUILD_DIR) undefined_syms_auto.txt undefined_funcs_auto.txt
	make -C tools clean

clean:
	rm -rf $(BUILD_DIR)
	make -C tools clean

submodules:
	git submodule update --init --recursive

# dumb hack because Makefile hates me
decompress:
	make -C tools
	$(BM64DECOMPRESS) $(BASEROM) $(BASEROM_DECOMPRESSED)

split:
	rm -rf $(DATA_DIRS) $(ASM_DIRS) && ./tools/n64splat/split.py $(SPLAT_YAML)

setup: distclean submodules decompress split

#==============================================================================#
# Texture Generation                                                           #
#==============================================================================#
    
$(BUILD_DIR)/%.inc: %.png
	$(PIGMENT64) to-bin --c-array --format $(subst .,,$(suffix $*)) -o $@ $<

# ------------------------------------------------------------------------------

$(BUILD_DIR):
	echo $(C_FILES)
	mkdir $(BUILD_DIR)

$(BUILD_DIR)/$(LD_SCRIPT): $(LD_SCRIPT)
	@mkdir -p $(shell dirname $@)
	$(CPP) -P -DBUILD_DIR=$(BUILD_DIR) -o $@ $<

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) $< $@ -O binary

$(BUILD_DIR)/$(TARGET).elf: $(PNG_INC_FILES) $(O_FILES) $(BUILD_DIR)/$(LD_SCRIPT)
	@$(LD) $(LDFLAGS) -o $@

$(BUILD_DIR)/%.c.o: %.c
	$(CC_CHECK) $(CHECK_FLAGS) $(CHECK_WARNINGS) -MMD -MP -MT $@ -MF $(@:.o=.d) $<
	$(CC) -c $(CFLAGS) $(OPTFLAGS) -o $@ $<

$(BUILD_DIR)/src/libultra/libc/ll.c.o: src/libultra/libc/ll.c
	$(CC) -c $(CFLAGS) $(OPTFLAGS) -o $@ $<
	python3 tools/set_o32abi_bit.py $@
	@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/src/libultra/libc/llcvt.c.o: src/libultra/libc/llcvt.c
	$(CC) -c $(CFLAGS) $(OPTFLAGS) -o $@ $<
	python3 tools/set_o32abi_bit.py $@
	@$(OBJDUMP) $(OBJDUMP_FLAGS) $@ > $(@:.o=.s)

$(BUILD_DIR)/%.s.o: %.s
	iconv --from UTF-8 --to EUC-JP $^ | $(AS) $(ASFLAGS) -o $@

$(BUILD_DIR)/%.bin.o: %.bin
	$(LD) -r -b binary -o $@ $<

# final z64 updates checksum
$(BUILD_DIR)/$(ROM): $(BUILD_DIR)/$(TARGET).bin
	@cp $< $@
	$(N64CRC) $@

verify: $(BUILD_DIR)/$(ROM)
	md5sum -c checksum.md5

## Order-only prerequisites
# These ensure e.g. the PNG_INC_FILES are built before the O_FILES.
# The intermediate phony targets avoid quadratically-many dependencies between the targets and prerequisites.

asset_files: $(PNG_INC_FILES)
$(O_FILES): | asset_files
o_files: $(O_FILES)

.PHONY: asset_files o_files all clean distclean default split setup

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true

-include $(DEP_FILES)
