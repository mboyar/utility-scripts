#!/bin/bash

[[ $# == 0 ]] && echo "Set an interface as arg" && exit

func_bc(){
	echo "obase=2; $1" | bc
	#echo $1
}

IP=$(./get-ip.sh $1)

IP_BIN_1=$(echo $IP | awk -F '.' '{printf $1}')
IP_BIN_2=$(echo $IP | awk -F '.' '{printf $2}')
IP_BIN_3=$(echo $IP | awk -F '.' '{printf $3}')
IP_BIN_4=$(echo $IP | awk -F '.' '{printf $4}')


echo $(func_bc $IP_BIN_1).$(func_bc $IP_BIN_2).$(func_bc $IP_BIN_3).$(func_bc $IP_BIN_4)


