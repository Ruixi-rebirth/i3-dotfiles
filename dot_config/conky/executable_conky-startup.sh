#!usr/bin/bash
killall conky
sleep 1s && conky -c "$HOME/.config/conky/conkyrc" &
