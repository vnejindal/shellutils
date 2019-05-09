#!/bin/bash
instance_dns=$1
set -x
for i in $(echo $instance_dns | sed "s/,/ /g")
do
echo "$i"
echo "getting logs from ${i}"
scp -r -oStrictHostKeyChecking=no -i jenkins_tf.pem ubuntu@${i}:/var/log/vernemq  ./${i}.log

done

#for (( j=0; j<${#array}; j++ ));
#do
#echo "getting logs from ${array[$j]}"
#netstat -s >>${array[$j]}.log
#sed -i 's/4096 32768 65536/4096 65536 131072/g' /etc/sysctl.conf
#service kafkaconnect restart
#done

