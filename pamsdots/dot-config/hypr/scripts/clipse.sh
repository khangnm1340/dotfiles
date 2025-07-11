#!/bin/bash

if ! pidof -x "clipse"; then
      ghostty --font-size=15 --title=clipse -e clipse
else
      pkill -x "clipse"
fi
