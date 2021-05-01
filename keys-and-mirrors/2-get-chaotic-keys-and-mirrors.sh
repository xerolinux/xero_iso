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

package="yay"

#----------------------------------------------------------------------------------

if pacman -Qi $package &> /dev/null; then

  echo "Installing with yay"
  yay -S chaotic-keyring --noconfirm --needed
  yay -S chaotic-mirrorlist --noconfirm --needed

else

  if pacman -Qi trizen &> /dev/null; then

    echo "Installing with trizen"
    trizen -S chaotic-keyring --noconfirm --needed
    trizen -S chaotic-mirrorlist --noconfirm --needed

  elif pacman -Qi paru &> /dev/null; then

    echo "Installing with paru"
    paru -S chaotic-keyring --noconfirm --needed
    paru -S chaotic-mirrorlist --noconfirm --needed

  else

    echo "Install an AUR helper"
    echo "You can use our script"

  fi

fi
