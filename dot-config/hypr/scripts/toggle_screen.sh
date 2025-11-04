
#!/usr/bin/env bash

# Check if DPMS is currently off
if hyprctl monitors | rg "dpmsStatus: 1"; then
    hyprctl dispatch dpms off
else
    hyprctl dispatch dpms on
fi
