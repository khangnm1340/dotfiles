let files = (ls ~/Downloads/wallpapers/stay-in-da-middle/ | get name)
let prev_file = $"($env.HOME)/dotfiles/dot-config/hypr/scripts/prev_wall.txt"

# load previous choice from file if it exists
let prev = ( cat $prev_file )

mut choice = ""
while $choice == "" or $choice == $prev {
    let idx = (random int 0..(($files | length ) - 1))
    $choice = ($files | get $idx)
}

# save current choice for next run
$choice | save -f $prev_file
hyprctl hyprpaper wallpaper $",($choice)"
