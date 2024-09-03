#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.WINDOWS, OS.LINUX)

target = join(target_dir(), "chrome")

match platform:
    # case OS.MACOS:
    #     pass
    case OS.LINUX:
        import configparser

        base = join(HOME, ".mozilla", "firefox")
        installs_ini = join(base, "installs.ini")
        config = configparser.ConfigParser()
        config.read(installs_ini)
        assert(len(config.sections()) == 1)
        profile_folder = config[config.sections()[0]]["Default"]

        profile = join(base, profile_folder)
    case OS.WINDOWS:
        profile = join(USERPROFILE, "scoop", "persist", "firefox", "profile")

link = join(profile, "chrome")
make_symlink(target, link)

# =========
# Betterfox
# =========

userjs = join(profile, "user.js")
answer = input("Install Betterfox? [Y/n]: ")
if answer.lower() != "n":
    import requests

    url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js"
    r = requests.get(url)

    with open(userjs, "w") as file:
        file.write(r.text)

    print("Installed Betterfox")
