OCTAVE_VERSION = 6.4.0
OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.gz
OCTAVE_SITE = https://ftpmirror.gnu.org/octave
OCTAVE_LICENSE = GPL-3.0+
OCTAVE_LICENSE_FILES = COPYING
OCTAVE_AUTORECONF = YES
OCTAVE_INSTALL_STAGING = YES

OCTAVE_CONF_OPTS = --disable-java 
OCTAVE_DEPENDENCIES = \
		      host-gperf \
		      openblas \
		      pcre

ifeq ($(BR2_PACKAGE_READLINE),y)
	OCTAVE_DEPENDENCIES += readline
else
	OCTAVE_CONF_OPTS += --disable-readline
endif

$(eval $(autotools-package))

$(info "HOST_DIR:" $(HOST_DIR))
HOST_OCTAVE_CONF_OPTS = --prefix=$(HOST_DIR)

$(eval $(host-autotools-package))

