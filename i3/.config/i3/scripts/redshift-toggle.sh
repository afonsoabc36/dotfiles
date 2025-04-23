#!/bin/bash

# Toggle file to track state
TOGGLE_FILE="/tmp/redshift_running"
TEMP=4250

if [ -f "$TOGGLE_FILE" ]; then
    redshift -x
    rm "$TOGGLE_FILE"
else
    redshift -O "$TEMP"
    echo "on" > "$TOGGLE_FILE"
fi
