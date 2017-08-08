#!/bin/bash

#title: netcat-json
#author: mboyar@<wherever>
#date: 08/08/17 14:13:35
#contact: muratboyar(at)gmail.com


netcat -l 7777 | jq '.VLDSNG."task-info".stopCurrent.status'
