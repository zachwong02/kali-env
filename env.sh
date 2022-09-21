#!/bin/bash

mkdir ~/tools

cd ~/tools

wget https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php

wget https://github.com/carlospolop/PEASS-ng/releases/download/20220911/linpeas.sh -O linpeas.sh

wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar

cd ~

curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh

cd /tmp

sudo chmod +x nodesource_setup.sh

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt update
sudo apt full-upgrade
sudo apt install apt-transport-https
sudo apt install sublime-text foremost binwalk steghide exiftool sonic-visualiser nodejs npm terminator ghidra qemu-user-static binfmt-support
sudo dpkg --add-architecture amd64
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libc6:amd64
sudo apt install libc6:i386

sudo npm install snyk -g


