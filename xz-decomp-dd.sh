#!/bin/bash

#title: xz-decomp-dd
#author: mboyar@<wherever>
#date: / /201x
#contact: muratboyar(at)gmail.com


xz -dcvvv Raspbian_For_OrangePiplus_v0_8_0.img.xz | sudo dd of=/dev/sdb bs=1M
