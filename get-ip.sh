#!/bin/bash

[[ $# == 0 ]] && echo "Give an interface name as argument" && exit

i=0; ifconfig $1 | while read line; do ((i++)); [[ $i == 2 ]] && echo $line | awk -F ' ' '{print $2}' | awk -F ':' '{print $2}' && break;done
