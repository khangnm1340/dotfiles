STEAM_COMPAT_CLIENT_INSTALL_PATH="$HOME/.local/share/Steam" STEAM_COMPAT_DATA_PATH="$HOME/.local/share/Steam/steamapps/compatdata/3658110" PROTON_LOG=1 PROTON_NO_ESYNC=1 PROTON_NO_FSYNC=1 DXVK_HUD=1 "$HOME/.local/share/Steam/steamapps/common/Proton - Experimental/proton" run "/home/pampam/Documents/external_drives/drive1/Games/Steins_Gate_0/Game.exe" &> ~/proton_manual_output.txt
nu
$LD_PRELOAD
env | egrep -i 'LD_PRELOAD|LD_LIBRARY_PATH|PROTON|WINE|STEAM' || true
env | egrep -i 'LD_PRELOAD|LD_LIBRARY_PATH|PROTON|WINE|STEAM' || true
env | grep -E -i 'LD_PRELOAD|LD_LIBRARY_PATH|PROTON|WINE|STEAM' || true
env -u LD_PRELOAD steam
env -u LD_PRELOAD steam
# show suspicious env vars
env | egrep -i 'LD_PRELOAD|LD_LIBRARY_PATH|PROTON|WINE|STEAM' || true
btop
env -u LD_PRELOAD steam
nu
nu
nu
source ~/.bashrc
path
$PATH
nu
ghostty
nu
mkdir -p ~/.config/environment.d
cat > ~/.config/environment.d/10-local-bin.conf <<'EOF'
PATH=$HOME/.local/bin:$PATH
EOF

