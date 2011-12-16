#! /bin/sh
# written by: jjgomera

#str=`echo '\033[01;32m29'`

# replace the 4 "cal |" with "cal -m |" to have the week start on Monday

DATE=`date | awk -F" " '{print $3}'`
DJS=`date +%-d`

case "$1" in
mes) #miesac rok
cal | head -n1
;;
dni) #dni tygodnia
cal | awk 'NR==2 {print}'
;;
pasado) #kalendarz
cal | grep -v '[a-zA-Z]' | grep '[0-9]' | sed '/'${DJS}'/s/\b'$DJS'\b/${color red}'$DJS'${color}/' | awk '{print "${goto 50}"$0}'
;;
esac
