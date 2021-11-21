# Soekris NanoBSD Builder
This project uses Vagrant to provide a repeatable build process that builds NanoBSD for a Soekris device. This currently builds for a Net5501 device.

## Requirements
- Vagrant
- VirtualBox
- [disksize plugin](https://github.com/sprotheroe/vagrant-disksize)

## Usage
1. Create the box. This will take some time as updates are installed as part of provisioning.

       vagrant up
2. Build the NanoBSD image.

       vagrant ssh
       sh ./build-nanobsd.sh
3. Copy image to the Soekris device.

       cat /usr/obj/nanobsd.net5501/image.partition | ssh root@net5501 "sh /root/update"

4. Reboot Soekris device.