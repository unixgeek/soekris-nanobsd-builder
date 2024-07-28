#!/bin/sh -ex

# The share that gets setup automatically at /vagrant does not work consistently, so we use sync folders instead.
# The sync folder is the same mechanism, but somehow fails less often. Seems to be an issue with the vboxvfs driver.
#if ! mtree -f /vagrant/net5501.mtree -p /home/vagrant/net5501; then
#  echo "Retrying mount..."
#  sudo umount /home/vagrant/net5501
#  sudo mount -t vboxvfs home_vagrant_net5501 /home/vagrant/net5501
#  mtree -f /vagrant/net5501.mtree -p /home/vagrant/net5501
#fi

# Link kernel config.
sudo ln -s /home/vagrant/net5501/NET5501       /usr/src/sys/i386/conf/NET5501
sudo ln -s /home/vagrant/net5501/NET5501.hints /usr/src/sys/i386/conf/NET5501.hints

# Build NanoBSD image.
sudo /bin/sh /usr/src/tools/tools/nanobsd/nanobsd.sh -c /home/vagrant/net5501/net5501.cfg

# todo: Review build(7)
# todo: Increase ram backed filesystems.
# todo: Install ca_root_nss pkg and then symlink to /etc/.
# todo: busybox?
# todo: rc scripts?
