#!/bin/bash

# Kill all existing polybar instances
polybar-msg cmd quit

# Wait for them to fully exit
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# Check if eDP1 is connected
eDP1_connected=$(xrandr | grep -w "eDP1" | grep -w "connected")

# Check if DP1 is connected
DP1_connected=$(xrandr | grep -w "DP1" | grep -w "connected")

# If only eDP1 is connected
if [[ -n "$eDP1_connected" && -z "$DP1_connected" ]]; then
    MONITOR=eDP1 polybar --reload bottom &

# If both eDP1 and DP1 are connected
elif [[ -n "$eDP1_connected" && -n "$DP1_connected" ]]; then
    MONITOR=DP1 polybar --reload toph &
    MONITOR=eDP1 polybar --reload bottom &

# If only DP1 is connected (optional case)
elif [[ -z "$eDP1_connected" && -n "$DP1_connected" ]]; then
    MONITOR=DP1 polybar --reload toph &
fi
