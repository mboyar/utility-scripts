#!/bin/ash

#title: lsof for embedded linux, if there is no standart lsof util, use this.
#author: mboyar@<wherever>
#date: 02/10/17 15:04:48
#contact: muratboyar(at)gmail.com

#echo $#
#echo $@
#exit

if [ "$#" != 1 ]; then

	echo "usage: $(basename $0) <search exp>"
	exit 1
fi

arg=$1

for i in $(ls /proc/); do
	test 0 -lt $i 2>/dev/null;
	if [ $? -eq 0 ]; then
		ls -laht /proc/$i/fd | grep $arg 2>/dev/null 1>&2;
		
		if [ $? -eq 0 ]; then
			more /proc/$i/cmdline; echo;
			ls -laht /proc/$i/fd | grep $arg
			echo /////////////;
		fi
	fi
done
