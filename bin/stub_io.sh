#!/bin/bash 

_ISO=${1:/tmp/loop.iso}
# 4096000 is 4G
dd if=/dev/zero of=${_ISO} bs=1024 count=4096000

mkfs --type=ext2 ${_ISO}

echo sudo mount -o loop ${_ISO} /mnt
