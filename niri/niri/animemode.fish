#!/usr/bin/env fish

switch $argv[1]
    case on
        killall gammastep
        niri msg output HDMI-A-2 scale 2
        niri msg output DP-3 off
        niri msg output DP-2 off
    case off
        disown $last_pid
        niri msg output HDMI-A-2 scale 1.5
        niri msg output DP-3 on
        niri msg output DP-2 on
        sleep 2
        gammastep -O 4500 &
end
