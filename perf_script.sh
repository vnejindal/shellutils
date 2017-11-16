#!/bin/bash
#			Private=`cat /proc/$pid/smaps | grep -e "^Private:" | awk '{print $2}'| paste -sd+ | bc `
#			rss=`cat /proc/$pid/smaps | grep -e "^Rss:" | awk '{print $2}'| paste -sd+ | bc `

#print "%s,%s,%s,%s,%s\n",ts,$1,$9,$10,$12 > logfile
#have to put trap : using CTRL-C abort process before writing to the output file(logfile)
# the I/O library buffers data and writes it in blocks of 512 (or more) bytes at a time
#so process it terminated before the bytes are written to file
			#Pss=$(echo $(cat /proc/$pid/smaps) | grep -e "^Pss:" | awk '{print $2}'| paste -sd+ | bc )

done=0
cpu=0
mem=0
rss_top=0
time_t=0
while [ $done -eq 0 ]
do
	if ps -ef | grep -i "nuance_oem_vqa_app_mt" |grep -v grep > /dev/null
	then
	done=1
	else
	echo "sleep 1 sec"
	sleep 1
	fi
done
	nuance=$(ps -ef | grep -i "nuance_oem_vqa_app_mt" |grep -v grep |  awk '{print $2}')
	top -p $nuance -b -d10 | ( trap "" 2; awk '
	{
	#	if($1 == "PID")
		{
			command="date +%T";
			command | getline ts
			close(command);
		}
		if ( $12 == "NUANCE_OEM_VQA_" )
		{
			cpu=$9;
			mem=$10;
			rss_top=$6;
			printf "time=%s cpu=%s mem=%s rss=%s\n",ts,cpu,mem,rss_top > "logfile"
			#printf "time=%s cpu=%s mem=%s Rss_top=%s Pss=%s Prvt=%s rss=%s\n",ts,$9,$10,$6,$PSS,$Private,$rss > "logfile"
		}
	}'
	)
	
