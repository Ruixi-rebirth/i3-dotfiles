#!/usr/bin/bash
mpv --vo=gpu --no-audio --no-osc --no-border --no-window-dragging --no-input-default-bindings --no-osd-bar --no-stop-screensaver --no-sub --loop --wid=$1 "$2"
