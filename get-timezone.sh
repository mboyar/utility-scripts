#!/bin/bash

for i in $(ls -r /usr/share/zoneinfo/); do diff /usr/share/zoneinfo/$i /etc/localtime >/dev/null 2>&1; ret=$?; [[ $ret == 0 ]] && echo "Bingo: $i" ; done
