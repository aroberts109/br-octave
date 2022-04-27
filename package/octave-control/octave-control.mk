OCTAVE_CONTROL_VERSION = control-3.4.0
OCTAVE_CONTROL_SOURCE = $(OCTAVE_CONTROL_VERSION).tar.gz
OCTAVE_CONTROL_SITE = http://hg.code.sf.net/p/octave/control
OCTAVE_CONTROL_SITE_METHOD = hg
OCTAVE_CONTROL_LICENSE = GPL-3.0+
OCTAVE_CONTROL_LICENSE_FILES = COPYING
OCTAVE_CONTROL_INSTALL_STAGING = YES

OCTAVE_CONTROL_DEPENDENCIES = \
		      octave
INCLUDEDIR=$(STAGING_DIR)/usr/include
export INCLUDEDIR

OCTAVE=$(HOST_DIR)/bin/octave

define OCTAVE_CONTROL_PRE_BUILD_HOOOKS
	if [[ -d (@D)/src/sltmp ]]
       	then
		rmdir (@D)/src/sltmp
	fi
endef

define OCTAVE_CONTROL_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define OCTAVE_CONTROL_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)/inst
	mkdir -p $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)/src
	mkdir -p $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)/src/$(ARCH)
	$(INSTALL) -D -m 0755 $(@D)/inst/*.m $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)/inst
	$(INSTALL) -D -m 0755 $(@D)/src/*.oct $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)/src
	$(INSTALL) -D -m 0755 $(@D)/src/*.cc $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)/src
	$(INSTALL) -D -m 0755 $(@D)/COPYING $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)
	$(INSTALL) -D -m 0755 $(@D)/DESCRIPTION $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)
	$(INSTALL) -D -m 0755 $(@D)/COPYING $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)
	$(INSTALL) -D -m 0755 $(@D)/INDEX $(STAGING_DIR)/usr/share/octave/$(OCTAVE_CONTROL_VERSION)
endef

define OCTAVE_CONTROL_INSTALL_TARGET_CMDS
	tar -cvzf $(TARGET_DIR)/usr/share/octave/$(OCTAVE_CONTROL_SOURCE) -C $(STAGING_DIR)/usr/share/octave $(OCTAVE_CONTROL_VERSION)
endef

$(eval $(generic-package))
