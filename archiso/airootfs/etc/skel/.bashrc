#
# ~/.bashrc
#

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#Build ArcoISO
alias bc='./30-build-the-iso-the-first-time.sh'
alias bd='./40-build-the-iso-local-again.sh'

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

#Weather
alias wbm='wttr Beit-Meri'
alias wdxb='wttr Dubai'

#list
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias l='ls'          
alias l.="ls -A | egrep '^\.'"      

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#available free memory
alias free="free -mt"

#continue download
alias wget="wget -c"

#Manjaro To Unstable Branch
alias archify='sudo pacman-mirrors --api --set-branch unstable'
alias arctivate='sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu'

#Pacman for software managment
alias search='sudo pacman -Qs'
alias remove='sudo pacman -R'
alias install='sudo pacman -S'
alias linstall='sudo pacman -U '
alias update='sudo pacman -Syyu'
alias clrcache='sudo pacman -Scc'
alias upall='paru && sudo pacman -Syyu'
alias psr="sudo pacman -Ss --color auto"
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias clc='sudo pacman -Scc --color auto'


#Paru as aur helper - updates everything
alias pget='paru -S '
alias prm='paru -Rs '
alias psr='paru -Ss '
alias upall='paru -Syyu --noconfirm'

#Flatpak Update
alias fpup='flatpak update'

#grub update
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'

#Fix Grub OS Listing Permanently
alias grubfix='linstall ~/grub-tools.pkg.tar.zst && sudo rm ~/grub-tools.pkg.tar.zst'

#Ventoy Create/Update (Change to actual disk)
alias vpc='sudo ventoy -i -s /dev/sde'
alias vpd='sudo ventoy -u -s /dev/sde'

#add new fonts
alias fc="sudo fc-cache -fv"

#get fastest mirrors in your neighborhood
alias reflector='arcolinux-reflector-simple'
alias mirrorr="rate-arch-mirrors | sudo tee /etc/pacman.d/mirrorlist"
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias reft='sudo systemctl enable reflector.service reflector.timer && sudo systemctl start reflector.service reflector.timer'

#quickly kill stuff
alias kc='killall conky'
alias kdc='echo 'Hidden=true' >> ~/.config/autostart/org.kde.discover.notifier.desktop'

#Mount Retro Share
alias retro='sudo mount -t cifs -o username=techxero,password=m7pi56qe,uid=1000,gid=1000 //192.168.1.78/Data /mnt/Retro'

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"

#Bash aliases
alias mkfile='touch'
alias thor='sudo thunar'
alias jctl='journalctl -p 3 -xb'
alias ssaver='xscreensaver-demo'
alias ~='cd ~ && source ~/.bashrc'
alias pingme='ping -c64 techxero.com'
alias cls='clear && neofetch | lolcat'
alias traceme='traceroute techxero.com'
alias nxplayer='cd /usr/NX/bin/ && ./nxplayer & cls'
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#hardware info --short
alias hw="hwinfo --short"

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias yt='youtube-dl --recode-video mp4'
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Copy/Remove files/dirs
alias rmd='rm -r'
alias srm='sudo rm'
alias srmd='sudo rm -r'
alias cpd='cp -R'
alias scp='sudo cp'
alias scpd='sudo cp -R'

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -100"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#nano
alias bashrc='sudo nano ~/.bashrc'
alias nsddm='sudo nano /etc/sddm.conf'
alias pconf='sudo nano /etc/pacman.conf'
alias mkpkg='sudo nano /etc/makepkg.conf'
alias ngrub='sudo nano /etc/default/grub'
alias smbconf='sudo nano /etc/samba/smb.conf'
alias baloorc='sudo nano ~/.config/baloofilerc'
alias nhefflogout='sudo nano /etc/oblogout.conf'
alias nmkinitcpio='sudo nano /etc/mkinitcpio.conf'
alias nmirrorlist='sudo nano /etc/pacman.d/mirrorlist'
alias tgram='sudo nano ~/.local/share/applications/userapp-Telegram*'

#cd/ aliases
alias home='cd ~'
alias etc='cd /etc/'
alias music='cd ~/Music'
alias vids='cd ~/Videos'
alias conf='cd ~/.config'
alias desk='cd ~/Desktop'
alias pics='cd ~/Pictures'
alias dldz='cd ~/Downloads'
alias docs='cd ~/Documents'
alias linux='cd /mnt/Linux'
alias sapps='cd /usr/share/applications'
alias lapps='cd ~/.local/share/applications'

#Update Xonotic
alias xupdate='xudir && ./update-to-release.sh'
alias xudir='cd /mnt/Linux/GOG/Xonotic/misc/tools/rsync-updater/'

#verify signature for isos
alias gpgchk='gpg2 --keyserver-options auto-key-retrieve --verify'
alias gpgfx='gpg2 --keyserver-options auto-key-retrieve --verify'

#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-key="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#shutdown or reboot
alias sr="sudo reboot"
alias ssn="sudo shutdown now"

#Load changes to ./bashrc
alias nbash='source ~/.bashrc'

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

clear && neofetch | lolcat
