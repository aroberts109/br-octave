OCTAVE_CONTROL_VERSION = control-3.4.0
OCTAVE_CONTROL_SOURCE = $(OCTAVE_CONTROL_VERSION).tar.gz
OCTAVE_CONTROL_SITE = http://hg.code.sf.net/p/octave/control
OCTAVE_CONTROL_SITE_METHOD = hg
OCTAVE_CONTROL_LICENSE = GPL-3.0+
OCTAVE_CONTROL_LICENSE_FILES = COPYING

OCTAVE_CONTROL_DEPENDENCIES = \
		      octave
INCLUDEDIR=$(STAGING_DIR)/usr/include
export INCLUDEDIR

OCTAVE=$(HOST_DIR)/bin/octave

define OCTAVE_CONTROL_PRE_BUILD_HOOKS
	$(info "POST EXTRACT HOOKS")
	cd $(@D)/src && autoreconf;
	cd $(@D)/src && ./configure
endef

define OCTAVE_CONTROL_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define OCTAVE_CONTROL_INSTALL_CMDS
	mkdir -p $(@D)/buildir
	$(OCTAVE) --eval "pkg build $(@D)/buildir $(OCTAVE_CONTROL_SOURCE)"
endef

$(eval $(generic-package))
