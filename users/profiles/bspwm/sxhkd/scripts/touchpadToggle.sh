#!/bin/sh
# Toggle touchpad status
# Using libinput and xinput
ASSETS_DIR="$HOME/.config/dunst/assets/notification"
# Use xinput list and do a search for touchpads. Then get the first one and get its name.
device="$(xinput list | grep -P '(?<= )[\w\s:]*(?i)(touchpad|synaptics)(?-i).*?(?=\s*id)' -o | head -n1)"

# If it was activated disable it and if it wasn't disable it
if [[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" == "1" ]]
then
  xinput disable "$device"
  notify-send -a "Touchpad Manager" -i "$ASSETS_DIR/touchpad_disabled.png" "Touchpad Disabled" "Touchpad input has been disabled."
else
  xinput enable "$device"
  notify-send -a "Touchpad Manager" -i "$ASSETS_DIR/touchpad_enabled.png" "Touchpad Enabled" "Touchpad input has been enabled."
fi