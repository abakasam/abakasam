# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := http_parser_strict
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
	-fno-exceptions

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
	-fno-tree-vrp \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions

INCS_Release := \
	-I$(srcdir)/deps/http_parser

OBJS := \
	$(obj).target/$(TARGET)/deps/http_parser/http_parser.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

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

$(obj).target/deps/http_parser/libhttp_parser_strict.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/deps/http_parser/libhttp_parser_strict.a: LIBS := $(LIBS)
$(obj).target/deps/http_parser/libhttp_parser_strict.a: TOOLSET := $(TOOLSET)
$(obj).target/deps/http_parser/libhttp_parser_strict.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink)

all_deps += $(obj).target/deps/http_parser/libhttp_parser_strict.a
# Add target alias
.PHONY: http_parser_strict
http_parser_strict: $(obj).target/deps/http_parser/libhttp_parser_strict.a

# Add target alias
.PHONY: http_parser_strict
http_parser_strict: $(builddir)/libhttp_parser_strict.a

# Copy this to the static library output path.
$(builddir)/libhttp_parser_strict.a: TOOLSET := $(TOOLSET)
$(builddir)/libhttp_parser_strict.a: $(obj).target/deps/http_parser/libhttp_parser_strict.a FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/libhttp_parser_strict.a
# Short alias for building this static library.
.PHONY: libhttp_parser_strict.a
libhttp_parser_strict.a: $(obj).target/deps/http_parser/libhttp_parser_strict.a $(builddir)/libhttp_parser_strict.a

