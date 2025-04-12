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
       ./build-nanobsd.sh
3. Copy image to the Soekris device.

       dd if=/usr/obj/nanobsd.net5501/_.disk.image | ssh root@net5501 "sh /root/update"

4. Reboot Soekris device.

## Updating Project
Reminder to self on how to skim over changes outside of release notes.
* Check src.conf(5) man page.
* Check source code.

      git clone https://github.com/freebsd/freebsd-src
      CURRENT=13.3.0
      NEXT=13.4.0
      git diff release/${CURRENT}..release/${NEXT} share/man/man5/src.conf.5
      git diff release/${CURRENT}..release/${NEXT} tools/tools/nanobsd
      git diff release/${CURRENT}..release/${NEXT} sys/i386/conf/GENERIC
      grep '^.It Va WITH' /usr/src/share/man/man5/src.conf.5 | sed 's/^\.It Va //' | sort | uniq

## Open Items
* watchdog
* gpio
