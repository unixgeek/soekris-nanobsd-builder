#!/bin/sh -ex

# Install source distribution.
fetch -o - ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/12.2-RELEASE/src.txz | tar -x -J -C / -f -

# System automatically applies updates at first boot, but that is before the source distribution is installed, so
# we need to update that.
env PAGER=cat freebsd-update --not-running-from-cron fetch
freebsd-update install