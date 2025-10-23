#!/usr/bin/env bash

paste -d " " <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
