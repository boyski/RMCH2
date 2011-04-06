SUBDIRS := library executable

include $(addsuffix /Makefile,$(SUBDIRS))
