micro-rootfs - Generate a minimal Linux root file system
========================================================

This project relies on buildroot to generate a minimal BusyBox based file
system. The resulting rootfs, usually smaller than 1MB can then be loaded
as an initramfs or standard rootfs file.

micro-rootfs is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either [version 2 of the
License](LICENSE.md), or (at your option) any later version.

This project has been inspired-by and derived-from the kgdbtest project:
- https://github.com/daniel-thompson/kgdbtest

Building
--------

The root Makefile contains a simple buildroot-config convenience rule allowing
to bootstrap buildroot configuration.

~~~
ARCH=arm make buildroot-config
ARCH=arm64 make buildroot-config
ARCH=x86 make buildroot-config
~~~

Once `buildroot-config` has been run it is possible to run all buildroot
rules directly from the build directory:

~~~
make -C buildroot/arm
~~~

Then you will find generated rootfs in buildroot/arm/images.

Customization
-------------

There is an existing default buildroot config file for each architecture.
You can, however, edit it to add tools/functionalities.

~~~
make -C buildroot/arm menuconfig
~~~

Moreover, the project comes with a default buildroot overlay (buildroot/overlay)
which can be used to customize the root file system (add/overwrite files).
