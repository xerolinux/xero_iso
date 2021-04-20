#!/bin/bash
#
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Erik Dubois
# Website 	: 	http://www.erikdubois.be
##################################################################################################################
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

sudo pacman -S base-devel --noconfirm --needed

source="https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay-bin"
folder="alci-yay-bin"
name="PKGBUILD"

mkdir /tmp/$folder
wget $source -O /tmp/$folder/$name
cd /tmp/$folder
makepkg -i
