#!/bin/sh

apt-get update
echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
add-apt-repository ppa:fingerprint/fingerprint-gui
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get --allow-unauthenticated install sur5r-keyring
apt-get install software-properties-common
apt-get install gnome-session gnome-settings-daemon gnome-panel i3
apt-get install libbsapi policykit-1-fingerprint-gui fingerprint-gui
apt-get install neovim
apt-get install python-dev python-pip python3-dev python3-pip
apt install consolekit
apt install htop
apt install tmux
apt install wicd-curses
apt install xautolock
apt install xbacklight
apt install xfce4
NetworkManager 
nvim /usr/share/applications/i3.desktop
nvim /usr/share/gnome-session/sessions/i3.session
nvim /usr/share/xsessions/gnome-i3.desktop
vi /etc/apt/sources.list
visudo
wicd
update-rc.d wicd defaults
xinput --set-prop --type=int --format=8 "SynPS/2 Synaptics TouchPad" 288 1
