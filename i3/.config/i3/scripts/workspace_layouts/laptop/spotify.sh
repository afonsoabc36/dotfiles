#!/bin/bash

# LOGFILE="/tmp/i3_script.log"
# echo "Starting script at $(date)" | tee -a "$LOGFILE"

# Function to wait for a window with a given class name in a specific workspace
wait_for_window_in_workspace() {
    app_class="$1"
    workspace="$2"
    # sleep 0.1

    while true; do
        if i3-msg -t get_tree | grep "name\":\"${workspace}\".*class\":\"${app_class}" ; then
            # echo "Found $app_class in workspace $workspace" | tee -a "$LOGFILE"
            sleep 0.1 # Just in case
            break
        fi
        # echo "Not Found $app_class in workspace $workspace" | tee -a "$LOGFILE"
        sleep 0.1  # Check every 100ms
    done
}

# Open WezTerm in workspace 1 and wait for it
i3-msg "workspace 1; exec wezterm" | tee -a "$LOGFILE"
wait_for_window_in_workspace "org.wezfurlong.wezterm" "1"
wezterm cli spawn -- bash -c "tmux"
# echo "Opened tmux" | tee -a "$LOGFILE"

# Open Chrome in workspace 2 and wait for it
i3-msg "workspace 2; exec google-chrome"
wait_for_window_in_workspace "Google-chrome" "2"

# Open WezTerm in workspace 7 for Spotify and wait for it
i3-msg "workspace 7; exec wezterm"
wait_for_window_in_workspace "org.wezfurlong.wezterm" "7"
wezterm cli spawn --pane-id 2 -- bash -c "spotify_player"
# echo "Opened spotify_player" | tee -a "$LOGFILE"

# echo "Going to sleep" | tee -a "$LOGFILE"
# sleep 1
# echo "Slept" | tee -a "$LOGFILE"
# Focus back to workspace 2
i3-msg "workspace 2"

