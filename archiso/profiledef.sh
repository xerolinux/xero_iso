#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="xerolinux"
iso_label="XEROLINUX"
iso_publisher="XeroLinux <https://xldb.techxero.com>"
iso_application="XeroLinux Live/Rescue CD"
iso_version="main"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/etc/sudoers.d"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/usr/local/bin/vcheck"]="0:0:755"
  ["/usr/local/bin/freset"]="0:0:755"
  ["/usr/local/bin/xapper"]="0:0:755"
  ["/usr/local/bin/dmcheck"]="0:0:755"
  ["/usr/local/bin/xerolinux-before"]="0:0:755"
  ["/usr/local/bin/skel"]="0:0:755"
  ["/usr/local/bin/all-cores"]="0:0:755"
  ["/usr/local/bin/keyfix"]="0:0:755"
  ["/usr/local/bin/ram"]="0:0:755"
  ["/usr/local/bin/xerolinux-final"]="0:0:755"
  ["/usr/local/bin/services"]="0:0:755"
  ["/usr/local/bin/welcome"]="0:0:755"
  ["/usr/local/bin/grubfix"]="0:0:755"
  )
