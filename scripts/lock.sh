#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -blur 0x4 /tmp/screen.png
convert /tmp/screen.png ~/.local/share/shy.png -gravity southwest -geometry +20+20 -composite -matte /tmp/screen.png
i3lock -f -i /tmp/screen.png
rm /tmp/screen.png
