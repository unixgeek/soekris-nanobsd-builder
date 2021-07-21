#!/bin/sh -evx

#sudo su -

fetch -o - ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/12.2-RELEASE/src.txz | tar -x -J -C / -f -

env PAGER=cat freebsd-update --not-running-from-cron fetch
freebsd-update install

newfs /dev/ada1
mkdir /build
mount /dev/ada1 /build

ln -s /vagrant/net5501/NET5501       /usr/src/sys/i386/conf/NET5501
ln -s /vagrant/net5501/NET5501.hints /usr/src/sys/i386/conf/NET5501.hints

/bin/sh /usr/src/tools/tools/nanobsd/nanobsd.sh -c /vagrant/net5501/net5501.cfg

# need to upload instead of relying on mount, unfortunately.
# 1 cpu, 4GB ram, 2:42
# 4 cpu, 8GB, 1:18
# 12 cpu, 8GB, 52:48
# build(7)
# update /etc and /tmp sizes based on ram usage?
#ca_root_nss -> install this package then symlink to /etc/