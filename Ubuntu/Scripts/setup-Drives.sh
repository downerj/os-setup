#!/usr/bin/env bash

# List disks to find the device path (/dev/sdb1, /dev/nvme1n1p1, etc.) of the data drive.
sudo fdisk -l

# Find the UUID that points to the data drive.
ls -o /dev/disk/by-uuid/

# Copy the following to the end of /etc/fstab, replacing $UUID with the UUID found in the previous step,
# and replace $USER with the name of the user (i.e. `echo $USER`).
#/dev/disk/by-uuid/$UUID /media/$USER/Data auto rw,nosuid,nodev,relatime,uid=1000,gid=1000,iocharset=utf8,noauto,x-gvfs-name=Data,x-gvfs-show 0 0
