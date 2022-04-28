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

ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
	OCTAVE_DEPENDENCIES += fftw-single
endif

ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
	OCTAVE_DEPENDENCIES += fftw-double
endif

ifeq ($(BR2_PACKAGE_FFTW),n)
	OCTAVE_CONF_OPTS += --without-fftw3 --without-fftw3f
endif

ifeq ($(BR2_PACKAGE_READLINE),y)
	OCTAVE_DEPENDENCIES += readline
else
	OCTAVE_CONF_OPTS += --disable-readline
endif

$(eval $(autotools-package))

HOST_OCTAVE_CONF_OPTS = --prefix=$(HOST_DIR)

$(eval $(host-autotools-package))

