OCTAVE_VERSION = 6.4.0
OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.gz
OCTAVE_SITE = https://ftpmirror.gnu.org/octave
$(info $(OCTAVE_SITE)/$(OCTAVE_SOURCE))
$(info "evaluating autotools-package")
$(eval $(autotools-package))
