#neofetch
neofetch | lolcat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l='exa -lah --color=always --group-directories-first --icons' # tree listing

##Cmatrix thing
alias matrix='cmatrix -s -C magenta'

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#available free memory
alias free="free -mt"

#continue download
alias wget="wget -c"

#readable output
alias df='df -h'

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#Pacman for software managment
alias search='sudo pacman -Qs'
alias remove='sudo pacman -R'
alias install='sudo pacman -S'
alias linstall='sudo pacman -U '
alias update='sudo pacman -Syyu'
alias clrcache='sudo pacman -Scc'
alias updb='paru && sudo pacman -Sy'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'

#Paru as aur helper - updates everything
alias pget='paru -S '
alias prm='paru -Rs '
alias psr='paru -Ss '
alias upall='paru -Syyu --noconfirm'

#Flatpak Update
alias fpup='flatpak update'

#grub update
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'

#get fastest mirrors in your neighborhood
alias rsimp='arcolinux-reflector-simple'
alias reft='sudo systemctl enable reflector.service reflector.timer && sudo systemctl start reflector.service reflector.timer'

#quickly kill stuff
alias kc='killall conky'

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"

#Bash aliases
alias mkfile='touch'
alias thor='sudo thunar'
alias jctl='journalctl -p 3 -xb'
alias ssaver='xscreensaver-demo'
alias reload='cd ~ && source ~/.zshrc'
alias pingme='ping -c64 techxero.com'
alias cls='clear && neofetch | lolcat'
alias traceme='traceroute techxero.com'

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

#GiT  command
alias gc='git clone '
alias pxr='repo && ./gp.sh'
alias gcred='repo && ./gc.sh'
alias pirepo='irepo && ./push.sh'
alias piso='xliso && ./git-push.sh'
alias pcl='clcfg && ./push.sh'

#Copy/Remove files/dirs
alias rmd='rm -r'
alias srm='sudo rm'
alias srmd='sudo rm -r'
alias cpd='cp -R'
alias scp='sudo cp'
alias scpd='sudo cp -R'

#nano
alias bashrc='sudo nano ~/.bashrc'
alias nsddm='sudo nano /etc/sddm.conf'
alias pconf='sudo nano /etc/pacman.conf'
alias mkpkg='sudo nano /etc/makepkg.conf'
alias ngrub='sudo nano /etc/default/grub'
alias smbconf='sudo nano /etc/samba/smb.conf'
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
alias irepo='cd ~/iso-repo'
alias pkgz='cd ~/pkgbuild/apps'
alias repo='cd ~/xerolinux_repo'
alias xliso='cd ~/xerolinux_iso/installation-scripts/'
alias clcfg='cd ~/calamares-config'
alias sapps='cd /usr/share/applications'
alias lapps='cd ~/.local/share/applications'

#shutdown or reboot
alias sr="sudo reboot"
alias ssn="sudo shutdown now"

#Update XeroLinux Repo
alias uprepo='repo && ./update.sh'
alias upirepo='irepo && ./update.sh'

#Calamares Config
alias clbd='clcfg && nano PKGBUILD && makepkg'

#Weather
alias wdxb='wttr Dubai'
alias wgrc='wttr Greece'
alias wbm='wttr Beit-Meri'

#Manjaro To Unstable Branch
alias archify='sudo pacman-mirrors --api --set-branch unstable'
alias arctivate='sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu'

#Ventoy Create/Update (Change to actual disk)
alias vpc='sudo ventoy -i -s /dev/sde'
alias vpd='sudo ventoy -u -s /dev/sde'

#Mount Retro Share
alias retro='sudo mount -t cifs -o username=techxero,password=m7pi56qe,uid=1000,gid=1000 //192.168.2.78/Data /mnt/Retro'

#Update Xonotic
alias xupdate='xudir && ./update-to-release.sh'
alias xudir='cd /mnt/Linux/GOG/Xonotic/misc/tools/rsync-updater/'

clear && neofetch | lolcat

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
