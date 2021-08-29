#!/bin/sh -ex

# Install source distribution.
fetch -o - ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/12.2-RELEASE/src.txz | tar -x -J -C / -f -

# System automatically applies updates at first boot, but that is before the source distribution is installed, so
# we need to update that.
env PAGER=cat freebsd-update --not-running-from-cron fetch
freebsd-update install

# The share always fails with: "cannot open /vagrant/net5501/net5501.cfg: Not a directory."
# The Vagrant file will copy the sources to the image and we will symlink to that location so the build scripts and
# configuration files do not have to be changed if we ever figure out why the share fails.
umount /vagrant
ln -s /home/vagrant/net5501 /vagrant/net5501

# Link kernel config.
ln -s /vagrant/net5501/NET5501       /usr/src/sys/i386/conf/NET5501
ln -s /vagrant/net5501/NET5501.hints /usr/src/sys/i386/conf/NET5501.hints

# Build NanoBSD image.
/bin/sh /usr/src/tools/tools/nanobsd/nanobsd.sh -c /vagrant/net5501/net5501.cfg

# todo: Review build(7)
# todo: Increase ram backed filesystems.
# todo: Install ca_root_nss pkg and then symlink to /etc/.
# todo: busybox?
# todo: rc scripts?
