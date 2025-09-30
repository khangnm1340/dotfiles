#!/bin/bash

if ! pidof -x "btop"; then
      ghostty --font-size=15 --title=clipse -e clipse
else
      pkill -x "clipse"
fi
