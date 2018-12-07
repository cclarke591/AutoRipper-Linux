AutoRipper - Linux
==========

About AutoRipper for Linux
==========
Auto Ripper for linux was built and tested on Ubuntu 12.04.

Requirments
==========
-Desktop with Ubuntu 12.04 LTS + Installed  
-Internet connect  
-CD, DVD, or Bluray Drive  
-Some Patience  

Install instrucitons are located at the following link:
==========

Auto Ripper for Linux
======================
Installing AutoRipper for Linux was designed to be as easy as possible.

*Note: This was developed and tested on Ubuntu 12.04.5 LTS x64 Desktop Edition.
Install Procedures
======================
*We assume you start from a base install of Ubuntu.
**Ubuntu Installation will not be covered in this installation doc.

1. First lets get git on our machine
:Open Terminal (CTRL + ALT + T) or select terminal from the unity menu.
<pre> sudo apt-get install git </pre>

2. Next we need to clone the repo to our ripping machine
<pre> git clone https://github.com/cclarke591/AutoRipper-Linux.git </pre>

3. Lets move into the AutoRipper directory
<pre>cd AutoRipper-Linux</pre>

4.Now lets make the installer executable so we can run it
<pre> chmod +x installer.sh </pre>

5. Lets run the installer
<pre> sudo ./installer.sh </pre>

6. Here you will be asked for the username that will be logged in to rip.
*The user has to be set to autologin for the zero touch part to work properly.
**The user setup on mine is named ripper
<pre>Please enter username: 
ripper
</pre>

7. Next you will be asked which rippers you want to install.
*You only have to press Y do not hit enter after you hit Y or N
<pre>Install auto CD ripping?y
Install auto DVD ripping?y
Install auto Bluray ripping?y
</pre>

8. The installer will proceed to install the selected ripping programs. This can take a couple minutes.

9. Once install completes you are ready to Rip! 
*Check subsections for install quirks you need to know.

CD Rip Install Notes
======================
No notes at this time!

DVD Rip Install Notes
======================
No Notes at this time!

Blu-Ray Install Notes
======================
*When installing Blu-Ray ripping, you will be asked to accept MakeMKV's EULA.
*The text will start with the below once it gets to this section:
<pre>Copyright (C) 2007-2014 GuinpinSoft inc

IMPORTANT NOTE

The Software, as defined below, is protected by copyright, which is vested in GuinpinSoft inc.
</pre>

*Please read the EULA and accept.  
*To accept hit Q and type yes or no.


Thanks
==========
http://www.makemkv.com/ - For such an awesome Bluray ripping software  
https://handbrake.fr/ - For an amazing encoder, and for it being free!  

Last but not least, Pat Hartl, for the idea and inpiration.  
Please visit his blog post here: http://pathartl.me/blog/2013/12/01/the-ultimate-automated-ripping-machine/  
