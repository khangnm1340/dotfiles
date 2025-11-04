#!/bin/bash
file="$1"
# Use the same socket path Hyprpaper uses
socket="${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.hyprpaper.sock"

# Preload and set the wallpaper directly through hyprpaper’s socket
{
  echo "preload $file"
  sleep 0.05
  echo "wallpaper ,contain:$file"
} | socat - UNIX-CONNECT:"$socket"
