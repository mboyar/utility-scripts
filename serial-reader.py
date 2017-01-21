#!/usr/bin/python

#title: serial-reader.py
#author: mboyar@<wherever>
#date: 21/01/17 21:07:07
#contact: muratboyar(at)gmail.com


import serial
import time

arduinoTTY = serial.Serial("/dev/ttyUSB0")

while True:
	print(arduinoTTY.readline())
	time.sleep(1)

#arduinoTTY.close()

#TODO
#serial icin try/catch break
