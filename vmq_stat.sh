#Script to check vmq stats 
#usage: ./s <vmq ip>

#!/bin/bash

./s $1 sudo watch -n1 '"sar -P ALL 9 1 | grep all | head -1; echo; ss -s | head -3; iptables -nvL -Z | head -4 ; echo; free -h; echo; vmq-admin metrics show | grep -e publish -e cluster -e split -e queue | sort; echo; hostname"'

