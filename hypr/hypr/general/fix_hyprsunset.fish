#!/usr/bin/env fish

# kill hyprsunset
set pid (pgrep hyprsunset)

if test -n $pid
    kill $pid
    echo "hyprsunset stopped"
    sleep 1
else
    echo "hyprsunset not running"
end

# `2>&1` redirects stderr to stdout
# `> /dev/null` to suppress output
hyprsunset -t $SCREEN_TEMP > /dev/null 2>&1 &
disown $last_pid
