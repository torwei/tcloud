#tcloud MagentaCLOUD v 0.1

This is a little Shell script to get the t-online Cloud service MagentaCLOUD work as Network drive.

The Cloud Space will be added via davfs2 so that you can access him the same way as an HDD in your Network environment. Easily access your cloud.

At the moment the Script is built and tested on Linux Mint 19.3 but it should work on every Debian based Distribution.

There are only x Steps to get the Cloudspace act as Network drive.

    1. Download the Code
    1. Extract the zip file
    1. Change the rights of the Script as executable
    1. Start the Script (there are two ways to execute)
    1. Spend me a beer (or two! ;-)

After downloading open a shell ctrl+alt+T

    cd ~/Download
    unzip mount_magentacloud.zip
    cd mount_magentacloud
    chmod +x magentacloud.sh

    Build the Script more interaktive
    Implement Support for other Distros

The content of the file *fstab_include* should be included in the original fstab file under */etc/fstab* on the Linux Maschine where we want include the Cloud as Networkdrive. It would be automatically done when you execute magentacloud.sh script.

 
