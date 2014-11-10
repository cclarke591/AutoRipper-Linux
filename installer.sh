#!/bin/bash
#################################################
# AutoRipper Installer							#
# Written by Steve Tomaszewski					#
# Github: https://github.com/sk8r776/AutoRipper	#
# Version: 0.1 (Alpha Build)                    #
#################################################
echo "Welcome to the auto ripper installer"

# Check for root acces
if [ "$(id -u)" != "0" ]; then
   echo "Please run installer as root" 1>&2
   exit 1
fi

# we need the ripping user login for the MIME autorun system
echo "Please enter username: "
read script_user

# Ask if we want to install CD Ripping
read -p "Install auto CD ripping?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installcdrip="1"
else
	installcdrip="0"
fi

# Ask if we want to install DVD Ripping
read -p "Install auto DVD ripping?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installdvdrip="1"
else
	installdvdrip="0"
fi

# Ask if we want to install BR Ripping
read -p "Install auto Bluray ripping?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installbrrip="1"
else
	installbrrip="0"
fi

# CD Ripping install routine
if [ $installcdrip -eq 1 ]
then
	echo "Updating Aptitude and Installing ABCDE."
	echo "Updating Aptitude and Installing ABCDE." &>> CDRIP-install.log
	echo "" &>> CDRIP-install.log
	echo "---------------------------------------" &>> CDRIP-install.log
	echo "" &>> CDRIP-install.log
	sudo apt-get -q update &>> CDRIP-install.log
	echo "" &>> CDRIP-install.log
	echo "---------------------------------------" &>> CDRIP-install.log
	echo "" &>> CDRIP-install.log
    sudo apt-get -y install abcde &>> CDRIP-install.log
    echo "" &>> CDRIP-install.log
	echo "---------------------------------------" &>> CDRIP-install.log
	echo "" &>> CDRIP-install.log
    sudo cp MIMEs/ripcd.desktop /usr/share/applications/ripcd.desktop &>> CDRIP-install.log
    echo "" &>> CDRIP-install.log
	echo "---------------------------------------" &>> CDRIP-install.log
	echo "" &>> CDRIP-install.log
	echo "Auto CD Ripping Installed!"
	echo "Please change the default application for CDs in"
	echo "System Settings -> Details -> Removable Media"
	echo "Change CD audio to Rip CD"
else
	echo "CD Ripping not selected for install." &>> CDRIP-install.log
fi

# DVD Ripping install routine
if [ $installdvdrip -eq 1 ]
then
	echo "Updating Aptitude and Installing DVDBackup."
	echo "Updating Aptitude and Installing DVDBackup." &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
	echo "---------------------------------------" &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
	sudo add-apt-repository -y ppa:stebbins/handbrake-snapshots &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
	echo "---------------------------------------" &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
	echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo sh -c 'cat >> /etc/apt/sources.list' &>> DVDRIP-install.log
	echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo sh -c 'cat >> /etc/apt/sources.list' &>> DVDRIP-install.log
	wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add - &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
	echo "---------------------------------------" &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
	sudo apt-get -q update &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
	echo "---------------------------------------" &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
   	sudo apt-get -y install dvdbackup git handbrake-cli handbrake-gtk libdvdcss2 &>> DVDRIP-install.log
   	echo "" &>> DVDRIP-install.log
	echo "---------------------------------------" &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
   	sudo cp Scripts/ripdvd /usr/bin/ripdvd &>> DVDRIP-install.log
   	sudo chmod +x /usr/bin/ripdvd &>> DVDRIP-install.log
   	sudo cp MIMEs/ripdvd.desktop /usr/share/applications/ripdvd.desktop &>> DVDRIP-install.log
   	echo "" &>> DVDRIP-install.log
	echo "---------------------------------------" &>> DVDRIP-install.log
	echo "" &>> DVDRIP-install.log
	echo "Auto DVD Ripping Installed!"
	echo "Please change the default application for DVDs in"
	echo "System Settings -> Details -> Removable Media"
	echo "Change DVD Video to Rip DVD"
else
	echo "DVD Ripping not selected for install." &>> DVDRIP-install.log
fi

# BR Ripping install routine
if [ $installbrrip -eq 1 ]
then
	if [ $installdvdrip -eq 1 ]
	then
	echo "Some Pre Reqs have been installed!" &>> BRRIP-install.log
	else
	sudo add-apt-repository -y ppa:stebbins/handbrake-snapshots &>> BRRIP-install.log
	echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo sh -c 'cat >> /etc/apt/sources.list' &>> BRRIP-install.log
	echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo sh -c 'cat >> /etc/apt/sources.list' &>> BRRIP-install.log
	wget -quiet -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add - &>> BRRIP-install.log
	sudo apt-get -q update &>> BRRIP-install.log
	sudo apt-get -y install git handbrake-cli handbrake-gtk libdvdcss2 &>> BRRIP-install.log
	fi
	echo "" &>> BRRIP-install.log
	echo "---------------------------------------" &>> BRRIP-install.log
	echo "" &>> BRRIP-install.log
	sudo apt-get -y install build-essential libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev libqt4-dev &>> BRRIP-install.log
	echo "" &>> BRRIP-install.log
	echo "---------------------------------------" &>> BRRIP-install.log
	echo "" &>> BRRIP-install.log
	wget -quiet http://www.makemkv.com/download/makemkv-bin-1.8.14.tar.gz &>> BRRIP-install.log
	wget -quiet http://www.makemkv.com/download/makemkv-oss-1.8.14.tar.gz &>> BRRIP-install.log
	tar xvzf makemkv-oss-1.8.14.tar.gz &>> BRRIP-install.log
	tar xvzf makemkv-bin-1.8.14.tar.gz &>> BRRIP-install.log
	cd makemkv-oss-1.8.14/ &>> BRRIP-install.log
	./configure &>> BRRIP-install.log
	make --quiet && sudo make install &>> BRRIP-install.log
	cd .. &>> BRRIP-install.log
	cd makemkv-bin-1.8.14/ &>> BRRIP-install.log
	make --quiet && sudo make install
	cd .. &>> BRRIP-install.log
	rm -R makemkv* &>> BRRIP-install.log
	echo "" &>> BRRIP-install.log
	echo "---------------------------------------" &>> BRRIP-install.log
	echo "" &>> BRRIP-install.log
	sudo cp Scripts/ripbluray /usr/bin/ripbluray &>> BRRIP-install.log
	sudo chmod +x /usr/bin/ripbluray &>> BRRIP-install.log
   	sudo cp MIMEs/ripbluray.desktop /usr/share/applications/ripbluray.desktop &>> BRRIP-install.log
   	echo "" &>> BRRIP-install.log
	echo "---------------------------------------" &>> BRRIP-install.log
	echo "" &>> BRRIP-install.log
   	echo "Auto Bluray Ripping Installed!"
	echo "Please change the default application for DVDs in"
	echo "System Settings -> Details -> Removable Media -> Other Media"
	echo "Change Blu-ray Video Disc to Rip Bluray"
else
	echo "Bluray Ripping not selected for install." &>> BRRIP-install.log
fi

echo "Existing mimeapps.list found. Moving to .bak file." &>> BRRIP-install.log
echo "Existing mimeapps.list found. Missing file error is OK here!"
echo "Existing mimeapps.list found. Missing file error is OK here!" &>> BRRIP-install.log
mv /home/$script_user/.local/share/applications/mimeapps.list /home/$script_user/.local/share/applications/mimeapps.list.bak
mkdir -p /home/$script_user/.local/share/applications/
cp MIMEs/mimeapps.list /home/$script_user/.local/share/applications/mimeapps.list