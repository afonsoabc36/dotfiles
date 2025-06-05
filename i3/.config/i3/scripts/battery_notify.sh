#!/bin/bash

CHARGING=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | rg -c 'state:\s*charging')
BATTERY_PERCENTAGE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | rg -o 'percentage:\s+(\d+)%' | rg -o '\d+')

if [ "${CHARGING:-0}" -lt 1 ]; then
    if [ $BATTERY_PERCENTAGE -le 13 ]; then
        notify-send --urgency=critical 'LOW BATTERY' 'Go get your charger now!'
    elif [ $BATTERY_PERCENTAGE -le 25 ]; then
        notify-send --urgency=normal --expire-time=10000 'WARNING' 'Low battery'
    fi
fi
