#!/bin/bash

if nordvpn status | rg -qi '^Status:\s*Connected'; then
/usr/bin/nu -c 'notify -t "Hoo~ooh~ooh~ooh~~" --summary "Disconnecting Nordvpn..." -i /home/Ext4Pam/Pictures/NewjeansPics/112-GeNE7vxWgAAEEa6.jpg'
  nordvpn d
else
/usr/bin/nu -c 'notify -t "Hoo~ooh~ooh~ooh~~" --summary "Connecting Nordvpn..." -i /home/Ext4Pam/Pictures/Arch_pics/pudb1pbcqwkf1.jpeg'
  nordvpn c Japan
fi
