#!/bin/bash

#title: file-recoverier
#author: mboyar@<wherever>
#date: 15/12/16 15:11:41
#contact: muratboyar(at)gmail.com

#http://askubuntu.com/questions/604311/how-to-restore-data-after-running-rm

#sudo foremost -t jpg -i /dev/sda5 -o /recovery/data
#foremost adımı sonrası kolay browse etmek icin

for((j=5000; j<10000; j=j+100)); do
	for i in $(ls -S . | head -n $j | tail -n 100); do
		cp $i ../sil/;
	done;
	sleep 10;
	rm ../sil/*;
done
