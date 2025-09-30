#!/bin/bash

# Get the current color scheme
current_scheme=$(gsettings get org.gnome.desktop.interface color-scheme)

# Toggle the color scheme
if [ "$current_scheme" == "'prefer-light'" ]; then
      gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
      notify-send "Switched to dark mode."
elif [ "$current_scheme" == "'prefer-dark'" ]; then
      gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
      notify-send "Switched to light mode."
else
      notify-send "Error: Unknown color scheme '$current_scheme'."
fi

exit 0