reboot
#!/usr/bin/env bash
set -euo pipefail
# change excludes or search path as you like
results=$(fd -E 'in*' -E 'com.zamaudio*' -t f /usr/share/applications -x basename -s .desktop {})
#!/usr/bin/env bash
set -euo pipefail
# change excludes or search path as you like
results=$(fd -E 'in*' -E 'com.zamaudio*' -t f /usr/share/applications -x basename -s .desktop {})
env | sort > env_normal.txt
alacritty -T fzf -e bash -ic 'env | sort > /tmp/env_fzf.txt; fd -E "in*" -E "com.zamaudio*" . /usr/share/applications -x basename {} | fzf --reverse | xargs gtk-launch'
nu
alacritty -T fzf -e bash -ic 'selection=$(fd -E "in*" -E "com.zamaudio*" -t f /usr/share/applications -x basename -s .desktop {} | fzf --height=40% --reverse --prompt="App> "); if [ -n "$selection" ]; then gtk-launch "$selection"; else echo "Cancelled"; fi; read -n1 -rsp "Press any key to close..."'
alacritty -T fzf -e bash -ic 'selection=$(fd -E "in*" -E "com.zamaudio*" . /usr/share/applications -x basename {} | fzf --height=40% --reverse --prompt="App> "); if [ -n "$selection" ]; then gtk-launch "$selection"; else echo "Cancelled"; fi; read -n1 -rsp "Press any key to close..."'
fzf | xargs echo
fzf | xargs cat
nu
hyperfine --prepare 'pkill -x ghostty || true; sleep 0.15'   './ghostty-start-timer.sh "ghostty" 8'   --runs 10
hyperfine --prepare 'pkill -x ghostty || true; sleep 0.15'   './ghostty-benchmark.sh "ghostty" 8'   --runs 10
hyperfine --prepare 'pkill -x ghostty || true; sleep 0.15'   './ghostty-start-timer.sh "ghostty" 8'   --runs 10
nu
(export LC_ALL=C.UTF-8; comm -13 <(pacman -Qlq | sed 's,/$,,' | sort) <(find /etc /usr /opt -path /usr/lib/modules -prune -o -print | sort))
awk '/%(NAME|PROVIDES)%/{flag=1;next}/^$/{flag=0}flag{ printf "%s\t%s\n", FILENAME, $0}' /var/lib/pacman/local/*/desc  | sed 's%/var/lib/pacman/local/\(.*\)/desc%\1%g' | sort -k2 | uniq -Df1 | column -etN Package,Provides
awk '/%(NAME|PROVIDES)%/{flag=1;next}/^$/{flag=0}flag{ printf "%s\t%s\n", FILENAME, $0}' /var/lib/pacman/local/*/desc  | sed 's%/var/lib/pacman/local/\(.*\)/desc%\1%g' | sort -k2 | uniq -Df1 | column -etN Package,Provides
nu
./timer_toggle
./timer_toggle.sh 
./timer_toggle.sh 
if [ -s \"$HOME/.config/nushell/custom_scripts/count-down.txt\" ]; then head -n1 \"$HOME/.config/nushell/custom_scripts/count-down.txt\"; else printf '🦦'; fi
if [ -s \"$HOME/.config/nushell/custom_scripts/count-down.txt\" ]; then head -n1 \"$HOME/.config/nushell/custom_scripts/count-down.txt\"; else printf '🦦'; fi
if [ -s /home/pampam/.config/nushell/custom_scripts/count-down.txt ]; then cat /home/pampam/.config/nushell/custom_scripts/count-down.txt; else printf '🦦'; fi
if [ -s /home/pampam/.config/nushell/custom_scripts/count-down.txt ]; then cat /home/pampam/.config/nushell/custom_scripts/count-down.txt; else printf '🦦'; fi
if [ -s \"$HOME/.config/nushell/custom_scripts/count-down.txt\" ]; then head -n1 \"$HOME/.config/nushell/custom_scripts/count-down.txt\"; else printf '🦦'; fi
if [ -s \"$HOME/.config/nushell/custom_scripts/count-down.txt\" ]; then head -n1 \"$HOME/.config/nushell/custom_scripts/count-down.txt\"; else printf '🦦'; fi
nu
while true; do printf '%s\r' "$(date +%H:%M:%S:%N)"; done
start=$(date +%s)
while true; do     time="$(($(date +%s) - $start))";     printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"; done
seconds=20
start="$(($(date +%s) + $seconds))"
while [ "$start" -ge `date +%s` ]; do     time="$(( $start - `date +%s` ))";     printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"; done
nu
command
command -v anyrun
for f in $(grep -liE 'lsp-plugins|jack|audio|alsa|pulseaudio|pipewire' /usr/share/applications/*.desktop); do   base=$(basename "$f");   printf '%s\n' "[Desktop Entry]" "Hidden=true" > ~/.local/share/applications/"$base"; done
nu
GTK_DEBUG=interactive anyrun
GTK_DEBUG=interactive anyrun
GTK_DEBUG=interactive anyrun
nu
export NEWT_COLORS='
root=,black
border=white,black
title=white,black
window=white,blue
textbox=white,black
button=black,white
listbox=white,black
actlistbox=black,white
checkbox=white,black
actcheckbox=black,white
'
winapps-setup
bash <(curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh)
bash <(curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh)
winapps-setup --user --uninstall.
winapps-setup --user --uninstall
bash <(curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh)
[200~winapps-setup~
winapps-setup
winapps-setup --user --uninstall
winapps-setup
bash <(curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh)
nu
bash <(curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh)
bash <(curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh)
nu
podman unshare --rootless-netns xfreerdp3 /u:"Khang" /p:"12345678" /v:127.0.0.1 /cert:tofu
nu
Your Windows Password
nu
winapps manual C:\Users\MyWindowsUser\AppData\Local\Programs\Zalo\Zalo.exe
winapps manual "C:\Users\MyWindowsUser\AppData\Local\Programs\Zalo\Zalo.exe"
winapps manual 'C:\Windows\System32\notepad.exe'
winapps manual "C:\Users\MyWindowsUser\AppData\Local\Programs\Zalo\Zalo.exe"
winapps manual "C:\Users\MyWindowsUser\AppData\Local\Programs\Zalo\Zalo.exe"
docker exec -it WinApps powershell -Command "Start-Process 'C:\Users\MyWindowsUser\AppData\Local\Programs\Zalo\Zalo.exe' -ErrorAction Stop"
docker exec -it WinApps /bin/sh -c 'which powershell || which pwsh || echo "no-powershell"; ls -la /usr/bin /bin /usr/local/bin 2>/dev/null | head -n 40'
nu
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
nu
./autofocus.sh &
btop
pkill 38441
nu
paste <(jack_meter -n -f 4 "Level Meter:output_FL")       <(jack_meter -n -f 4 "Level Meter:output_FR") > latest.txt
paste <(jack_meter -n -f 4 "Level Meter:output_FL")       <(jack_meter -n -f 4 "Level Meter:output_FR") | while IFS= read -r line; do     printf "%s\n" "$line" > latest.txt; done
paste <(jack_meter -n -f 4 "Level Meter:output_FL")       <(jack_meter -n -f 4 "Level Meter:output_FR") | while IFS= read -r line; do     printf "%s\n" "$line" > latest.txt; done
paste <(jack_meter -n -f 4 "Level Meter:output_FL")       <(jack_meter -n -f 4 "Level Meter:output_FR") | while IFS= read -r line; do     printf "%s\n" "$line" > latest.txt; done
paste <(jack_meter -n -f 4 "Level Meter:output_FL")       <(jack_meter -n -f 4 "Level Meter:output_FR") | while IFS= read -r line; do     printf "%s\n" "$line" > latest.txt; done
paste <(jack_meter -n -f 1 "Level Meter:output_FL")       <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do     printf "%s\n" "$line" > latest.txt; done
paste <(jack_meter -n -f 1 "Level Meter:output_FL")       <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do     printf "%s\n" "$line" > latest.txt; done
paste 
\<(jack_meter -n -f 10 "Level Meter:output_FL")
\<(jack_meter -n -f 10 "Level Meter:output_FR")
nu
paste <(jack_meter -n -f 10 "Level Meter:output_FL")       <(jack_meter -n -f 10 "Level Meter:output_FR") 
nu
paste 
<(jack_meter -n -f 10 "Level Meter:output_FL")       
<(jack_meter -n -f 10 "Level Meter:output_FR") 
nu
nu
MONITOR=$(pactl list sources short | awk '/monitor/ {print $2; exit}')
if [ -z "$MONITOR" ]; then   echo "No monitor source found. Try: pactl list sources short";   exit 1; fi
ffmpeg -hide_banner -f pulse -i "$MONITOR"   -af "asetnsamples=4410,astats=metadata=1:reset=1" -f null - 2>&1   | awk -F= '/lavfi.astats.Overall.Peak_level/ {printf("%.2f\n",$2)}'
ffmpeg -hide_banner -f pulse -i "$MONITOR"   -af "asetnsamples=4410,astats=metadata=1:reset=1" -f null - 2>&1   | awk -F= '/lavfi.astats.Overall.Peak_level/ {printf("%.2f\n",$2)}'
ffmpeg -hide_banner -f pulse -i "$MONITOR"   -af "asetnsamples=4410,astats=metadata=1:reset=1" -f null - 2>&1   | awk '/pts_time/ {t=$3} /lavfi.astats.Overall.Peak_level/ {print t, $2}'
ecasound -i alsa,default -o null -ev
yay -S ecasound
secasound -i alsa,default -o null -ev
ecasound -i alsa,default -o null -ev
ecasound -i alsa:EasyEffectsSink -o null -ev
jack_meter -n "EasyEffects" -p
yay -S jack_meters
yay -S jackmeters
yay -S jackmeter
jack_meter -n "EasyEffects" -p
jack_meter -n -f 10 "EasyEffects:out_1"
jack_lsp
yay -S jack_lsp
yay -S jack-example-tools
jack_lsp
jack_meter -n -f 10 "EasyEffects:out_1"
jack_meter -n -f 10 "Easy Effects Sink:playback_FL" "Easy Effects Sink:playback_FR"
jack_meter -n -f 10 "Limiter:output_FL" "Limiter:output_FR"
jack_meter -n -f 10 "Limiter:output_FL" "Limiter:output_FR"
jack_meter -n -f 10 "Level Meter:output_FL" "Level Meter:output_FR"
paste <(jack_meter -n -f 10 "Level Meter:output_FL")       <(jack_meter -n -f 10 "Level Meter:output_FR")
L=$(jack_meter -n -f 2 "Level Meter:output_FL" | tail -n 1)
R=$(jack_meter -n -f 2 "Level Meter:output_FR" | tail -n 1)
echo "{\"text\": \"🎧 ${L}/${R} dB\"}"
paste <(jack_meter -n -f 10 "Level Meter:output_FL")       <(jack_meter -n -f 10 "Level Meter:output_FR")
paste <(jack_meter -n -f 10 "Level Meter:output_FL")       <(jack_meter -n -f 10 "Level Meter:output_FR")
nu
paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
notify-send "hi"
reboot
paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
nu
paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
tmux
paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
tmux new-session -d -s mysession 'paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
'
tmux a
tmux list
nu
paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
./jack-levels.sh 
nu
paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
nu
[200~paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done~
paste <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
./jack-levels.sh &
pkill 9397
nu
paste -d " " <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
nu
nu
paste -d " " <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
peak
  python - <<'PY'
  from datasets import load_dataset
  load_dataset("glue", "sst2")
  PY





  python - <<'PY'
  from datasets import load_dataset
  load_dataset("glue", "sst2")
  PY

nu
peak
peak
# kernel & initrd candidates
ls -l /vmlinuz-* /boot/vmlinuz-* /boot/initramfs-* /boot/initrd* 2>/dev/null
# find the block device that's mounted as root, then its PARTUUID (recommended)
ROOTDEV=$(findmnt -n -o SOURCE /)
echo "root device: $ROOTDEV"
blkid -s PARTUUID -o value "$ROOTDEV"
# or get UUID:
blkid -s UUID -o value "$ROOTDEV"
blkid -s UUID -o value "$ROOTDEV"
blkid
ss -ltnp | grep -E ':3389\b' || sudo ss -ltnp | grep -E ':3389\b'
docker logs -f WinApps
reboot
peak
peak
peak
peak
sudo fd /home/$USER/.local /usr /usr/local /etc /opt /var -iname '*ghostty*' 2>/dev/null | sort | tee /tmp/ghostty-files.txt
nu
sudo find /root/.local /home/$USER/.local /usr /usr/local /etc /opt /var -iname '*ghostty*' 2>/dev/null | sort | tee /tmp/ghostty-files.txt
nu
btop
mkdir -p ~/.config/gtk-4.0
cat > ~/.config/gtk-4.0/gtk.css <<'EOF'
/* ===== GTK4 quick test override — FORCE OPAQUE + NO SHADOWS =====
   Purpose: temporary test only. Forces headerbars/tabs/popovers/menus
   to be fully opaque and removes box-shadows/borders so we can see
   if the halo comes from theme-transparency/shadows.
   Reversible: delete or rename this file to revert.
*/

/* Target common top-level chrome widgets: headerbars, toolbars, notebooks (tabs), popovers, menus, tooltips */
headerbar,
.header-bar,
toolbar,
.notebook,
.notebook tab,
.notebook tab *,
/* popover/menu related */
popover,
.menu,
.popup,
.tooltip,
.popover,
.menu * {
  /* Force fully opaque background so compositor can't blur through */
  background-color: rgba(250,250,250,1) !important;
  /* Remove shadows/borders that could be sampled by the blur */
  box-shadow: none !important;
  border: none !important;
  outline: none !important;
  /* Keep text readable */
  color: inherit !important;
}

/* A dark-theme alternative if you use dark GTK themes */
@media (prefers-color-scheme: dark) {
  headerbar, toolbar, popover, .menu, .tooltip, .notebook {
    background-color: rgba(18,18,18,1) !important;
  }
}
EOF

GTK_DEBUG=interactive nautilus
nautilus
nautilus
sudo mkdir -p /etc/iwd
echo -e "[General]\nEnableNetworkConfiguration=true" | sudo tee /etc/iwd/main.conf
sudo systemctl restart iwd
nmtui
nu
sudo mkdir -p /etc/NetworkManager/conf.d
echo -e "[device]\nwifi.backend=iwd" | sudo tee /etc/NetworkManager/conf.d/wifi_backend.conf
sudo systemctl restart NetworkManager
impala
nmtui
nmtui
sudoedit /etc/NetworkManager/conf.d/wifi_backend.conf
nu
nmcli -t -f active,ssid,signal dev wifi | grep '^yes'
btop
nu
peak
peak
peak
peak
#!/bin/bash
if pgrep -x hypridle >/dev/null; then   pkill -x hypridle;   notify-send "Stop locking computer when idle"; else   uwsm-app -- hypridle >/dev/null 2>&1 &   notify-send "Now locking computer when idle"; fi
#!/bin/bash
if pgrep -x hypridle >/dev/null; then   pkill -x hypridle;   notify-send "Stop locking computer when idle"; else   uwsm-app -- hypridle >/dev/null 2>&1 &   notify-send "Now locking computer when idle"; fi
nu
cp -r ./fcitx5/src/* ~/.local/share/fcitx5/themes
btop
print "🦦" > $count_down_file
echo "🦦" > $count_down_file
echo "🦦" > /home/pampam/dotfiles/dot-config/waybar/scripts/count_down_time.txt
nu
nu
git clone https://github.com/catppuccin/fcitx5.git
mkdir -p ~/.local/share/fcitx5/themes/
cp -r ./fcitx5/src/* ~/.local/share/fcitx5/themes
bash
hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle
hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle
hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle
hyprctl dispatch setprop "address:$(hyprctl activewindow -j | jq -r '.address')" opaque toggle
nu
peak
sudo ln -s /usr/share/applications/in.lsp_plug*.desktop /usr/local/share/applications/
sudo sed -i '/^NotShowIn=/ s/$Hyprland;/' /usr/local/share/applications/in.lsp_plug*.desktop
nnu
nu
sudo sed -i '/^NotShowIn=/ s/$Hyprland;/' /usr/local/share/applications/lsp-plugins-*.desktop
sudo ln -s /usr/share/applications/lsp-plugins-*.desktop /usr/local/share/applications/
sudo sed -i '/^NotShowIn=/ s/$/;Hyprland;/' /usr/local/share/applications/lsp-plugins-*.desktop
nu
sudo sed -i '/^NotShowIn=/ {
  /Hyprland;/! { s/;*$//; s/$/;Hyprland;/ }
}' /usr/local/share/applications/in.lsp_plug.lsp_plugins_*.desktop
nu
sudo ln -s /usr/share/applications/lsp-plugins-*.desktop /usr/local/share/applications/
sudo sed -i '/^NotShowIn=/ s/$/;Hyprland;/' /usr/local/share/applications/lsp-plugins-*.desktop
sudo ln -s /usr/share/applications/in.lsp_plug.lsp_plugins_*.desktop /usr/local/share/applications/
nvim
sudo sed -i '/^NotShowIn=/ s/$/;Hyprland;/' /usr/local/share/applications/in.lsp_plug.lsp_plugins_*.desktop
nu
anyrun daemon
peak
peak
ls
nu
nvim
ls
nu
nu
nu
nu
nu
$XDG_CACHE_HOME/swayimg
echo $XDG_CACHE_HOME
nu
nu
$XDG_CACHE_HOME/swayimg
$XDG_CACHE_HOME
echo $XDG_CACHE_HOME
echo $HOME
nu
wl-copy < /home/Ext4Pam/Pictures/NewjeansPics/G4gA2fJa8AM206e.png
echo "hi" > wl-copy
echo "hi" | wl-copy
nu
peak
peak
if hyprctl monitors | grep -q "DPMS: on"; then     hyprctl dispatch dpms off; else     hyprctl dispatch dpms on; fi
if hyprctl monitors | grep -q "DPMS: on"; then     hyprctl dispatch dpms off; else     hyprctl dispatch dpms on; fi
if hyprctl monitors | grep -q "DPMS: on"; then     hyprctl dispatch dpms off; else     hyprctl dispatch dpms on; fi
hyprctl monitors
hyprctl monitors | rg "dpmsStatus: 1"
hyprctl monitors | rg "dpmsStatus: 1"
mv first/ test_dir/
mv first test_dir/
mv first/ test_dir
nu
nu
source /home/pampam/Documents/UTH/MachineLearning/practice2/.venv/bin/activate
source /home/pampam/Documents/UTH/MachineLearning/practice2/.venv/bin/activate
tmux a
tmuxa
tmux
tmux list
nu
nu
tmux a
tmux a
tmux a
tmux a
tmux
tmux a
uv pip list
tmux a
tmux a
tmux a
nordvpn status | rg "Connected" > /dev/null
if nordvpn status | rg "Connected" > /dev/null; a
if nordvpn status | rg "Connected" > /dev/null; then   echo "🔒"; else   echo "🔓"; fi
conf="$HOME/.config/qt6ct/qt6ct.conf"
light="/usr/share/qt6ct/colors/simple.conf"
dark="/usr/share/qt6ct/colors/darker.conf"
    sed -i "s|^color_scheme_path=.*|color_scheme_path=$dark|" "$conf"
    sed -i "s|^color_scheme_path=.*|color_scheme_path=$light|" "$conf"
    sed -i "s|^color_scheme_path=.*|color_scheme_path=$light|" "$conf"
    sed -i "s|^color_scheme_path=.*|color_scheme_path=$dark|" "$conf"
hyprctl dispatch exec "[workspace 3] telegram-desktop"
hyprctl dispatch exec "[workspace 3] Telegram"
nu
hyprland
loginctl show-session $(loginctl | grep $(whoami) | awk '{print $1}') -p Type
systemctl --user status
echo $XDG_RUNTIME_DIR
ls /usr/share/uwsm/sessions/
uwsm doctor
waybar >/dev/null 2>&1 &
pkill --help
pkill waybar
xdg-terminal-exec
nu
$TERMINAL
nu
nu
journalctl --user -u uwsm@$(id -u) (
journalctl --user -u uwsm@$(id -u)
nu
$XDG_CACHE_HOME/hyprland
nu
cd ~/dotfiles && uwsm-app -- neovide
bash
nu
nu
time ghostty
time "ghostty +new-window"
time ghostty +new-window
time ghostty
time ghostty >/dev/null 2>&1
time ghostty >/dev/null 2>&1 &
time ghostty >/dev/null 2>&1 &
time ghostty +new-window
ghostty >/dev/null
ghostty >/dev/null 2>&1 &
time ghostty +new-window
time "ghostty >/dev/null 2>&1 &"
time "ghostty >/dev/null 2>&1 &"
time "ghostty >/dev/null 2>&1 &"
time ghostty +new-window
time ghostty >/dev/null
time ghostty >/dev/null 2>&1
nu
hyprfine --warmup 3 "fd" "find"
hyperfine --warmup 3 "fd" "find"
nu
hyperfine --runs 10   'dbus-send --session --dest=com.mitchellh.Ghostty \
   /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
hyperfine -N --runs 50 'dbus-send --session --dest=com.mitchellh.Ghostty \
 /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
hyperfine --warmup 3 -N --runs 50 'dbus-send --session --dest=com.mitchellh.Ghostty \
 /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
hyperfine --warmup 10 -N --runs 50 'dbus-send --session --dest=com.mitchellh.Ghostty \
 /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
hyperfine --prepare -N --runs 50 'dbus-send --session --dest=com.mitchellh.Ghostty \
 /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
hyperfine --preparex -N --runs 50 'dbus-send --session --dest=com.mitchellh.Ghostty \
 /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
hyperfine --prepare 100 -N --runs 50 'dbus-send --session --dest=com.mitchellh.Ghostty \
 /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
hyperfine --warmup 100 -N --runs 50 'dbus-send --session --dest=com.mitchellh.Ghostty \
 /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
hyperfine --warmup 100 -N --runs 1000 'dbus-send --session --dest=com.mitchellh.Ghostty \
 /com/mitchellh/Ghostty com.mitchellh.Ghostty.NewWindow'
btop
nu
nu
ghostty --gtk-single-instance=true --initial-window=false &
ghostty --gtk-single-instance=true --initial-window=false &
bash
btop
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/skip-username.conf >/dev/null <<'EOF'
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -- pampam' --noclear --skip-login - $TERM
EOF

sudo systemctl daemon-reload
sudo systemctl restart getty@tty1.service
zotify https://open.spotify.com/track/02NGyZyhLkYH56SGA7liV3?si=9eaf4f8c70744bf0
nu
# writes stdout+stderr to ~/zotify-debug.log and shows it live
RUST_LOG=librespot=debug zotify 'https://open.spotify.com/track/02NGyZyhLkYH56SGA7liV3'   --debug --print-errors --print-warnings --print-progress
nu
ls -l /etc/xdg/elephant/providers /usr/share/elephant/providers ~/.config/elephant/providers 2>/dev/null || true
elephant query "clipboard;;10;false"
nu
nu
ls -l $(which poweroff)
fish
