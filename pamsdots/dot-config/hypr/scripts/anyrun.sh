#!/bin/bash

if ! pidof -x "anyrun"; then
      anyrun
else
      pkill -x "anyrun"
fi
