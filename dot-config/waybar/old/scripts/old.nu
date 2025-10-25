 let job_id = ( job spawn {
    mut time = ("5min 25sec" | into duration)
    let temp_file = "/home/pampam/dotfiles/dot-config/waybar/scripts/temp_time.txt"
    if (($temp_file | path exists) == false ) { touch $temp_file }
    while $time >= 0sec {
        $"($time)" | save -f ($temp_file)
        sleep 1sec
        $time = $time - 1sec
    }
    rm $temp_file
})

job list | where id == $job_id | get pids | flatten | to text | save -f "/home/pampam/.config/waybar/scripts/job_pid.txt" 

 "05:25" | parse "{min}:{sec}" | $"($in.min.0 | into int)min ($in.sec.0| into int)sec"
let raw_time = "5min 25sec"
mut time = ($raw_time | into duration)
while $time >= 0sec {
        $time | into string | if ($in | str contains "sec") {parse "{min}min {sec}sec"} else { parse "{min}min" }
         | each {
      let m = ($in.min | fill -a r -c '0' -w 2)
      let s = ($in.sec | fill -a r -c '0' -w 2)
      $"($m):($s)" }
     | save -f "/home/pampam/dotfiles/dot-config/waybar/scripts/count_down_time.txt"
     
        sleep 1sec
        $time = $time - 1sec
    }
