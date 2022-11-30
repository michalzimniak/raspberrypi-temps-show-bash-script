#!/bin/bash
cpu=$(</sys/class/thermal/thermal_zone0/temp)
g=$(vcgencmd measure_temp)
gpu=(${g//=/ })
echo "$(date) @ $(hostname)"
echo "-------------------------------------------"
echo "GPU => ${gpu[1]}"
echo "CPU => $((cpu/1000))'C"
cat /proc/stat |grep cpu |tail -1|awk '{print ($5*100)/($2+$3+$4+$5+$6+$7+$8+$9+$10)}'|awk '{print "CPU Usage: " 100-$1}'
