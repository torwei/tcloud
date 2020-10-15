#!/bin/sh
# Shellscripting Solutions - Programming by Torsten Weiler
#
# These scipt are created and developed by Torsten Weiler, Lowersaxony
# Internet: http://www.torsten-weiler.de
# (c) 2007 Internet Agentur Torsten Weiler, 26465 Langeoog.
#
# created: 14 Okt. 2020
# description: Include MagentaCLOUD as a Network drive
#              call the script like: "magentacloud.sh yourLinuxUser mountPoint"
#
#
# define the necessary variables
MOUNTPOINT="/media/MagentaCLOUD"
MYDIR="/home/torsten/Projects"
WEBDAV="https://webdav.magentacloud.de"
LOGFILE="/home/torsten/Projects/rsync.log"


# Check if the script executed by root
if [ $(id -u) -ne 0 ]; then
    echo "Script muss mit Root-Rechten ausgeführt werden."
    exit 1
fi

# Ask the user for Settings
echo "I'll need some Information from you. So as Username and Password. Please answer the Questions in the next Step."
read –p "Your Username: " USER
read -s -p "Your Password: " PASS


# first install the necessary packages via apt
sudo apt install ca-certificates davfs2

# to mount the networkdrive as normal user not as root we have to configure davfs2
# The mount.davfs file must have the SUID-Bit set if
# unprivileged (not root) users want to allow WebDAV resources to be integrated (mounted).
# ask the package configuration from davfs2 about the SUID-Bit Flag answer with yes!!
# new rights for your user
sudo dpkg-reconfigure davfs2

# Check if the script called with a username (Linuxaccount)
if [ ! $1 ]; then
LOGEDIN_USER = whoami
    sudo usermod -aG davfs2 $LOGEDIN_USER 
else
    sudo usermod -aG davfs2 $1
fi

# now create the mountpoint ie. mkdir /media/MagentaCLOUD
# check if the mountpoint already exist
if [ ! -d $MOUNTPOINT ]; then

# check if the script called with a special mountpoint.
# if not use the standart mountpoint set in this script above as the variable MOUNTPOINT
    if [ ! $2 ]; then
        mkdir $MOUNTPOINT
    else
    sudo mkdir /media/$2
    fi
fi
# now we have to edit the fstab file.
# open the file and include at the end of the file the followed line without the quotation marks.
# "https://webdav.magentacloud.de /media/MagentaCLOUD/ davfs user,noauto,rw 0 0"
cat fstabmnt>>/etc/fstab
sudo nano /etc/fstab

# https://webdav.magentacloud.de weiler.torsten@t-online.de p6ZHd9EtQDFsypg
cat davfs-secrets>>/etc/davfs2/secrets
sudo nano /etc/davfs2/secrets