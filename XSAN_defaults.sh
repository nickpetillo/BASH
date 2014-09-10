#!/bin/bash

#script to mount AFP share / Move default XSAN files into XSAN folder on MAC

#mount AFP share

mkdir /Volumes/mntpoint

mount_afp afp://admin:hardlif3@10.10.10.14/Technology /Volumes/mntpoint

#Move XSAN files to Local Drive

cp /Volumes/mntpoint/Xsan/* /Library/Preferences/Xsan
mv -v /Library/Preferences/Xsan/auth_secret .authsecret

#unmount AFP share

umount -f /Volumes/mntpoint