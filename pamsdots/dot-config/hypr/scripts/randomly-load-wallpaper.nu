let files = (ls ~/Downloads/wallpapers/stay-in-da-middle/ | get name)
let prev = ($env.PREV_WP? | default "")
mut choice = ($files | get (random int 0..($files | length)))
if $choice == $prev {
    $choice = ($files | get (random int 0..($files | length)))
}
let PREV_WP = $choice
hyprctl hyprpaper wallpaper $",($choice)"
