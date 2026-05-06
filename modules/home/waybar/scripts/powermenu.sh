#!/usr/bin/env bash
pgrep -x rofi > /dev/null && killall rofi && exit 0

LOCK="   Lock"
SUSPEND="   Sleep"
LOGOUT="   Logout"
REBOOT="   Reboot"
SHUTDOWN="   Shutdown"

chosen=$(printf "$LOCK\n$SUSPEND\n$LOGOUT\n$REBOOT\n$SHUTDOWN" \
  | rofi -dmenu \
         -p "" \
         -theme "$HOME/.config/waybar/scripts/powermenu.rasi" \
         -no-custom)

case "$chosen" in
  "$LOCK")     hyprlock ;;
  "$SUSPEND")  systemctl suspend ;;
  "$LOGOUT")   hyprctl dispatch exit ;;
  "$REBOOT")   systemctl reboot ;;
  "$SHUTDOWN") systemctl poweroff ;;
esac
