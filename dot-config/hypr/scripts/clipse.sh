#!/bin/bash

if ! pidof -x "clipse"; then
      ghostty --title=clipse -e clipse
else
      pkill -x "clipse"
fi
