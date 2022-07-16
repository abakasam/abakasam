# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := test-strict
DEFS_Debug := \
	'-DHTTP_PARSER_STRICT=1' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-Wall \
	-Wextra \
	-O0 \
	-g \
	-ftrapv \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Debug := \
	-I$(srcdir)/deps/http_parser

DEFS_Release := \
	'-DHTTP_PARSER_STRICT=1' \
	'-DNDEBUG'

# Flags passed to all source files.
CFLAGS_Release := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-Wall \
	-Wextra \
	-O3 \
	-O3 \
	-ffunction-sections \
	-fdata-sections \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Release := \
	-I$(srcdir)/deps/http_parser

OBJS := \
	$(obj).target/$(TARGET)/deps/http_parser/test.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(builddir)/libhttp_parser_strict.a $(obj).target/deps/http_parser/libhttp_parser_strict.a

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64

LIBS :=

$(builddir)/test-strict: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/test-strict: LIBS := $(LIBS)
$(builddir)/test-strict: LD_INPUTS := $(OBJS) $(obj).target/deps/http_parser/libhttp_parser_strict.a
$(builddir)/test-strict: TOOLSET := $(TOOLSET)
$(builddir)/test-strict: $(OBJS) $(obj).target/deps/http_parser/libhttp_parser_strict.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/test-strict
# Add target alias
.PHONY: test-strict
test-strict: $(builddir)/test-strict
