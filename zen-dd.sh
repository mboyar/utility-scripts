#!/bin/bash

#title: zen-dd
#author: mboyar@makerhane
#date: 20/01/17 09:47:45
#contact: muratboyar(at)gmail.com

# mkdir ######################

imgDir="../img"

[[ -d $imgDir ]] || mkdir $imgDir

#

WINDOW_TITLE="Zen-DD Uygulamasi"

# in #########################

ddInFile=$(zenity --entry \
	--title=$WINDOW_TITLE \
	--text="Lutfen kaynak/source disk-aygit-dosyasi veya imaj adi girin: " \
	--entry-text "sd<X><N> veya mmcblk<N>p<N> formatinda"\
	#--hide-text \
	)

ddInPath=""

if [[ $ddInFile == *.img ]]; then

	echo "ooo fake imajlar filannn :)"
	ddInPath="$imgDir/$devFile"

else
	#echo $ddInFile
	ddInPath="/dev/$ddInFile"
	
	if [[ ! -b $ddInPath  && $ddInFile != "zero" ]]; then
            
            echo "Bu dosya dev altında bir diski gostermiyor.."
            exit 1
	
	fi # kısa-devre sekli de kullanilabilir
fi

# manuel kodlama buraya kadar buradan sonra git clone..

# out #########################

ddOutFile=$(zenity --entry \
	--title=$WINDOW_TITLE \
	--text="Lutfen hedef/destination disk-aygit-dosyasi veya imaj adi girin:" \
	--entry-text "sd<X><N> veya mmcblk<N>p<N> formatinda"\
	#--hide-text \
	)

ddOutPath=""

if [[ $ddOutFile == "sda" ]]; then

	echo "Lutfen bindiginiz dali kesmeyin :)"
	exit 1

elif [[ $ddOutFile == *.img ]]; then

	echo "ooo fake imajlar filannn :)"
	ddOutPath="$imgDir/$ddOutFile"

else
	#echo $ddOutFile
	ddOutPath="/dev/$ddOutFile"
	
	if [[ ! -b $ddOutPath ]]; then
            
            echo "Bu dosya dev altında bir diski gostermiyor.."
            exit 1
	
	fi # kısa-devre sekli de kullanilabilir
fi

# burn/backup ####################

(
    while((1)); do
        kill -SIGUSR1 $(pidof dd) >/dev/null 2>&1
        sleep 1
    done
) &
threadPid=$!

dd if=$ddInPath of=$ddOutPath bs=1K count=1000000 2>&1 | zenity --text-info \
                                                                --title=$WINDOW_TITLE \
                                                                --auto-scroll \
                                                                --width 300 \
                                                                --height 150

#echo threadPid: $threadPid
kill -SIGKILL $threadPid

#TODO
#dd de kill prosesine SIGKILL yollasın DONE