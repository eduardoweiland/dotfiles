#!/bin/sh

has_nvidia=$(command -v nvidia-smi)

echo '...'

while true
do
    player=$(playerctl metadata -f '🎜 {{status}} {{title}} - {{artist}}')

    cpu_usage=$(S_COLORS=never mpstat --dec=0 -u | tail -n 1 | awk '{ print 100 - $12 "%" }')
    #cpu_temp=$(awk '{ print $1 / 1000 "°C" }' /sys/class/thermal/thermal_zone2/temp)
    cpu_temp=$(sensors | grep -Pio 'package[^+]*\+\K\S*')

    gpu='no data'
    if [ $has_nvidia ]
    then
        gpu=$(nvidia-smi -q -d UTILIZATION,TEMPERATURE \
            | awk '/Gpu/{ usage=$3 } /GPU Current Temp/{ temp=$5 } END { print usage "% " temp "°C" }')
    fi

    ram=$(free -b \
        | awk '/Mem/{ printf "%.1f / %.1f GiB (%.1f%%)\n", $3 / 1073741824, $2 / 1073741824, 100 * $3 / $2 }')

    date=$(date +'%a %d %b %H:%M')

    echo -e "$player • CPU $cpu_usage $cpu_temp • GPU $gpu • RAM $ram • $date"
    sleep 5
done
