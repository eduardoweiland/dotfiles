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
echo Volume: $volume% >&2

# Since notify-send can't replace notifications, let's go directly to the bus
# https://askubuntu.com/questions/161851/how-do-i-use-notify-send-to-immediately-replace-an-existing-notification
notify_send() {
    summary="$1"
    body="$2"
    icon="$3"
    replace="${4:-0}"

    gdbus call --session \
        --dest org.freedesktop.Notifications \
        --object-path /org/freedesktop/Notifications \
        --method org.freedesktop.Notifications.Notify \
        -- "" "$replace" "$icon" "$summary" "$body" "[]" "[]" "int32 2000" \
        | grep -oP ' \K\d+'
}

# Still has some race conditions, but it's better than with original notify-send
if [ ! -z "$1" ]; then
    nid="$(dirname $(readlink -f $0))/.notify_id"
    notify_send "Volume" "Volume is set to $volume%" "$icon_path" $(<$nid) > $nid
fi
