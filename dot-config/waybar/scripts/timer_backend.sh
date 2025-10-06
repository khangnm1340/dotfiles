
#!/usr/bin/env sh
# ~/.local/bin/countdown_worker <seconds>
# writes one line HH:MM:SS to COUNT_OUT every second, cleans up when done or on TERM

COUNT_OUT=/home/pampam/.config/nushell/custom_scripts/count-down.txt
PIDFILE=/home/pampam/.config/nushell/custom_scripts/count-down.pid
secs="${1:-1500}"   # default 25m (1500s) if no arg supplied

mkdir -p "$(dirname "$COUNT_OUT")"

# ensure pidfile shows this worker's pid, so toggle can find it
echo "$$" > "$PIDFILE"

cleanup() {
  rm -f "$PIDFILE" "$COUNT_OUT"
  exit 0
}
trap 'cleanup' INT TERM HUP

start="$(( $(date +%s) + secs ))"

while [ "$start" -ge "$(date +%s)" ]; do
  remaining="$(( start - $(date +%s) ))"
  # format HH:MM:SS using GNU date
  printf '%s\n' "$(date -u -d "@$remaining" +%H:%M:%S)" > "$COUNT_OUT"
  sleep 1
done

# final 00:00:00 then cleanup
printf '%s\n' "00:00:00" > "$COUNT_OUT"
sleep 1
cleanup
