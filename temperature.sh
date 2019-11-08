#!/bin/bash

# Author:	Max Hollywood
# Version:	1.1
# Changes:	1.0 - initial script
#		1.1 - add todo, version info, variables
#		1.2 - colours
#		1.3 - arguments
#		1.4 - add quotes, more colours
#
# Usage:
#	./temperature.sh
#		Prints out temps every 60 seconds and writes to
#		~Documents/temps.txt.
#	./temperature.sh [options]
#		-w [f]	write only to a [non-default] file
#		-p	print only
#		-h [n]	only output high temperatures above the threshold
#		-s	output system heavy processes with high temperatures
#		-t n	specify how often in seconds the script should run
#
# TODO:
#	Style: have temperature ranges have coloured output
#	Output: have a passable argument to decide whether to write or print
#	Output: have option/argument to only process high temperatures
#	Output: have checking time a passable argument
#	Output: have argument to specify an output file
#	System: have option to grab the CPU/Memory heavy processes running
#
# Websites used to build this script:
#	https://www.cyberciti.biz/faq/linux-find-out-raspberry-pi-gpu-and-arm-cpu-temperature-command/
#	https://linuxhint.com/raspberry_pi_temperature_monitor/
#	https://www.tutorialkart.com/bash-shell-scripting/bash-date-format-options-examples/

printf "%-15s%13s\n" "TIMESTAMP" "TEMP(C)"
printf "%20s\n" "----------------------------"

# Normal temperature range is 0 to WARM
# < WARM		= COL_NORMAL
# WARM - HOT	= COL_WARM
# > HOT			= COL_HOT
WARM="45"
HOT="55"

# TODO: add coloured output codes
COL_NORMAL="\e[1;32m%8s\e[0m"
COL_WARM="\e[1;33m%8s\e[0m"
COL_HOT="\e[1;31m%8s\e[0m"
colour="$COL_NORMAL"

# TODO: add options

# Sleep time in seconds (argument or default is 60)
SLP="60"

# Output file (argument or default is ~/Documents/temps.txt)
# No quotes?
OUTFILE=~/Documents/temps.txt

while true
do
	temp="$(( $(</sys/class/thermal/thermal_zone0/temp) / 1000))"

	timestamp="$(date +'%a %F %H:%M')"

	if [[ "$temp" -ge "$HOT" ]] ; then
		colour="$COL_HOT"
	elif [[ "$temp" -ge "$WARM" ]] ; then
		colour="$COL_WARM"
	else
		colour="$COL_NORMAL"
	fi

	# TODO: have coloured output
	# TODO: have options
	# TODO: get heavy processes

	printf "%-15s" "$timestamp" 
	printf "$colour\n" "$((temp))c"

	echo "$(date) $((temp))c" >> "$OUTFILE"

	sleep "$SLP"
done

