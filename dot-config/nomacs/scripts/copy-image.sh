#!/usr/bin/env bash
wl-copy < "$1" && notify-send 'Image copied to clipboard' "$1"
