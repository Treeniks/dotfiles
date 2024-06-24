#!/usr/bin/env fish

# kill gammastep
set pid (pgrep gammastep)

if test -n $pid
    kill $pid
    echo "Gammastep stopped"
else
    echo "Gammastep not running"
end

# `2>&1` redirects stderr to stdout
# `> /dev/null` to suppress output
gammastep -O 4000 > /dev/null 2>&1 &
disown $last_pid
