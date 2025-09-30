#!/bin/bash

if ! pidof -x "hyprsunset"; then
      hyprsunset --temperature 2500 -g 70
else
      pkill -x "hyprsunset"
fi
