#!/bin/bash
# installapu.sh
# This installs the auto patch update for ubuntu 
# Make sure to install this as root only

if [ "$(whoami)" != "root" ]; then
  echo "Script must be run as root:"
  exit -1
fi

# Check to see if smartnode directory already exist
if [ -d ~/apu ]
then
    echo "~/apu Directory already exist"
    printf "Press Ctrl+C to cancel or Enter to clean up and reinstall:"
    read IGNORE
fi

# Create the directory in root home
cd

rm -r apu
mkdir apu

# Change the directory to ~/apu/
cd ~/apu/

# Download the appropriate scripts
wget https://rawgit.com/controllinghand/ubuntuautopatchupdate/master/apu.sh

# Create a cronjob for updating the OS patches for ubuntu every 3 days
(crontab -l 2>/dev/null | grep -v -F "apu/apu.sh" ; echo "0 0 */3 * * ~/apu/apu.sh" ) | crontab -
chmod 0700 ./apu.sh

# Cleanup old installapu
rm ~/installapu.s*

