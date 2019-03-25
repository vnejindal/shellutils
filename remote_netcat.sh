#remote execution of any command given any list of IPs to ssh to

set -x
#for line in `cat vmqs.txt`;  do ssh -i jenkins_tf.pem ubuntu@${line} 'sudo vmq-admin cluster show'; echo;  done
#for line in `cat vmqs.txt`;  do ssh -i jenkins_tf.pem ubuntu@${line} 'sudo netstat -anp | grep -e '192.168.174.166' -e '192.168.174.132''; echo;  done
#for line in `cat vmqs.txt`;  do ssh -i jenkins_tf.pem ubuntu@${line} 'sudo vmq-admin metrics show'; echo;  done

#!/bin/bash

IPS="192.168.174.202 192.168.174.71 192.168.174.238 192.168.174.231 192.168.174.207"

for IP in ${IPS}
do
        echo Scanning: ${IP}
        ./remote_exec.sh ${IP} netstat -an | grep $1
done


