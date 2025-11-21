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
python3 - <<'EOF'
import keyring
print(keyring.get_keyring())
keyring.set_password("jrnl", "default", 1801")
print(keyring.get_password("jrnl", "default"))
EOF

python3 - <<'EOF'
import keyring
print(keyring.get_keyring())
keyring.set_password("jrnl", "default", "1801")
print(keyring.get_password("jrnl", "default"))
EOF

uv pip install keyring-pass
uv pip install --system keyring-pass
yay -S python-keyring-pass
python3 - <<'EOF'
import keyring
print(keyring.get_keyring())
keyring.set_password("jrnl", "default", "1801")
print(keyring.get_password("jrnl", "default"))
EOF

nu
echo $SSH_AUTH_SOCK
ssh-add ~/.ssh/id_ed25519
ssh-add ~/.ssh/id_ed25519
gpg --list-secret-keys
echo "default-cache-ttl 3600" >> ~/.gnupg/gpg-agent.conf
echo "max-cache-ttl 86400" >> ~/.gnupg/gpg-agent.conf
gpgconf --reload gpg-agent
nu
nu
shuf -n5 /usr/share/dict/words | tr '\n' ' '
which shuf
nu
tr -dc 'a-z' </dev/urandom | fold -w6 | head -n5 | tr '\n' '-' ; echo
head -c 32 /dev/urandom | base64 | tr -d '/+' | cut -c1-32
nu
gpg "$HOME/Downloads/Telegram Desktop/rezeden.jpg.gpg"
nu
btop
systemctl status kanata
systemctl --user status kanata
fish
date -u +%V$(uname)|sha512sum|sed 's/\W//g'
nu
ps -e | grep -i discord
yay -Rns discord-canary
yay -S discord
discord
discord --disable-gpu
DISCORD_ENABLE_WAYLAND=0 discord
yay -Rns discord legcord
yay -Rns discord legcord-bin
nu
ldd /usr/lib/discord/Discord | grep electron
nu
uwsm-app -- xdg-open ( f Machine | rg .pdf$ | fzf ) &
uwsm-app -- xdg-open ( f Machine | rg .pdf$ | fzf )
nu
sed -i "s|^color_scheme_path=.*|color_scheme_path=$dark|" "$conf"
conf="$HOME/.config/qt6ct/qt6ct.conf"
dark="/usr/share/qt6ct/colors/darker.conf"
sed -i "s|^color_scheme_path=.*|color_scheme_path=$dark|" "$conf"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
echo $?
gsettings get org.gnome.desktop.interface color-scheme
pacman -Qi libadwaita
yay -S xdg-desktop-portal-gnome
nautilus --version
echo $XDG_CURRENT_DESKTOP
echo $XDG_SESSION_TYPE
nu
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
echo $?
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
echo $?
gsettings get org.gnome.desktop.interface color-scheme
pacman -Qi libadwaita
nu
alsamixer
tmux
paste -d " " <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line" > /home/pampam/Documents/pam/1-Rough-Note/test/latest.txt; done
nu
ffmpeg -f pulse -i default   -af "astats=metadata=1:reset=1,ametadata=print:key=Peak_level:entry=frame"   -f null -
sudo pacman -S qpwgraph
pw-jack jack_meter
qpwgraph
nu
easyeffects --gapplication-service &
pkill easyeffects
btop
easyeffects --gapplication-service &
btop
paste -d " " <(jack_meter -n -f 1 "Level Meter:output_FL") <(jack_meter -n -f 1 "Level Meter:output_FR") | while IFS= read -r line; do printf "%s\n" "$line"; 
nu
piper -m ~/voices/piper/en_US-amy/en_US-amy-medium.onnx       -c ~/voices/piper/en_US-amy/en_US-amy-medium.onnx.json       <<< "Hello, this is a natural female voice."
piper -m ~/voices/piper/en_US-amy/en_US-amy-medium.onnx       -c ~/voices/piper/en_US-amy/en_US-amy-medium.onnx.json       -f out.wav       <<< "Hello, this is a natural female voice."
nu
LC_ALL=C pacman -V|sed -r "s#[0-9]+#$(date -u +%m)#g"|base32|head -1 | wl-copy
nu
umask
umask -S
nu
find "bocchi"
which find
find / -path "/.snapshots" -prune -name "bocchi"
sudo find / -path "/.snapshots" -prune -name "bocchi"
sudo find / -path "/.snapshots" -prune -name "hi"
find
sudo find / -path "/.snapshots" -prune
find / -path "/.snapshots" -prune
tldr find
find -name '*.mkv'
find -name '*.mkv' 2>/dev/null
find -name '*bocchi*' 2>/dev/null
find -iname '*bocchi*' 2>/dev/null
time (find -iname '*bocchi*' 2>/dev/null)
find . -path ./.snapshots -prune -o -print
find . -path ./.snapshots -prune -o -print | wl -c
find . -path ./.snapshots -prune -o -print | wc -l
find . -path ./.snapshots -prune -o -print 2>/dev/null | wc -l
find . -path ./.snapshots -prune -o -print -iname "*bocchi*" 2>/dev/null
find . -path ./.snapshots -prune -o -iname "*bocchi*" -print 2>/dev/null
time (find . -path ./.snapshots -prune -o -iname "*bocchi*" -print 2>/dev/null)
time (find . -path ./.snapshots -prune -o -iname "*bocchi*" -print >/dev/null)
time (find . -path ./.snapshots -prune -o -iname "*bocchi*" -print 2>/dev/null > /dev/null)
which time
time (find . -path ./.snapshots -prune -o -iname "*bocchi*" -print 2>/dev/null > /dev/null)
time ( fd "bocchi" > /dev/null)
time (plocate -i "bocchi" > /dev/null)
perf
nu
find
find . -path ./.snapshots -prune -o -iname "*bocchi*" -print 2>/dev/null
time (find . -path ./.snapshots -prune -o -iname "*bocchi*" -print 2>/dev/null)
time (fd bocchi)
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
time (plocate -i "bocchi")
nu
time (fd bocchi)
time (plocate -i "bocchi")
time (fd bocchi > /dev/null)
time (plocate -i "bocchi" > /dev/null)
jrnl
find > wl -c
find > sudo wl -c
find | wc -l
bash
nu
find / -path "/.snapshots" -prune -name "bocchi"
nu
sudoedit /etc/hosts
MANPAGER="neovide --no-fork -- +'Man'" man rg
nu
