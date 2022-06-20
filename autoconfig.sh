#!/bin/bash

read -p 'Username (home directory): ' username

echo "------------------------------------------------"
echo ""
echo "            Installing dependencies             "
echo ""
echo "------------------------------------------------"

apt install -y i3

apt install -y wget zsh network-manager \
feh maim xclip light pulseaudio compton \
ffmpeg imagemagick xdotool curl scrot bat xserver-xorg-input-synaptics \
git make xdg-utils pkg-config build-essential vim pavucontrol lxappearance \
gtk2-engines-murrine gtk2-engines-pixbuf ncdu python3 python3-pip \
nemo rofi libnotify-bin playerctl

echo "------------------------------------------------"
echo ""
echo "         Setting editor and interfaces          "
echo ""
echo "------------------------------------------------"

# root
curl -L http://install.ohmyz.sh | sh
curl https://raw.githubusercontent.com/reversTeam/Sublivim/master/installer.sh | sh
chsh -s $(which zsh)

# user
sudo -H -u $username bash -c "curl -L http://install.ohmyz.sh | sh"
sudo -H -u $username bash -c "curl https://raw.githubusercontent.com/reversTeam/Sublivim/master/installer.sh | sh"
sudo -H -u $username bash -c "chsh -s $(which zsh)"

echo "------------------------------------------------"
echo ""
echo "   Installing config files in home directory    "
echo ""
echo "------------------------------------------------"


rm -rf /home/$username/.config/i3 && cp -r .config/i3 /home/$username/.config/i3
cp -r scripts /home/$username
chmod +x /home/$username/scripts/*.sh 

echo "------------------------------------------------"
echo ""
echo "                 Configuration                  "
echo ""
echo "------------------------------------------------"
chmod +s /usr/bin/light
