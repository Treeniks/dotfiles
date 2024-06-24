#!/usr/bin/env fish

# kill gammastep
set pid (pgrep hyprpaper)

if test -n $pid
    kill $pid
    echo "Hyprpaper stopped"
else
    echo "Hyprpaper not running"
end

# `2>&1` redirects stderr to stdout
# `> /dev/null` to suppress output
hyprpaper > /dev/null 2>&1 &
disown $last_pid
