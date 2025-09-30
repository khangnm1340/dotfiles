ls ~/Downloads/wallpapers/stay-in-da-middle | each {|it|
    hyprctl hyprpaper preload $"($it.name)"
}
