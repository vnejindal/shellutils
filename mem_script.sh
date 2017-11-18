#!/bin/bash

set +x
echo 'Usage: ./mem_script.sh <pid of process> <sleep time>' 
echo 'Logs will be created in logs directory...'

HOSTNAME=`hostname`
PROCESS_ID="$1"
SLEEP_TIME=$2


TS="`date| sed -e 's/ /_/g'`"
LOG_FILE="log/${HOSTNAME}_${PROCESS_ID}_memstats_${TS}.txt"


#exec > >(tee -i $LOG_FILE)
#exec 2>&1

mkdir -p log

echo '=========================================' >> $LOG_FILE
echo $HOSTNAME >> $LOG_FILE

while true
do
    if ps -ef | grep -i $PROCESS_ID |grep -v grep > /dev/null
    then
	pid=$PROCESS_ID
  	Pss=$(cat /proc/$pid/smaps | grep -e "^Pss:" | awk '{print $2}'| paste -sd+ | bc)
  	Pvt=$(cat /proc/$pid/smaps | grep -e "^Private:" | awk '{print $2}'| paste -sd+ | bc)
  	Rss=$(cat /proc/$pid/smaps | grep -e "^Rss:" | awk '{print $2}'| paste -sd+ | bc)
  	ts=$(date +"%T");
  	printf "time=%s Pss=%s rss=%s Pvt=%s\n" $ts $Pss $Rss $Pvt >> $LOG_FILE
  	sleep $SLEEP_TIME
    else
    echo "sleep $SLEEP_TIME sec"
    sleep $SLEEP_TIME
    fi
done


