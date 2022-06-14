#!/bin/sh -ex

# Install source distribution.
fetch -o - ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/12.3-RELEASE/src.txz | tar -x -J -C / -f -

# System automatically applies updates at first boot, but that is before the source distribution is installed, so
# we need to update that.
env PAGER=cat freebsd-update --not-running-from-cron fetch
if freebsd-update updatesready; then
    freebsd-update install
fi;

portsnap fetch
portsnap extract

# maybe move this
cd /usr/ports/net/aquantia-atlantic-kmod
make package
cp work/pkg/aquantia-atlantic-kmod-*.pkg /vagrant