#!/usr/bin/env fish

switch $argv[1]
    case on
        # kill gammastep
        set pid (pgrep gammastep)

        if test -n $pid
            kill $pid
            echo "Gammastep stopped"
        else
            echo "Gammastep not running"
        end

        hyprctl --batch "
            keyword monitor HDMI-A-2,3840x2160@120,0x0,2,bitdepth,10;
            keyword monitor DP-3,disable;
            keyword monitor DP-2,disable;
            keyword workspace name:DP-3_1,persistent:false;
            keyword workspace name:DP-2_1,persistent:false;
        "
    case off
        # `2>&1` redirects stderr to stdout
        # `> /dev/null` to suppress output
        gammastep -O 4500 > /dev/null 2>&1 &
        disown $last_pid

        echo "Gammastep started"

        hyprctl reload
end
