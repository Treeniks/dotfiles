#!/usr/bin/env fish

# When the TV is off, for some reason Hyprland doesn't seem to recognize when it's turned on again, causing it to show nothing.
# The only way to fix it is to completely disable the display output and reenable it again.

hyprctl keyword monitor HDMI-A-3,disable
hyprctl keyword monitor DP-4,disable
sleep 2
hyprctl reload
