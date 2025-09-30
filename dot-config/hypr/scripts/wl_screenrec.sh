#!/bin/bash

output_dir="$HOME/Pictures/ScreenRecord"
audio_device="alsa_output.pci-0000_00_1f.3.analog-stereo.monitor"
filename_format=$(date +%Y%m%d_%H%M%S)
full_filename="${output_dir}/${filename_format}.mp4" # Assuming .mp4 as the default extension
process_name="wl-screenrec"

if ! pidof -x "$process_name"; then
      # Process is not running, start it
      notify-send "Screen Recording" "Started recording"
      wl-screenrec --audio --audio-device "$audio_device" -f "$full_filename"
else
      # Process is running, stop it
      notify-send "Screen Recording" "Ended recording"
      pkill -x "$process_name"
fi
