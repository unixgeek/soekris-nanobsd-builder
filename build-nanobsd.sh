#!/bin/sh -ex

# The share that gets setup automatically does not work consistently, so we use sync folders instead.

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
