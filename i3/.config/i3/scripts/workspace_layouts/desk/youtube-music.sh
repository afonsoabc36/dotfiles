#!/bin/bash

# Function to wait for a window with a given class name
wait_for_window_in_workspace() {
    app_class="$1"
    workspace="$2"
    # sleep 0.1

    while true; do
        if i3-msg -t get_tree | grep "name\":\"${workspace}\".*class\":\"${app_class}" ; then
            # echo "Found $app_class in workspace $workspace" | tee -a "$LOGFILE"
            sleep 0.5 # Just in case
            break
        fi
        # echo "Not Found $app_class in workspace $workspace" | tee -a "$LOGFILE"
        sleep 0.1  # Check every 100ms
    done
}

# Open WezTerm in workspace 1 and attach to (or create) a tmux session
i3-msg "workspace 1; move workspace to output DP1; exec wezterm"
wait_for_window_in_workspace "org.wezfurlong.wezterm" "1"
wezterm cli spawn -- bash -c "tmux"

# Open Chrome in workspace 2 (Primary monitor)
i3-msg "workspace 2; exec google-chrome"
wait_for_window_in_workspace "Google-chrome" "2"

# Open youtube-music in workspace 7 (Secondary monitor)
i3-msg "workspace 7; move workspace to output eDP1; exec youtube-music"
wait_for_window_in_workspace "com.github.th_ch.youtube_music" "7"

# Focus back to workspace 2
i3-msg "workspace 2"

