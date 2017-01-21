#!/bin/bash

#title: mosquitto_client
#author: mboyar@makerhane
#date: 20/01/17 16:31:28
#contact: muratboyar(at)gmail.com


mosquitto_pub -h m21.cloudmqtt.com \
		-p 15575 \
		-t "inceir/sat" \
		-u emre \
		-P 123456 \
		-m "{\"d\" : {\"sicaklik\" : $celsius, \"basarim_orani_1wire\" : \"%$success\" }}" \
		-d
		#-i "d:8xiws4:enbia-opi-dev-1:enbia-opi-dev-1-a" 

#mosquitto_sub -h m21.cloudmqtt.com -p 15575 -t iot-2/evt/evt-1/fmt/json -u murat -P 123456
