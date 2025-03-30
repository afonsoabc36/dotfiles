#!/bin/bash

# Check if DP-1 is connected
if xrandr | grep -w "DP1 connected"; then
    # External display is connected
    # xrandr --output eDP-1 --mode 2160x1440 --pos 1920x0 --rotate normal \
    #        --output HDMI-1 --off \
    #        --output DP-1 --primary --mode 1920x1080 --pos 0x134 --rotate normal \
    #        --output HDMI-2 --off
    xrandr --output eDP1 --mode 2160x1440 --pos 1920x0 --rotate normal --output DP1 --primary --mode 1920x1080 --pos 0x172 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
else
    # Laptop-only mode
    xrandr --output eDP1 --primary --mode 2160x1440 --pos 0x0 --rotate normal --output DP1 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
fi
