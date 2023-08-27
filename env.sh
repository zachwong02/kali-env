#!/bin/bash

# Check Parameters

git_username=$1
git_email=$2

if [[ $git_username == "" ]]; then
	echo "Please put in your git username in the first parameter"
	exit 0
fi

if [[ $git_email == "" ]]; then
	echo "Please put in your git email in the second parameter"
	exit 0
fi

# Unpack rockyou.txt
sudo gunzip /usr/share/wordlists/rockyou.txt.gz

# Download Tools
mkdir ~/tools
cd ~/tools
wget https://raw.githubusercontent.com/pentestmonkey/php-reverse-shell/master/php-reverse-shell.php
wget https://raw.githubusercontent.com/plackyhacker/ps-encoder/main/ps-encoder.py -O ps-encoder.py
wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
git https://github.com/colaclanth/sstv.git
git clone https://github.com/internetwache/GitTools.git
git clone https://github.com/htr-tech/zphisher.git
git clone https://github.com/vlohacks/encrack.git
git clone https://github.com/thosearetheguise/decrypt-openssl-bruteforce.git
git clone https://github.com/samratashok/nishang.git
git clone https://github.com/wavestone-cdt/powerpxe.git
git clone https://github.com/PowerShellMafia/PowerSploit.git
git clone https://github.com/ropnop/windapsearch.git

# Move Rubeus.exe to tools
mv ./bin/Rubeus.exe ~/tools

# Download pspy
cd ~/tools
mkdir pspy
cd pspy
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32 -O pspy32
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32s -O pspy32s
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64 -O pspy64
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64s -O pspy64s

# Download LinPeas / WinPeas
cd ~/tools
mkdir PEASS-ng
cd PEASS-ng
wget https://github.com/carlospolop/PEASS-ng/releases/download/20220911/linpeas.sh -O linpeas.sh
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230805-d1609387/winPEAS.bat -O winPEAS.bat
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230805-d1609387/winPEASx64.exe -O winPEASx64.exe
wget https://github.com/carlospolop/PEASS-ng/releases/download/20230805-d1609387/winPEASx86.exe -O winPEASx86.exe

# Install Bloodhound
sudo chown $USER:$USER /opt
cd /opt
sudo pip install bloodhound
sudo apt install -y openjdk-11-jdk
wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.com stable 4' | sudo tee /etc/apt/sources.list.d/neo4j.list > /dev/null
sudo apt update
sudo apt install -y apt-transport-https
sudo apt install -y neo4j

if [[ $arch == "aarch64" || $arch == "arm64" ]]; then
	wget https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-arm64.zip -O BloodHound-linux-arm64.zip 
	unzip BloodHound-linux-arm64.zip -d BloodHound
	rm BloodHound-linux-arm64.zip
fi


if [[ $arch == "x86_64" ]]; then
	wget https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip -O BloodHound-linux-x64.zip
	unzip BloodHound-linux-x64.zip -d BloodHound
	rm BloodHound-linux-arm64.zip	
fi

# Download Mimikatz
cd ~/tools
wget https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20220919/mimikatz_trunk.zip -O mimikatz_trunk.zip
unzip mimikatz_trunk.zip -d mimikatz

# Download Chisel
cd ~/tools
mkdir chisel
cd chisel
wget https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_linux_amd64.gz -O chisel_1.8.1_linux_amd64.gz
wget https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_linux_arm64.gz -O chisel_1.8.1_linux_arm64.gz
wget https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_windows_amd64.gz -O chisel_1.8.1_windows_amd64.gz
wget https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_windows_386.gz -O chisel_1.8.1_windows_386.gz
gunzip chisel_1.8.1_linux_amd64.gz
gunzip chisel_1.8.1_linux_arm64.gz
gunzip chisel_1.8.1_windows_amd64.gz
gunzip chisel_1.8.1_windows_386.gz

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
cd /tmp
sudo chmod +x nodesource_setup.sh


# Install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt full-upgrade -y
sudo apt install -y apt-transport-https
sudo apt install -y sublime-text foremost binwalk steghide exiftool sonic-visualiser nodejs npm terminator ghidra gimp imagemagick yt-dlp lz4 lzip lzop libreoffice stegcracker gh seclists bruteforce-salted-openssl docker.io gobuster


# Configure Git
gh auth login
git config --global user.name "$git_username"
git config --global user.email "$git_email"

# Install Volatility2
cd /tmp
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
sudo python2 get-pip.py
cd /opt
git clone https://github.com/miszr/volatility.git
cd volatility
git branch -a
git checkout dwarf-5
git merge origin/patch-1  --no-edit
sudo apt update
sudo apt install -y python2.7
sudo apt install -y build-essential python2.7-dev
pip2 install setuptools
pip2 install distorm3==3.4.4
pip2 install pycrypto
cd ~


# Installs Emulation Support for BinEx Challenges for aarch64/arm64 (NOT RECOMMENDED)
arch=$(uname -m)

if [[ $arch == "aarch64" || $arch == "arm64" ]]; then
	sudo dpkg --add-architecture amd64
	sudo dpkg --add-architecture i386
	sudo apt update
	sudo apt install -y libc6:amd64 libc6:i386 qemu-user-static binfmt-support burpsuite gcc-x86-64-linux-gnu
fi


# Installs Toosl for BinEx Challenges for x64/x86
if [[ $arch == "x86_64" ]]; then
	sudo apt install -y gdb ltrace strace
fi

# Install Synk
sudo npm install snyk -g


clear




