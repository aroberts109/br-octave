~~Need to run autoreconf and configure on the slicot libary in src/ to generate config.h - otherwise build errors.~~

autoreconf and configure now handled in octave-control.mk, but configure fails to properly check the OF_OCTAVE_LIST_ALT_SYMS.

Temporary work around is with [0002-default-octave-symbol-alternatives-to-symbol-version-2.patch](https://github.com/ARob109/br-octave/blob/master/package/octave-control/0002-default-octave-symbol-alternatives-to-symbol-version-2.patch)
