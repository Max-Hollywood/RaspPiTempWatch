#!/bin/bash
# Author: Max Hollywood
#
# Websites used to build this script:
# https://www.cyberciti.biz/faq/linux-find-out-raspberry-pi-gpu-and-arm-cpu-temperature-command/
# https://linuxhint.com/raspberry_pi_temperature_monitor/
# https://www.tutorialkart.com/bash-shell-scripting/bash-date-format-options-examples/

printf "%-15s%13s\n" "TIMESTAMP" "TEMP(C)"
printf "%20s\n" "----------------------------"

while true
do
	temp=$(</sys/class/thermal/thermal_zone0/temp)
	timestamp=$(date +'%a %F %H:%M')
	colour="\e[1;33m%8s\e[m"
	printf "%-15s" "$timestamp" 
	printf "$colour\n" "$((temp/1000))c"
	echo "$(date)" "$((temp/1000))c" >> temps.txt
	sleep 60
done

