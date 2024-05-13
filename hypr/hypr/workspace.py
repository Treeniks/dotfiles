#!/usr/bin/env python3

import sys
import subprocess
import re

if sys.argv[1] == "move":
    hyprctl_output = subprocess.run("hyprctl activeworkspace", shell=True, capture_output=True).stdout.decode()
    active_monitor = re.search("on monitor (.*):", hyprctl_output).group(1)
    subprocess.run(f"hyprctl dispatch workspace name:{active_monitor}_{sys.argv[2]}", shell=True)
elif sys.argv[1] == "moveto":
    # hyprctl_output = subprocess.run("hyprctl activewindow", shell=True, capture_output=True).stdout.decode()
    # active_window = re.search("workspace: .* \((.*)\)", hyprctl_output).group(1)
    # active_window = active_window[:active_window.find("_")]
    # subprocess.run(f"hyprctl dispatch movetoworkspace name:{active_window}_{sys.argv[2]}", shell=True)

    # pretty sure this is needed because of a bug in hyprctl
    # specifically `hyprctl activewindow` does not show the correct workspace name
    hyprctl_output = subprocess.run("hyprctl activewindow", shell=True, capture_output=True).stdout.decode()
    active_workspace = re.search("workspace: (.*) \(.*\)", hyprctl_output).group(1)

    search_string = f"Monitor (\S*) [\s\S]*active workspace: {re.escape(active_workspace)}"
    hyprctl_monitors = subprocess.run("hyprctl monitors", shell=True, capture_output=True).stdout.decode().strip().split("\n\n")

    active_monitor = None
    for monitor in hyprctl_monitors:
        re_search = re.search(search_string, monitor)
        if re_search:
            active_monitor = re_search.group(1)
            break

    if active_monitor:
        # print(f"hyprctl dispatch movetoworkspace name:{active_monitor}_{sys.argv[2]}")
        subprocess.run(f"hyprctl dispatch movetoworkspace name:{active_monitor}_{sys.argv[2]}", shell=True)
