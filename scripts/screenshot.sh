#!/bin/bash

gnome-screenshot -a -f /tmp/screenshot_temp.png
xclip -selection clipboard -t image/png -i /tmp/screenshot_temp.png
