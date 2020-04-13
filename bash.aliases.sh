#!/bin/bash
#                                                          -*- shell-script -*-
#
####
## Boseji's Custom Aliases
##
## SPDX-License-Identifier: GPL-2.0-only
##
## Copyright (C) 2020 Abhijit Bose <boseji@users.noreply.github.com>
##
####
# Sort by Size
alias lt='ls --human-readable --size -1 -S --classify'
alias ll='ls -alF'
alias la='ls -aolh'
alias l='ls -CF'
# List only .Files
alias l.='ls -d .* --color=auto'
# Mounted File System List
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
# Find a last typed command
alias gh='history|grep'
# List in order files were modified
alias left='ls -t -1'
# Count Number of Files
alias count='find . -type f | wc -l'
# Python Virtual Environment Create
alias ve='python3 -m venv ./venv'
# Python Virtual Environment Activate 
alias va='source ./venv/bin/activate'
# Python Virtual Environment Exit - Or Apply Current Profile
alias vx='source $HOME/.profile && [[ -e "$HOME/.bash_profile" ]] && source $HOME/.bash_profile'
# Copy with progress Bar
alias cpv='rsync -ah --info=progress2'
# Trash items
alias tcn='mv --force -t ~/.local/share/Trash '
# Clear Screen
alias c='clear'
# Directory
alias d='cd ..'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
# Grep always with Color
alias grep='grep --color=auto'
# Calculator
alias calc='bc -l'
# SHA 1 Calculation
alias sha1='openssl sha1'
# Trusted MKDIR
alias mkdir='mkdir -pv'
# Dos Path command
alias path='echo -e ${PATH//:/\\n}'
# Time Function
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
# Windows Ping
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
# Get Ports Open
alias ports='netstat -tulanp'
# Wget with Continue
alias wget='wget -c'
# Special Nano
alias nano='nano -i -c -l'
# Windows Git GUI
alias gitk='gitg'
# History Commands
alias h='history'
alias j='jobs -l'
alias hc='rm ~/.bash_history && history -c'

# Juypter - IPython
alias ipy='cd $HOME/Documents/ipython-notebooks && jupyter notebook && cd -'

# Local IP address Fetch
alias localip='ip addr show | grep -v docker | grep -v tun0 | grep "inet " | grep -v 127.0.0.1 | awk "{printf \"Local %s\",\$2}" | cut -d "/" -f 1'

# Docker Interface IP Address Frech
alias dockerip='ip addr show | grep docker |  grep "inet " | awk "{printf \"Docker %s\",\$2}" | cut -d "/" -f 1'

# VPN IP Address Fetch
alias vpnip='ip addr show | grep tun0 | grep "inet " | awk "{printf \"VPN %s\",\$2}" | cut -d "/" -f 1'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e'\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Get List of Serial Port
alias lserial='python3 -m serial.tools.list_ports'


# For Super user Aliases
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    # Replace Install commands
    alias apt-get='sudo apt-get'
    alias apt='sudo apt'
    # Become Root
    alias root='sudo -i'
    # Pacman for Arch / Manjaro Linux
    alias pacman='sudo pacman'
    # Pacman for Arch / Manjaro Linux
    alias pacman-install='sudo pacman -S '
    alias pacman-rm='sudo pacman -Rs '
    alias pacman-rm-f='sudo pacman -Rsu '
    alias pacman-search='sudo pacman -Ss'
    alias pacman-ls='sudo pacman -Qn'
    alias pacman-ls-ext='sudo pacman -Qe'
    alias pacman-clean='sudo paccache -ruk0'
    alias pacman-clean-f='sudo pacman -Scc'
    # Update Command
    alias apt-update='sudo apt-get update && apt-get upgrade'
    alias pacman-update='sudo pacman -Syu'
    alias pacman-update-f='sudo pacman -Syyu'
    # pacman Fix Circular Dependencies
    alias pacman-fix='sudo pacman -Scc && sudo pacman -Syyu'

fi

# Docker Shortcuts
edls='docker ps -a'
edlsi='docker images '
edpull='docker pull '
edrm='docker rm -f '
edrmi='docker rmi '
edr='docker run --rm '
edrr='docker run '
edclean='docker ps -aq | xargs docker rm -rf'
edcleani='docker rmi $(docker images -f "dangling=true" -q)'

# Docker Golang
edgo='docker run --rm -v "$PWD":/go/src -w /go/src golang go '
egoi='docker run --rm -it -v "$PWD":/go/src -w /go/src golang bash '

# If user is not member of Docker Group
if [ -z "$(cat /etc/group | grep docker | grep $USER)" ]; then
    alias docker='sudo docker'
    # Docker Shortcuts
    alias dls="sudo $edls"
    alias dlsi="sudo $edlsi"
    alias dpull="sudo $edpull"
    alias drm="sudo $edrm"
    alias drmi="sudo $edrmi"
    alias dr="sudo $edr"
    alias drr="sudo $edrr"
    alias dclean="sudo $eclean"
    alias dcleani="sudo $ecleani"

    # Docker Golang
    alias dgo="sudo $edgo"
    alias goi="sudo $egoi"
else
    # Docker Shortcuts
    alias dls=$edls
    alias dlsi=$edlsi
    alias dpull=$edpull
    alias drm=$edrm
    alias drmi=$edrmi
    alias dr=$edr
    alias drr=$edrr
    alias dclean=$eclean
    alias dcleani=$ecleani

    # Docker Golang
    alias dgo=$edgo
    alias goi=$egoi
fi

# Weather Report
wttr ()
{
    # change Paris to your default location
    local request="wttr.in/${1-Delhi}"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}

# Temperature Display
alias tsensor='watch -n 2 sensors'


