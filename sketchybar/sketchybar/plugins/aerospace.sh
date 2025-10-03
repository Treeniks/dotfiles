#!/usr/bin/env sh

FOREGROUND=0xFFEDECEE
SENARY=0xFFFF6767

# https://nikitabobko.github.io/AeroSpace/goodies#show-aerospace-workspaces-in-sketchybar

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME label.color=$SENARY
else
    sketchybar --set $NAME label.color=$FOREGROUND
fi
