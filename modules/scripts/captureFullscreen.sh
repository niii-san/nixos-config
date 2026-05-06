#!/usr/bin/env bash
grim /tmp/fullscreen.png && swappy -f /tmp/fullscreen.png
notify-send "Screenshot" "Full screen captured" -u low
