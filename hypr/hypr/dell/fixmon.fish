#!/usr/bin/env fish

# This script is for when the main display was disabled (e.g. to only use an external display), and the external display was disconnected without re-enabling the laptop's display

hyprctl --batch "keyword monitor eDP-1,1920x1080@60,0x0,1; keyword monitor DP-1,disable; keyword monitor DP-2,disable; keyword monitor DP-3,disable"
