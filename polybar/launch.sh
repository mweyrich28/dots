#!/bin/bash

# # Terminate already running bar instances
# killall -q polybar
#
# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#
# # Get all monitor names
# monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)
#
# # Function to start polybar on a monitor
# launch_polybar() {
#     if [[ $1 == "HDMI-1" ]]; then
#         MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
#     elif [[ $1 == "eDP-1" ]]; then
#         MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
#     else
#         MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
#     fi
# }
#
# # Launch polybar on all connected monitors
# for m in $monitors; do
#     launch_polybar "$m"
# done


killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get all monitor names and resolutions
monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)
resolutions=$(xrandr --query | grep " connected" | sed -n 's/.* \([0-9]\+x[0-9]\+\).*/\1/p')

# Function to start polybar only on the laptop monitor or when not using the CIP setup
launch_polybar() {
    resolution=$(xrandr --query | grep "$1 connected" | sed -n 's/.* \([0-9]\+x[0-9]\+\).*/\1/p')

    if [[ $1 == "eDP-1" ]]; then
        # Always launch polybar on laptop's internal display
        MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
    elif [[ $resolution == "3840x2160" ]]; then
        # Do not launch polybar on 4K CIP external monitors
        echo "Skipping polybar on external CIP monitor: $1 ($resolution)"

        # Adjust format and reload bg
        xrandr --output HDMI-A-0 --mode 1920x1080
        nitrogen --restore
    else
        # For external monitors (at home), launch polybar
        MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
    fi
}

# Launch polybar on all connected monitors
for m in $monitors; do
    launch_polybar "$m"
done
