#!/bin/bash

read -p 'Username (home directory): ' username

echo "------------------------------------------------"
echo ""
echo "            Installing dependencies             "
echo ""
echo "------------------------------------------------"

apt install -y i3

apt install -y wget zsh network-manager flameshot xclip \
feh maim xclip light pulseaudio compton i3blocks \
ffmpeg imagemagick xdotool curl scrot bat xserver-xorg-input-synaptics \
git make xdg-utils pkg-config build-essential vim pavucontrol lxappearance \
gtk2-engines-murrine gtk2-engines-pixbuf ncdu python3 python3-pip \
nemo rofi libnotify-bin playerctl ffuf jq

echo "------------------------------------------------"
echo ""
echo "         Setting editor and interfaces          "
echo ""
echo "------------------------------------------------"

# root
curl -L http://install.ohmyz.sh | sh
curl https://raw.githubusercontent.com/reversTeam/Sublivim/master/installer.sh | sh
chsh -s $(which zsh)

echo "------------------------------------------------"
echo ""
echo "           Installing zsh config files          "
echo ""
echo "------------------------------------------------"

ZSH_CUSTOM="/home/$username/.oh-my-zsh/custom"
# user
sudo -H -u $username bash -c "curl -L http://install.ohmyz.sh | sh"
sudo -H -u $username bash -c "curl https://raw.githubusercontent.com/reversTeam/Sublivim/master/installer.sh | sh"
sudo -H -u $username bash -c "chsh -s $(which zsh)"
## install plugins
sudo -H -u $username bash -c "git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions"
cp -ar home/. /home/$username/
sudo -H -u $username bash -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
sudo -H -u $username bash -c "git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions"
## install theme
sudo -H -u $username bash -c "git clone https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt --depth=1"
sudo -H -u $username bash -c "ln -s $ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme $ZSH_CUSTOM/themes/spaceship.zsh-theme"

# install fuzzy finder
sudo -H -u $username bash -c "git clone --depth 1 https://github.com/junegunn/fzf.git ~/tmp/.fzf"
sudo -H -u $username bash -c "~/tmp/.fzf/install"

echo "------------------------------------------------"
echo ""
echo "   Installing config files in home directory    "
echo ""
echo "------------------------------------------------"

rm -rf /home/$username/.config/i3 && rm -rf /home/$username/.config/rofi && cp -r .config/ /home/$username/
cp -r scripts /home/$username
chmod +x /home/$username/scripts/*.sh 

echo "------------------------------------------------"
echo ""
echo "                 Configuration                  "
echo ""
echo "------------------------------------------------"
chmod +s /usr/bin/light
# move config files
chmod -R 755 etc/
chown -R root: etc/
cp -ar etc/. /etc/
