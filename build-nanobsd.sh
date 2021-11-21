#!/bin/sh -ex

# The share that gets setup automatically does not work consistently.
# Unmount the share and use a symlink so that if the bug get fixed all we need to is remove these two lines and the
# rest of the script should work without any changes.
sudo umount /vagrant
sudo ln -s /home/vagrant/net5501 /vagrant/net5501

# Link kernel config.
sudo ln -s /vagrant/net5501/NET5501       /usr/src/sys/i386/conf/NET5501
sudo ln -s /vagrant/net5501/NET5501.hints /usr/src/sys/i386/conf/NET5501.hints

# Build NanoBSD image.
sudo /bin/sh /usr/src/tools/tools/nanobsd/nanobsd.sh -c /vagrant/net5501/net5501.cfg

# todo: Review build(7)
# todo: Increase ram backed filesystems.
# todo: Install ca_root_nss pkg and then symlink to /etc/.
# todo: busybox?
# todo: rc scripts?
