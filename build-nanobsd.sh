#!/bin/sh -ex

# Link kernel config.
sudo ln -s /home/vagrant/net5501/NET5501       /usr/src/sys/i386/conf/NET5501
sudo ln -s /home/vagrant/net5501/NET5501.hints /usr/src/sys/i386/conf/NET5501.hints

# Build NanoBSD image.
sudo /bin/sh /usr/src/tools/tools/nanobsd/nanobsd.sh -c /home/vagrant/net5501/net5501.cfg
