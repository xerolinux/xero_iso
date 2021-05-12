#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://www.xerolinux.github.io
##################################################################################################################

source="https://github.com/xerolinux/xero_repo/raw/main/x86_64/xerolinux-keyring-1-4-any.pkg.tar.zst"
name="xerolinux-keyring-1-4-any.pkg.tar.zst"

wget $source -O /tmp/$name
sudo pacman -U /tmp/$name --noconfirm --needed
