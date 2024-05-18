#!/bin/bash

gnome-screenshot -a -f /tmp/screenshot_temp.png
sleep 5
xclip -selection clipboard -t image/png -i /tmp/screenshot_temp.png
