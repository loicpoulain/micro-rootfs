ifeq ("$(ARCH)", "")
UARCH=$(shell uname -m)
ifeq ("$(UARCH)", "aarch64")
  export ARCH=arm64
else
  export ARCH=x86
endif
endif

export RDIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

BUILDROOT = $(RDIR)/buildroot/tree
BUILDROOT_INTERMEDIATES = \
		$(RDIR)/buildroot/$(ARCH)/build \
		$(RDIR)/buildroot/$(ARCH)/staging \
		$(RDIR)/buildroot/$(ARCH)/target
BUILDROOT_OBJECTS = $(BUILDROOT_INTERMEDIATES) \
		$(RDIR)/buildroot/$(ARCH)/host \
		$(RDIR)/buildroot/$(ARCH)/Makefile \
		$(RDIR)/buildroot/$(ARCH)/images

buildroot-config:
	git submodule update --init
	(cd $(RDIR)/buildroot/$(ARCH); $(MAKE) -C $(BUILDROOT) O=$$PWD olddefconfig)

buildroot-clean:
	$(RM) -r $(BUILDROOT_OBJECTS)

.PHONY : buildroot-config buildroot-clean
