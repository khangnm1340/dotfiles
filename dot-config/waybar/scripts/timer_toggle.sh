
#!/usr/bin/env sh
# ~/.local/bin/timer_toggle [seconds]
# If a timer is running -> stop it.
# If no timer -> start countdown_worker in background (detached).
PIDFILE=/home/pampam/.config/nushell/custom_scripts/count-down.pid
WORKER=/home/pampam/.config/waybar/scripts/timer_backend.sh
secs="${1:-1500}"   # optional argument; default 1500s (25m)

# if pidfile exists and process alive -> stop it
if [ -f "$PIDFILE" ]; then
  pid="$(cat "$PIDFILE" 2>/dev/null || true)"
  if [ -n "$pid" ] && kill -0 "$pid" 2>/dev/null; then
    kill "$pid" 2>/dev/null || true
    # give it a moment
    sleep 0.2
    if kill -0 "$pid" 2>/dev/null; then
      kill -9 "$pid" 2>/dev/null || true
    fi
    rm -f "$PIDFILE" /home/pampam/.config/nushell/custom_scripts/count-down.txt
    exit 0
  else
    # stale pidfile
    rm -f "$PIDFILE" 2>/dev/null || true
  fi
fi

# start worker detached so Waybar isn't blocked
# use setsid to fully detach
setsid "$WORKER" "$secs" >/dev/null 2>&1 &
# no need to write pid here — worker writes its own pidfile
exit 0
