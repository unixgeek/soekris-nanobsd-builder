#!/bin/sh -ex

# Install source distribution.
fetch -o - http://ftp-archive.freebsd.org/pub/FreeBSD-Archive/old-releases/amd64/13.3-RELEASE/src.txz | tar -x -J -C / -f -

# System automatically applies updates at first boot, but that is before the source distribution is installed, so
# we need to update that.
env PAGER=cat freebsd-update --not-running-from-cron fetch
if freebsd-update updatesready; then
    freebsd-update install
fi;
