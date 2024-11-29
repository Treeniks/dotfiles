#!/usr/bin/env fish

switch $argv[1]
    case on
        # kill hyprsunset
        set pid (pgrep hyprsunset)

        if test -n $pid
            kill $pid
            echo "hyprsunset stopped"
        else
            echo "hyprsunset not running"
        end

        hyprctl --batch "
            keyword monitor HDMI-A-2,3840x2160@120,0x0,2,bitdepth,10;
            keyword monitor DP-3,disable;
            keyword monitor DP-2,disable;
            keyword workspace name:DP-3_1,persistent:false;
            keyword workspace name:DP-2_1,persistent:false;
        "

        $HOME/.config/hypr/general/fix_hyprpaper.fish
        $HOME/.config/hypr/general/fix_waybar.fish
    case off
        $HOME/.config/hypr/general/fix_hyprsunset.fish
        $HOME/.config/hypr/general/fix_hyprpaper.fish
        $HOME/.config/hypr/general/fix_waybar.fish
        hyprctl reload
end
