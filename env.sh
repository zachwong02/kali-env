#!/bin/bash

mkdir ~/tools

cd ~/tools

wget https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php

wget https://github.com/carlospolop/PEASS-ng/releases/download/20220911/linpeas.sh -O linpeas.sh

wget https://raw.githubusercontent.com/plackyhacker/ps-encoder/main/ps-encoder.py -O ps-encoder.py

wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar

wget https://github.com/colaclanth/sstv.git

git clone https://github.com/internetwache/GitTools.git

git clone https://github.com/htr-tech/zphisher.git

git clone https://github.com/vlohacks/encrack.git

git clone https://github.com/thosearetheguise/decrypt-openssl-bruteforce.git

git clone https://github.com/samratashok/nishang.git

git clone https://github.com/wavestone-cdt/powerpxe.git

mkdir pspy

cd pspy

wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32 -O pspy32

wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32s -O pspy32s

wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64 -O pspy64

wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64s -O pspy64s

cd ~

curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh

cd /tmp

sudo chmod +x nodesource_setup.sh

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg

echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt update
sudo apt full-upgrade -y
sudo apt install -y apt-transport-https
sudo apt install -y sublime-text foremost binwalk steghide exiftool sonic-visualiser nodejs npm terminator ghidra gimp imagemagick yt-dlp lz4 lzip lzop libreoffice stegcracker gh seclists bruteforce-salted-openssl docker.io gobuster

gh auth login

cd ~

arch=$(uname -m)

if [[ $arch == "aarch64" || $arch == "arm64" ]]; then
	sudo dpkg --add-architecture amd64
	sudo dpkg --add-architecture i386
	sudo apt update
	sudo apt install -y libc6:amd64 libc6:i386 qemu-user-static binfmt-support burpsuite gcc-x86-64-linux-gnu
fi


if [[ $arch == "x86_64" ]]; then
	sudo apt install -y gdb ltrace strace
fi

sudo npm install snyk -g


clear




