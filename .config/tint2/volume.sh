#!/usr/bin/sh
# based on https://petermolnar.net/hacking-tint2-panel-weather-cpu-temperature-and-volume-executors/

if [ "$1" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5% &> /dev/null
elif [ "$1" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5% &> /dev/null
elif [ "$1" == "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

mixer_output=$(amixer sget Master)

volume=$(grep -Pom1 '\d+(?=%)' <<< $mixer_output)
status=$(grep -Pom1 'off|on'   <<< $mixer_output)

icon_dir=/usr/share/icons/Flat-Remix-Blue-Dark/status/symbolic

if [ "$status" == "off" ]; then
    icon=muted
elif [ $volume -gt 0 ] && [ $volume -lt 34 ]; then
    icon=low
elif [ $volume -gt 33 ] && [ $volume -lt 67 ]; then
    icon=medium
else
    icon=high
fi

icon_path=$icon_dir/audio-volume-$icon-symbolic.svg

echo $icon_path

# @TODO: discover a way to replace existing notification
#if [ ! -z "$1" ]; then
#    notify-send -t 2000 -i $icon_path -c device "Volume" "Volume is set to $volume%"
#fi
