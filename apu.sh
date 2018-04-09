#!/bin/bash
# apu.sh
SHELL=/bin/bash
PATH=$PATH:/usr/sbin
# This script updates OS patches
exec > >(tee -i /root/apu/apuoutput.log)
apt-get update
apt-get -y upgrade