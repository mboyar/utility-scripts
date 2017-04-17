#!/bin/bash

#title: refactorizer - find&replace tool
#author: mboyar@enbia
#date: 17/04/17 16:12:08
#contact: muratboyar(at)gmail.com

expFrom=$1
expTo=$2

[[ -z $expTo || -z $expFrom ]] && echo "usage: $(basename $0) <expression from> <expression to>" && exit 1

grep -rl $expFrom  . | while read i
	do
		sed s/$expFrom/$expTo/g $i >$i.new
                mv $i.new $i
	done
