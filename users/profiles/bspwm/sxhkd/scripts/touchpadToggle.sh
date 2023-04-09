#!/bin/sh
# Toggle touchpad status
# Using libinput and xinput
ASSETS_DIR="$HOME/.config/dunst/assets/notification"
# Use xinput list and do a search for touchpads. Then get the first one and get its name.
id_touchpad="$(xinput -list | grep Touchpad | cut -d= -f2 | cut -d'[' -f1)"
is_enabled="$(xinput list-props $id_touchpad | grep -P '.*Device Enabled.*\K.(?=$)' -o)"
# If it was activated disable it and if it wasn't disable it
if [[ $is_enabled == "1" ]]
then
  xinput --set-prop ${id_touchpad} "Device Enabled" 0
  notify-send -a "Touchpad Manager" -i "$ASSETS_DIR/touchpad_disabled.png" "Touchpad Disabled" "Touchpad input has been disabled."
else
  xinput --set-prop ${id_touchpad} "Device Enabled" 1
  notify-send -a "Touchpad Manager" -i "$ASSETS_DIR/touchpad_enabled.png" "Touchpad Enabled" "Touchpad input has been enabled."
fi