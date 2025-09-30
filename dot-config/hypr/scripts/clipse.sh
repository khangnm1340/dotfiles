#!/bin/bash

if ! pidof -x "clipse"; then
      alacritty -T clipse -e clipse
else
      pkill -x "clipse"
fi
