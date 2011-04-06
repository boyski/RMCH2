sp :=
sp +=
_walk = $(if $1,$(wildcard /$(subst $(sp),/,$1)/$2) $(call _walk,$(wordlist 2,$(words $1),x $1),$2))
_find = $(firstword $(call _walk,$(strip $(subst /, ,$1)),$2))
_ROOT := $(patsubst %/Root.mk,%,$(call _find,$(CURDIR),Root.mk))

include $(_ROOT)/Root.mk
include $(_ROOT)/Top.mk

SRCS := lib1.c lib2.c
BINARY := lib
BINARY_EXT := $(_LIBEXT)

include $(_ROOT)/Bottom.mk
