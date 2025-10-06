# #!/usr/bin/env bash
# set -euo pipefail
#
# PIDFILE="/tmp/countdown_nu.pid"
OUTFILE="/home/pampam/dotfiles/dot-config/waybar/scripts/count_down_time.txt"
# SCRIPT="/home/pampam/dotfiles/dot-config/waybar/scripts/timer.nu"
#
# # helper: is pid running?
# is_running() {
#   [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null
# }
#
# if is_running; then
#   # Stop it
#   pid="$(cat "$PIDFILE")"
#   kill "$pid" 2>/dev/null || true
#   # wait briefly for it to die
#   sleep 0.15
#   rm -f "$PIDFILE"
#   # ensure Waybar shows the default icon immediately
#   printf '🦦\n' > "$OUTFILE"
#   exit 0
# else
#   # Start it detached and record PID
#   # Use nohup + setsid so the process won't be killed when Waybar finishes
#   nohup nu -c "source '$SCRIPT'" >/dev/null 2>&1 &
#   echo $! > "$PIDFILE"
#   disown %1 2>/dev/null || true
#   exit 0
# fi

#!/usr/bin/env bash
if systemctl --user is-active --quiet countdown.service; then
  systemctl --user stop countdown.service

  printf '🦦' > "$OUTFILE"
else
  systemctl --user start countdown.service
fi
