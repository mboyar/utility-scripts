#title: basic accuweather API usage
#author: mboyar@asis
#date: 08/08/17 10:44:46

import urllib2
import json

# learn current url from http://apidev.accuweather.com/developers/samples
# Remember to get your own API key. This sample is using a temporary key not suitable for production.
URL_CITY='http://apidev.accuweather.com/currentconditions/v1/321510.json?language=en&apikey=hoArfRosT1215'

response = urllib2.urlopen(URL_CITY)
wf_van = json.load(response)
tempCelsius = wf_van[0]['Temperature']['Metric']['Value']
weatherStatus = wf_van[0]['WeatherText']

print("Weather conditions for Van/Turkey:")
print("Temp: " + str(tempCelsius) + " C")
print("Status: " + str(weatherStatus))
