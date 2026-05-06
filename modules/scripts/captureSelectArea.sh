#!/usr/bin/env bash
grim -g "$(slurp)" /tmp/screenshot.png
convert /tmp/screenshot.png -shave 1x1 /tmp/screenshot.png
swappy -f /tmp/screenshot.png
notify-send "Screenshot" "Area captured" -u low
