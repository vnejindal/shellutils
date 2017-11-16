#!/bin/bash
while true
do
    if ps -ef | grep -i "nuance_oem_vqa_app_mt" |grep -v grep > /dev/null
    then
	pid=$(pidof NUANCE_OEM_VQA_APP_MT)
  	Pss=$(cat /proc/$pid/smaps | grep -e "^Pss:" | awk '{print $2}'| paste -sd+ | bc)
  	Pvt=$(cat /proc/$pid/smaps | grep -e "^Private:" | awk '{print $2}'| paste -sd+ | bc)
  	Rss=$(cat /proc/$pid/smaps | grep -e "^Rss:" | awk '{print $2}'| paste -sd+ | bc)
  	ts=$(date +"%T");
  	printf "time=%s Pss=%s rss=%s Pvt=%s\n" $ts $Pss $Rss $Pvt >> "logfile_mem"
  	sleep 5
    else
    echo "sleep 1 sec"
    sleep 1
    fi
done


