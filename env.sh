#!/bin/bash

mkdir ~/tools

cd ~/tools

wget https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php

wget https://github.com/carlospolop/PEASS-ng/releases/download/20220911/linpeas.sh -O linpeas.sh

wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt-get update
sudo apt-get full-upgrade
sudo apt-get install apt-transport-https
sudo apt-get install sublime-text foremost binwalk steghide exiftool sonic-visualiser


