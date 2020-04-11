#!/bin/bash

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

#https://www.reddit.com/r/unixporn/comments/ecuuvl/my_new_linux_mint_193_tricia_cinnamon/


#icon 
La-capitaine-icon-theme

cd $HOME/.icons
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
./configure
