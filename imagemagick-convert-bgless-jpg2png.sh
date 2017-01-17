#!/bin/bash

#title: imagemagick-convert-bgless-jpg2png
#author: mboyar@<wherever>
#date: 14/10/16 18:16:59
#contact: muratboyar(at)gmail.com

# make it with arg
convert cayenne-logo.jpg -fuzz 20% -transparent white cayenne-logo-bgless.png
