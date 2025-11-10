#!/bin/bash

if pgrep -x anyrun-provider >/dev/null; then
      anyrun close
else
      uwsm-app -- anyrun
fi
