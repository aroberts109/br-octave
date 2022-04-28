OCTAVE_SIGNAL_VERSION = 1.4.2
OCTAVE_SIGNAL_SOURCE = signal-$(OCTAVE_SIGNAL_VERSION).tar.gz
OCTAVE_SIGNAL_SITE = http://hg.code.sf.net/p/octave/signal
OCTAVE_SIGNAL_SITE_METHOD = hg
OCTAVE_SIGNAL_LICENSE = GPL-3.0+
OCTAVE_SIGNAL_LICENSE_FILES = COPYING
OCTAVE_SIGNAL_INSTALL_STAGING = YES

OCTAVE_SIGNAL_DEPENDENCIES = \
		      octave

INCLUDEDIR=$(STAGING_DIR)/usr/include
export INCLUDEDIR

define OCTAVE_SIGNAL_PRE_BUILD_HOOOKS
endef

define OCTAVE_SIGNAL_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define OCTAVE_SIGNAL_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)/inst
	mkdir -p $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)/src
	mkdir -p $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)/src/$(ARCH)
	$(INSTALL) -D -m 0755 $(@D)/inst/*.m $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)/inst
	$(INSTALL) -D -m 0755 $(@D)/src/*.oct $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)/src
	$(INSTALL) -D -m 0755 $(@D)/src/*.cc $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)/src
	$(INSTALL) -D -m 0755 $(@D)/COPYING $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)
	$(INSTALL) -D -m 0755 $(@D)/DESCRIPTION $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)
	$(INSTALL) -D -m 0755 $(@D)/COPYING $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)
	$(INSTALL) -D -m 0755 $(@D)/INDEX $(STAGING_DIR)/usr/share/octave/signal-$(OCTAVE_SIGNAL_VERSION)
endef

define OCTAVE_SIGNAL_INSTALL_TARGET_CMDS
	tar -cvzf $(TARGET_DIR)/usr/share/octave/$(OCTAVE_SIGNAL_SOURCE) -C $(STAGING_DIR)/usr/share/octave signal-$(OCTAVE_SIGNAL_VERSION)
endef

$(eval $(generic-package))
