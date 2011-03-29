#!/bin/bash

ARCH=$(uname -m)

pacman -U http://github.com/downloads/archme/mypkgbuilds/ruby1.8-augeas-0.3.0-1-any.pkg.tar.xz \
	http://github.com/downloads/archme/mypkgbuilds/ruby1.8-1.8.6_p399-1-${ARCH}.pkg.tar.xz \
	http://github.com/downloads/archme/mypkgbuilds/puppet1.8-0.25.4-1-any.pkg.tar.xz \
	http://github.com/downloads/archme/mypkgbuilds/facter1.8-1.5.7-1-any.pkg.tar.xz \
	http://github.com/downloads/archme/mypkgbuilds/augeas-0.7.1-1-${ARCH}.pkg.tar.xz || exit 1

exit 0
