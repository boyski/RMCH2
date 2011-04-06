sp :=
sp +=
_walk = $(if $1,$(wildcard /$(subst $(sp),/,$1)/$2) $(call _walk,$(wordlist 2,$(words $1),x $1),$2))
_find = $(firstword $(call _walk,$(strip $(subst /, ,$1)),$2))
_ROOT := $(patsubst %/Root.mk,%,$(call _find,$(CURDIR),Root.mk))

include $(_ROOT)/Root.mk

$(call DEPENDS_ON,library)

include $(_ROOT)/Top.mk

SRCS := foo.c bar.c
BINARY := exec
BINARY_EXT := $(_EXEEXT)
DEPS := $(library_BINARY)

include $(_ROOT)/Bottom.mk
