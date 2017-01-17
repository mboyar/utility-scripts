#!/bin/bash

#title: raspi-unzip-dd
#author: mboyar@<wherever>
#date: / /201x
#contact: muratboyar(at)gmail.com

IMG_PATH=$1
DEV_PATH=$2

[[ -z $IMG_PATH || -z $DEV_PATH ]] && echo "Usage: $(basename $0) <image path> <device path>" && exit 1

[[ ! -b $DEV_PATH || $DEV_PATH == *"sda"* ]] && echo "Device file does not point a regular block device" && exit 1

echo "Testing zip file..."
unzip -t $IMG_PATH; retUzp=$?

sudo su

if [[ $retUzp == 0 ]]; then

	echo "Unzipping and burning $IMG_PATH to $DEV_PATH"
	unzip -p $IMG_PATH | dd of=$DEV_PATH bs=4M &
fi

while((1)); do
	sleep 5;
	kill -SIGUSR1 $(pidof dd); retSig=$?
	[[ $retSig != 0 ]] && break
	clear
done

echo "Finished. Eject sdcard and reinsert to see what you write to disk."
