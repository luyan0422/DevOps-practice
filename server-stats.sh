#!/usr/bin/bash
echo "server stats"
cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "CPU Usage: " 100-$1}'

echo "memory usage"
free

echo "disk usage"
df -h

echo "top 5 cpu usage"
ps aux --sort -%cpu | head -5

echo "top 5 memory usage"
ps aux --sort -%mem | head -5
