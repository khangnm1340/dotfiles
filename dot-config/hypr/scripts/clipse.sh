#!/bin/bash

if pgrep -x clipse >/dev/null; then
  pkill -x clipse
else
  # ghostty --title=clipse -e clipse
  alacritty --title=clipse -e clipse
fi
