#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.WINDOWS)

target = join(target_dir(), "chrome")

match platform:
    # case OS.LINUX | OS.MACOS:
        # link = join(DOTCONFIG, "config_folder")
    case OS.WINDOWS:
        base = join(USERPROFILE, "scoop", "persist", "firefox", "profile")

link = join(base, "chrome")
make_symlink(target, link)

# =========
# Betterfox
# =========

userjs = join(base, "user.js")
answer = input("Install Betterfox? [Y/n]: ")
if answer.lower() != "n":
    import requests

    url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js"
    r = requests.get(url)

    with open(userjs, "w") as file:
        file.write(r.text)

    print("Installed Betterfox")
