#!/bin/bash

if ! pidof -x "waybar"; then
      waybar
else
      pkill -x "waybar"
fi
