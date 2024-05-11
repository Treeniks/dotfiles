#!/usr/bin/python3

import sys
import subprocess
import re

if sys.argv[1] == "move":
    hyprctl_output = subprocess.run("hyprctl activeworkspace", shell=True, capture_output=True).stdout.decode()
    active_monitor = re.search("on monitor (.*):", hyprctl_output).group(1)
    subprocess.run(f"hyprctl dispatch workspace name:{active_monitor}_{sys.argv[2]}", shell=True)
elif sys.argv[1] == "moveto":
    hyprctl_output = subprocess.run("hyprctl activewindow", shell=True, capture_output=True).stdout.decode()
    active_window = re.search("workspace: .* \((.*)\)", hyprctl_output).group(1)
    active_window = active_window[:active_window.find("_")]
    subprocess.run(f"hyprctl dispatch movetoworkspace name:{active_window}_{sys.argv[2]}", shell=True)
