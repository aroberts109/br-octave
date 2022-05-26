# README

This repository provides an experimental out-of-tree Buildroot (BR2_EXTERNAL) support for cross-compiling GNU Octave.

Additionally, it provides experimental support for cross-compiling the [Octave Forge Control package](https://octave.sourceforge.io/control/) and the [Octave Forge Signal package](https://octave.sourceforge.io/signal/). These require selecting the *host-octave* Kconfig option - e.g., through **menuconfig**.

The *Forge* packages are not "Octave-installed" to target in the sense of running the **octave pkg install ...** command, but rather are installed to target as tar.gz archives. They must be manually installed on target. Currently the archives are copied to the target rootfs */usr/share/octave directory*.

```bash
cd /usr/share/octave
octave-cli --eval 'pkg install control-3.4.0.tar.gz'
octave-cli --eval 'pkg install signal-1.4.2.tar.gz'
```

Note that the package installation process will throw warnings about generating help documentation as the texinfo command is likely to be missing.

These packages have not been thoroughly tested. Only the pwelch function in the Signal package has been tested on ARM64 target with [test.m](/package/octave-signal/test.m)
