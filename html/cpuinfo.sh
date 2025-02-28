#!/bin/bash

while : 
do
        time=$(date '+%Y-%m-%d %H:%M:%S')
        cpuUsage=$(top -bn2 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'|awk '{print "CPU Usage: " 100-$8 "%"}')
        # cpuUsage=$[100 - $(vmstat 1 2 | tail -1|awk '{print $15}')]
        echo "<meta http-equiv='refresh' content='1'> <h1 style='text-align:center'>Time: $time <br> CPU Usage: $cpuUsage </h1>" > /usr/local/nginx/html/cpuinfo.html
done
