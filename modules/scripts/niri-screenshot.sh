#!/usr/bin/env bash
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"

case "$1" in
  screen) niri msg action screenshot-screen ;;
  *)      niri msg action screenshot ;;
esac

sleep 1
swappy -f "$(ls -t "$SCREENSHOT_DIR"/*.png | head -1)"
