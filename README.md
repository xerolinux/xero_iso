# XeroLinux ISO Repo

Repo for **XeroLinux** ISO. Feel free to go through files and learn how it's all done. **DO NOT BUILD** with it as is, it will not work, modify it, then build. ;)

![XeroLinux-Calamares](https://i.imgur.com/9sjGFSN.png)

These are the basic needed files and folders to build XeroLinux system.

`sudo pacman -Syy`

## Install necessary packages
`sudo pacman -S archiso mkinitcpio-archiso git squashfs-tools --needed`

Clone:\
`git clone https://github.com/xerolinux/kde_iso.git`

`cd kde_iso/build-scripts/`

## Build
`./build.sh`

#### if you want rebuild
`./rebuild.sh`

## The iso appears at out folder
