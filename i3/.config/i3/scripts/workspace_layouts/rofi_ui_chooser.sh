#!/bin/bash

# Step 1: Choose laptop or desk
MODE=$(echo -e "laptop\ndesk" | rofi -dmenu -p "Select Mode:")

# Check if mode is selected
if [ -z "$MODE" ]; then
    echo "No mode selected, exiting..."
    exit 1
fi

# Step 2: Choose normal, project, or spotify based on the selected mode
LAYOUT=$(echo -e "normal\nproject\nspotify" | rofi -dmenu -p "Select Layout for $MODE:")

# Check if layout is selected
if [ -z "$LAYOUT" ]; then
    echo "No layout selected, exiting..."
    exit 1
fi

# Step 3: Execute the corresponding script
~/.config/i3/scripts/workspace_layouts/$MODE/$LAYOUT.sh
