#!/bin/bash

#title: wlistquerier
#author: mboyar@aort
#date: 10/10/16 12:37:09
#contact: muratboyar(at)gmail.com

cd /home/murat/prj-freelance/aort/dicom/source-porting/findscu-outdir

for i in $(ls /usr/share/dcmtk/wlistqry/wlistqry*); do
	dump2dcm $i usr-share-dcmtk-$(basename $i .dump).dcm
done

for i in $(ls usr-share-dcmtk-wlistqry*dcm); do
	findscu -v -W -aec DICOMSERVER_CO_UK -aet AORT_RD www.dicomserver.co.uk 104 $i -X;
	for j in $(ls rsp*dcm); do
		filename=_$(basename $j .dcm)-from-$(echo $i | awk -F "-" '{print $4}')
		mv $j $filename
		dcm2xml $filename $(basename $filename .dcm).xml
	done
done

