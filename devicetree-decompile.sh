#!/bin/bash

#title: devicetree-decompile
#author: mboyar@epiqur
#date: 18/11/18 22:17:00
#contact: muratboyar(at)gmail.com

cd /boot/dtb/ #for pine64. change in order to yours one.

for i in $(ls *.dtb);
do
	dtc -I dtb -O dts -o $(basename $i .dtb).dts $i;
done
