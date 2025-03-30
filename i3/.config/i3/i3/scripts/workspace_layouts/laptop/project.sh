#!/bin/bash

# Function to wait for a window with a given class name
wait_for_window() {
    app_class="$1"
    while ! i3-msg -t get_tree | grep -q "\"class\":\"$app_class\""; do
        sleep 0.2  # Check every 100ms
    done
}

# Open WezTerm in workspace 1 and wait for it
i3-msg "workspace 1; exec wezterm"
wait_for_window "org.wezfurlong.wezterm"
wezterm cli spawn -- bash -c "tmux"

# Open Chrome in workspace 2 and wait for it
i3-msg "workspace 2; exec google-chrome"
wait_for_window "Google-chrome"

# Open Discord in workspace 9 and wait for it
i3-msg "workspace 9; exec discord"
wait_for_window "discord"
sleep 6

# Focus back to workspace 2
i3-msg "workspace 2"

