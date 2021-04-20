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

source="https://github.com/arch-linux-calamares-installer/alci_repo/raw/master/x86_64/arcolinux-keyring-20230919-6-any.pkg.tar.zst"
name="arcolinux-keyring-20230919-6-any.pkg.tar.zst"

wget $source -O /tmp/$name
sudo pacman -U /tmp/$name --noconfirm --needed


source="https://github.com/arch-linux-calamares-installer/alci_repo/raw/master/x86_64/arcolinux-mirrorlist-git-21.01-1-any.pkg.tar.zst"
name="arcolinux-mirrorlist-git-21.01-1-any.pkg.tar.zst"

wget $source -O /tmp/$name
sudo pacman -U /tmp/$name --noconfirm --needed
