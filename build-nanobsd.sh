#!/bin/sh -ex

#fetch -o - ftp://ftp.freebsd.org/pub/FreeBSD/releases/amd64/12.2-RELEASE/src.txz | tar -x -J -C / -f -

#env PAGER=cat freebsd-update --not-running-from-cron fetch
#freebsd-update install

newfs /dev/ada1
mkdir /build
echo "/dev/ada1 /build ufs rw 0 0" >> /etc/fstab
mount /dev/ada1 /build

# figure out what happens at first boot.
# growfs_enable=YES

#if [ ! -e /vagrant/net5501/net5501.cfg ]; then
#    # Sometimes the share doesn't have all the subdirectories.
#    umount /vagrant
#    mount_vboxvfs vagrant /vagrant
#fi

# Sometimes the share doesn't have all the subdirectories.
#while [ ! -e /vagrant/net5501/net5501.cfg ]; do
#    file /vagrant/net5501/net5501.cfg
#    sleep 4
#    umount /vagrant
#    mount_vboxvfs vagrant /vagrant
#    sleep 10
#done

#ln -s /vagrant/net5501/NET5501       /usr/src/sys/i386/conf/NET5501
#ln -s /vagrant/net5501/NET5501.hints /usr/src/sys/i386/conf/NET5501.hints

#/bin/sh /usr/src/tools/tools/nanobsd/nanobsd.sh -c /vagrant/net5501/net5501.cfg

# 1 cpu, 4GB ram, 2:42
# 4 cpu, 8GB, 1:18
# 12 cpu, 8GB, 52:48
# build(7)
# update /etc and /tmp sizes based on ram usage?
# ca_root_nss -> install this package then symlink to /etc/
# busybox?
# rc scripts?
