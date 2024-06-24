#!/usr/bin/env fish

# kill gammastep
set pid (pgrep waybar)

if test -n $pid
    kill $pid
    echo "Waybar stopped"
else
    echo "Waybar not running"
end

# `2>&1` redirects stderr to stdout
# `> /dev/null` to suppress output
waybar > /dev/null 2>&1 &
disown $last_pid
