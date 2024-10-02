#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get all monitor names
monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)

# Function to start polybar on a monitor
launch_polybar() {
    if [[ $1 == "HDMI-1" ]]; then
        MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
    elif [[ $1 == "eDP-1" ]]; then
        MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
    else
        MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
    fi
}

# Launch polybar on all connected monitors
for m in $monitors; do
    launch_polybar "$m"
done
