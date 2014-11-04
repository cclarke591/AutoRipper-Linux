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
echo "You entered: $script_user is this correct?"
if [[ $REPLY =~ ^[Yy]$ ]]
then
else
	exit 1
fi

# Ask if we want to install CD Ripping
read -p "Install auto CD ripping?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installcdrip="true"
else
	installcdrip="false"
fi

# Ask if we want to install DVD Ripping
read -p "Install auto DVD ripping?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installdvdrip="true"
else
	installdvdrip="false"
fi

# Ask if we want to install BR Ripping
read -p "Install auto Bluray ripping?" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	installbrrip="true"
else
	installbrrip="false"
fi

# CD Ripping install routine
if [ $installcdrip -eq "true" ]
then
	echo "Updating Aptitude and Installing ABCDE."
	echo "Updating Aptitude and Installing ABCDE." >> install.log
	sudo apt-get -q update &>> install.log
    sudo apt-get -y install abcde &>> install.log
    cp MIMEs/ripcd.desktop /usr/share/applications/ripcd.desktop
    if [ -f /home/$script_user/.local/share/applications/mimeapps.list]
    then
    	echo "Existing mimeapps.list found. Moving to .bak file." >> install.log
    	mv /home/$script_user/.local/share/applications/mimeapps.list /home/$script_user/.local/share/applications/mimeapps.list.bak
		cp MIMEs/mimeapps.list /home/$script_user/.local/share/applications/
	else
		echo "Copying mimeapps.list." >> install.log
		cp MIMEs/mimeapps.list /home/$script_user/.local/share/applications/
	fi
	echo "Auto CD Ripping Installed!"
	echo "Please change the default application for CDs in"
	echo "System Settings -> Details -> Removable Media"
	echo "Change CD audio to Rip CD"
else
fi