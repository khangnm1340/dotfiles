
#!/bin/bash

if pgrep -x hypridle >/dev/null; then
  pkill -x hypridle
  notify-send "Stop suspending computer when idle"
else
  uwsm-app -- hypridle >/dev/null 2>&1 &
  notify-send "Now suspending computer when idle"
fi
