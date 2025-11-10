#!/bin/bash

# Get the current color scheme
current_scheme=$(gsettings get org.gnome.desktop.interface color-scheme)
conf="$HOME/.config/qt6ct/qt6ct.conf"
dark="/usr/share/qt6ct/colors/darker.conf"
light="/usr/share/qt6ct/colors/simple.conf"

# Toggle the color scheme
if [ "$current_scheme" == "'prefer-light'" ]; then
      gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
      # sed -i "s|^color_scheme_path=.*|color_scheme_path=$dark|" "$conf"
      notify-send "Switched to dark mode."
elif [ "$current_scheme" == "'prefer-dark'" ]; then
      gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
      # sed -i "s|^color_scheme_path=.*|color_scheme_path=$light|" "$conf"
      notify-send "Switched to light mode."
else
      notify-send "Error: Unknown color scheme '$current_scheme'."
fi

exit 0
