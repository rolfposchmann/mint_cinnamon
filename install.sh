#!/bin/bash

#TODO:
#- BTRFS komprimieren
#- ZRAM
#- SAWP
#- Display Auflösung
#- tmp auf tmpfs

#1) Anwendungspaketquellen
#2) Firefox: Google Suche

#-Adblock Plus: https://addons.mozilla.org/de/firefox/addon/adblock-plus/?src=search
#-Grammarly:https://addons.mozilla.org/de/firefox/addon/grammarly-1/
#-keepa.com: https://addons.mozilla.org/de/firefox/addon/keepa/?src=search

# !!! Firefox suche ändern!
# und Sprache festlegen

sudo apt update
sudo apt install -y curl wget git neofetch htop


#Auflösung
cd ~
touch external_monitor_resolution.sh
echo "xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync" > external_monitor_resolution.sh
echo "xrandr --addmode DVI-1 1280x1024_60.00" >> external_monitor_resolution.sh
sudo chmod 755 external_monitor_resolution.sh
sudo mv external_monitor_resolution.sh /etc/profile.d/external_monitor_resolution.sh
sudo /etc/profile.d/external_monitor_resolution.sh


#SWAP
#sudo fallocate -l 1G /swapfile
#sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576   #1GB
#sudo dd if=/dev/zero of=/myswap count=4096 bs=1MiB
#ls -lh /swapfile
#sudo chmod 600 /swapfile
#sudo mkswap /swapfile
#sudo swapon /swapfile
#sudo nano /etc/fstab
#/swapfile                                 none            swap    sw              0       0

#btrfs swap
#btrfs filesystem usage /
#dmesg | grep crc32c

sudo rm /swapfile
sudo truncate -s 0 /swapfile
sudo chattr +C /swapfile
sudo btrfs property set /swapfile compression none
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576 
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
# swapoff /swapfile
# rm -f /swapfile
echo "#/swapfile                                 none            swap    sw                            0       0" | sudo tee -a /etc/fstab


#sudo swapon --show
#free -h

#cat /proc/sys/vm/swappiness
#sudo nano /etc/sysctl.conf
#add: vm.swappiness=10
echo "vm.swappiness=10" | sudo tee -a /etc/sysctl.conf

#renove swap
#sudo swapoff -v /swapfile
#fstab
#sudo rm /swapfile

####################################
# ZRam

sudo apt-get install zram-config 


##################################
# /tmp on tmpfs

echo "#tmpfs                                     /tmp            tmpfs   rw,nosuid,nodev               0       0" | sudo tee -a /etc/fstab

#microcode
dpkg --list *microcode
dmesg | grep microcode
sudo apt install intel-microcode / amd64-microcode
sudo update-initramfs -u
sudo reboot


################################
# Meltdown

sudo apt install curl wget git 
curl -L https://meltdown.ovh -o spectre-meltdown-checker.sh
wget https://meltdown.ovh -O spectre-meltdown-checker.sh
chmod +x spectre-meltdown-checker.sh
sudo ./spectre-meltdown-checker.sh

apt install spectre-meltdown-checker
sudo spectre-meltdown-checker


###############################
# Oh My ZSH

sudo apt update
sudo apt-get install zsh 
zsh --version
sudo apt install curl wget git 
sudo apt install fonts-powerline
#sudo apt install ttf-mscorefonts-installer
#sudo fc-cache -f -v
sudo mkdir /usr/share/fonts/WindowsFonts
sudo cp ~/Downloads/Fonts/* /usr/share/fonts/WindowsFonts
sudo chmod 755 /usr/share/fonts/WindowsFonts/*
sudo fc-cache -f -v

#sudo apt-get install --reinstall ttf-mscorefonts-installer
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo $SHELL
sudo chsh -s $(which zsh)

nano ~/.zshrc
#default: ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

#plugins
plugins=(git bundler osx rake ruby)

############################
# Console Colors:
https://github.com/Mayccoll/Gogh
sudo apt-get install dconf-cli uuid-runtime
bash -c  "$(wget -qO- https://git.io/vQgMr)"
33 desert

#############################
# Icons

#paper icons
mkdir -p ~/.icons && cd ~/.icons && git clone https://github.com/rolfposchmann/paper-icon-theme.git
cd paper-icon-theme/
sudo apt -y install meson
meson "build" --prefix=/usr
#install to /usr/
sudo ninja -C "build" install

#numix circle icon
sudo add-apt-repository ppa:numix/ppa
sudo apt update
sudo apt install numix-icon-theme-circle

#vimix-icon-theme
cd ~/.icons && git clone https://github.com/vinceliuice/vimix-icon-theme.git
cd vimix-icon-theme/
./install.sh

#La-capitaine-icon-theme
cd ~/.icons && git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
cd la-capitaine-icon-theme/
./configure

#########################################
#Themes:
sudo apt install arc-theme

################################
#Styles:
#https://www.reddit.com/r/unixporn/comments/ak9qgb/cinnamon_thinking/
#https://www.reddit.com/r/unixporn/comments/ecuuvl/my_new_linux_mint_193_tricia_cinnamon/

