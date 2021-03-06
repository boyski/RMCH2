$(_MODULE_NAME)_OBJS := $(addsuffix $(_OBJEXT),$(addprefix $($(_MODULE_NAME)_OUTPUT)/,$(basename $(SRCS)))) $(DEPS)
$(_MODULE_NAME)_BINARY := $($(_MODULE_NAME)_OUTPUT)/$(BINARY)$(BINARY_EXT)

ifneq ($(_NO_RULES),T)
ifneq ($($(_MODULE_NAME)_DEFINED),T)
all: $($(_MODULE_NAME)_BINARY)

.PHONY: $(_MODULE_NAME)
$(_MODULE_NAME): $($(_MODULE_NAME)_BINARY)

_IGNORE := $(shell mkdir -p $($(_MODULE_NAME)_OUTPUT))

_CLEAN := clean-$(_MODULE_NAME)
.PHONY: clean $(_CLEAN)
clean: $(_CLEAN)
$(_CLEAN):
	$(RM) -r $($(patsubst clean-%,%,$@)_OUTPUT)

$($(_MODULE_NAME)_OUTPUT)/%.o: $(_MODULE_PATH)/%.c
	$(strip $(COMPILE.c) -o $@ $<)
$($(_MODULE_NAME)_OUTPUT)/$(BINARY).a: $($(_MODULE_NAME)_OBJS)
	$(strip $(AR) -cr $@ $^)
$($(_MODULE_NAME)_OUTPUT)/$(BINARY)$(_EXEEXT): $($(_MODULE_NAME)_OBJS)
	$(strip $(LINK.c) $^ -o $@)

$(_MODULE_NAME)_DEFINED := T
endif
endif
