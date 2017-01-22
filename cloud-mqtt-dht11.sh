#!/bin/bash

#title: cloud-mqtt-dht11
#author: mboyar@<wherever>
#date: 22/01/17 15:56:21
#contact: muratboyar(at)gmail.com



stdbuf -oL python Adafruit_Python_DHT/examples/AdafruitDHT.py 11 4 | while read temp;
do
	mosquitto_pub -h $SERVER -p $PORT -t temp/analog -u $KULL -P $PASS -m "$temp"

done
