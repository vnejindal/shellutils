#close processes with connections in TCP CLOSE_WAIT state with any specific port 
#Source: https://www.shellhacks.com/kill-tcp-connections-close-wait-state/
netstat -anp |\
grep ':80 ' |\
grep CLOSE_WAIT |\
awk '{print $7}' |\
cut -d \/ -f1 |\
grep -oE "[[:digit:]]{1,}" |\
xargs kill
