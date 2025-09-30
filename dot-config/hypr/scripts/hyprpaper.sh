#!/bin/bash

if ! pidof -x "hyprpaper"; then
      hyprpaper
else
      pkill -x "hyprpaper"
fi
