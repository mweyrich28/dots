#!/usr/bin/env bash
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi"

# Options
shutdown="⏻ shutdown"
reboot=" restart"
lock=" lock"
suspend="󰤄 sleep"
logout=" logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		shutdown now
        ;;
    $reboot)
		reboot
        ;;
    $lock)
        betterlockscreen --lock &
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        awesome-client "awesome.quit()"
        ;;
esac
