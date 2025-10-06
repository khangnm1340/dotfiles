let raw_time = "10sec"
def to_mmss [raw_time] {
  let parts = ($raw_time | str trim | split row ' ')

  # detect tokens
  let has_hr = ($parts | where { $in | str contains 'hr' } | length) > 0
  let has_min = ($parts | where { $in | str contains 'min' } | length) > 0
  let has_sec = ($parts | where { $in | str contains 'sec' } | length) > 0

  # parse numeric values (default 0)
  let hours = if $has_hr { (($parts | where { $in | str contains 'hr' }).0 | str replace 'hr' '' | into int) } else { 0 }
  let minutes = if $has_min { (($parts | where { $in | str contains 'min' }).0 | str replace 'min' '' | into int) } else { 0 }
  let seconds = if $has_sec { (($parts | where { $in | str contains 'sec' }).0 | str replace 'sec' '' | into int) } else { 0 }

  # total minutes (include hours)
  let total_minutes = ($hours * 60) + $minutes

  # pad to two digits (leading zero)
  let mm = ($total_minutes | into string | fill --alignment right --character '0' --width 2)
  let ss = ($seconds | into string | fill --alignment right --character '0' --width 2)

  $"($mm):($ss)"
}

mut time = ($raw_time | into duration)
let count_down_file = "/home/pampam/dotfiles/dot-config/waybar/scripts/count_down_time.txt"
while $time >= 0sec {
      $time | into string | to_mmss $in
     | save -f $count_down_file
     
        sleep 1sec
        $time = $time - 1sec
    }

notify -t "Go do something else to reset your mind" --summary "Your time is up." -i /home/Ext4Pam/Pictures/NewjeansPics/112-GeNE7vxWgAAEEa6.jpg
"🦦" | save -f $count_down_file
