#!/usr/bin/env fish

# kill hyprsunset
set pid (pgrep hyprsunset)

if test -n $pid
    kill $pid
    echo "hyprsunset stopped"
else
    echo "hyprsunset not running"
end

# `2>&1` redirects stderr to stdout
# `> /dev/null` to suppress output
hyprsunset -t 5500 > /dev/null 2>&1 &
disown $last_pid
