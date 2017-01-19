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
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo nvidia-settings &
# for i3
# http://www.klavrekod.se/til/2015/05/gnome-i3wm/
sudo apt-get install gnome gnome-session i3 i3status
visudo
wicd
update-rc.d wicd defaults
xinput --set-prop --type=int --format=8 "SynPS/2 Synaptics TouchPad" 288 1
# for cuda, tf, etc
sudo apt-get install gcc-4.9
sudo apt-get install g++-4.9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 40 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9 
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6
sudo update-alternatives --config gcc
sudo apt install htop
sudo apt-get install x264
sudo apt-get install freeglut3-dev libx11-dev libxmu-dev libxi-dev libglu1-mesa-dev
sudo dpkg -i cuda-repo-ubuntu1604_8.0.44-1_amd64.deb 
sudo apt-get update
sudo apt-get install cuda
sudo apt-get install libcupti-dev
sudo apt-get install python-numpy python-dev python-wheel
sudo apt-get install python3-numpy python3-dev python3-wheel
sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*
sudo apt-get update
sudo apt-get install python-pip python-dev python-virtualenv
