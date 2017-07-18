#!/bin/bash

#title: wc-sources
#author: mboyar@<wherever>
#date: 18/07/17 17:04:29
#contact: muratboyar(at)gmail.com

sum=0; for i in $(find . -name *.cpp); do j=$(wc -l $i | awk -F ' ' '{printf $1}'); ((sum=sum+j)) ; done; echo $sum
