#!/bin/bash
prefix="temp="
suffix="'C"
gpu=$(/opt/vc/bin/vcgencmd measure_temp)
cpu=$(</sys/class/thermal/thermal_zone0/temp)
gpu_temp=${gpu#$prefix}
gpu_temp=${gpu_temp%$suffix}
cpu_temp=$((cpu/1000))
echo -e "{\"cpu\":"$cpu_temp", \"gpu\":$gpu_temp}"
