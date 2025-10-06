#!/bin/bash

if ! pidof -x "alacritty"; then
    alacritty -T fzf -e tmux new -A -s hanni
else
    pkill -x "alacritty"
fi
