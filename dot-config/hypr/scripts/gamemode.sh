#!/usr/bin/env sh

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
if [ "$HYPRGAMEMODE" = 1 ]; then
      hyprctl --batch "\
        keyword unbind ALT, W;\
        keyword animations:enabled 0;"
      exit
fi
hyprctl reload

# keyword unbind ALT, mouse:272 ;\
# keyword unbind ALT, mouse:273 ;"
# keyword decoration:rounding 0;\
# keyword general:gaps_in 0;\
# keyword general:gaps_out 0;"
# keyword general:border_size 1;\
# keyword decoration:shadow:enabled 0;\
# keyword decoration:blur:enabled 0;\
# keyword unbind ALT, W;\
# keyword unbind ALT, S"
