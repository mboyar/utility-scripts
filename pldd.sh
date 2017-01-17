#!/bin/bash

#title: pldd
#author: mboyar@<wherever>
#date: 01/10/16 19:20:21
#contact: muratboyar(at)gmail.com

arg=$1

[[ $arg == "" ]] && "ldd which command?" && exit 1

ldd $(whereis $arg | awk -F " " '{print $2}')
