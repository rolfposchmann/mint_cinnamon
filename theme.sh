

sudo add-apt-repository ppa:tista/plata-theme
sudo apt update
sudo apt install plata-theme
sudo apt install papirus-icon-theme
sudo apt install breeze-cursor-theme

Theme: Plata-Noir
Icon: Papirus
gnome terminal
breeze coursor
dark theme


#mac like: https://www.reddit.com/r/unixporn/comments/ehlads/muttercinnamon_less_is_more_linux_mint_cinnamon/
https://github.com/vinceliuice/Tela-icon-theme
https://github.com/vinceliuice/Mojave-gtk-theme
https://addons.mozilla.org/en-GB/firefox/addon/teal-black-fox/

    Wallpaper: Life and Death

    GTK: McMojave (Dark theme)

    Icons: Tela

    Desklet: Default Cinnamon Disk space/RAM usage desklet

    Dock: Plank

    Other: Browser is Firefox with the Teal Black Fox theme
    
#Tela icons
mkdir -p ~/.icons && cd ~/.icons && git clone https://github.com/vinceliuice/Tela-icon-theme.git
cd Tela-icon-theme/
./install.sh




###############################
#andere Themes

#Material-dark (mit Numic Circle)
https://github.com/nana-4/materia-theme

#Adapta
sudo apt install adapta-gtk-theme
#Arc Theme
sudo apt-get install -y arc-theme

#CBalckdark

#############################
# Icons

#Nordic Theme
sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic

#Zafiro icons
sudo git clone https://github.com/zayronxio/Zafiro-icons.git /usr/share/icons/Zafiro

#Numix icons
#sudo add-apt-repository ppa:numix/ppa
#sudo apt update
#sudo apt install numix-icon-theme-circle
sudo apt install -y numix-icon-theme-circle

#paper icons
mkdir -p ~/.icons && cd ~/.icons && git clone https://github.com/rolfposchmann/paper-icon-theme.git
cd ~/.icons/paper-icon-theme/
sudo apt install -y meson
meson "build" --prefix=/usr
#install to /usr/share/icons/Paper
sudo ninja -C "build" install

#vimix-icon-theme
cd ~/.icons && git clone https://github.com/vinceliuice/vimix-icon-theme.git
cd vimix-icon-theme/
./install.sh

#La-capitaine-icon-theme
cd ~/.icons && git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
cd la-capitaine-icon-theme/
./configure

#Tela-dark
#Flat-Remix-Dark
