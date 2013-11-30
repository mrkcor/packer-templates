#!/usr/bin/env bash

# Install the guest additions
mkdir -p /media/iso
mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions.iso /media/iso
/media/iso/VBoxLinuxAdditions.run
umount /media/iso
rm -rf /home/vagrant/VBoxGuestAdditions.iso
