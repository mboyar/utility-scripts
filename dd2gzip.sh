#!/bin/bash

#title: dd2gzip
#author: mboyar@<wherever>
#date: 14/10/16 22:10:14
#contact: muratboyar(at)gmail.com


dd if=/dev/sdb bs=1M | gzip > raspi-jessie-baslangic-egitimi-102016.img.gz
