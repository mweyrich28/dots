# #!/bin/bash
#
# launch_polybar() {
#     if [[ $1 == "eDP" ]]; then
#         MONITOR=$1 polybar --reload --quiet top -c ~/.config/polybar/config.ini &
#     fi
# }
#
# # Get the list of connected monitors
# monitors=$(xrandr --query | grep " connected" | awk '{print $1}')
#
# # Launch polybar only on the laptop screen
# if echo "$monitors" | grep -q "^eDP$"; then
#     launch_polybar "eDP"
# fi

#!/bin/bash
killall -q polybar
sleep 1

# Get the list of connected monitors
monitors=$(xrandr --query | grep " connected" | awk '{print $1}')

# Launch polybar with delays
if echo "$monitors" | grep -qw "eDP"; then
    MONITOR="eDP" polybar --reload --quiet top -c ~/.config/polybar/config.ini &
    sleep 0.5
fi

if echo "$monitors" | grep -qw "DisplayPort-1"; then
    MONITOR="DisplayPort-1" polybar --reload --quiet top -c ~/.config/polybar/config_external.ini &
    sleep 0.5
fi

if echo "$monitors" | grep -qw "HDMI-A-0"; then
    MONITOR="HDMI-A-0" polybar --reload --quiet top -c ~/.config/polybar/config_external.ini &
fi
