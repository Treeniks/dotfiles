#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX, OS.WINDOWS, OS.MACOS)

target = join(target_dir(), "chrome")

match platform:
    case OS.LINUX | OS.MACOS:
        import configparser

        if platform == OS.LINUX:
            base = join(HOME, ".mozilla", "firefox")
        else: # OS.MACOS
            base = join(APPLICATION_SUPPORT, "Firefox")

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

answer = input("Install Betterfox? [Y/n]: ")
if answer.lower() != "n":
    import requests

    userjs = join(profile, "user.js")

    url = "https://raw.githubusercontent.com/yokoffing/Betterfox/main/user.js"
    r = requests.get(url)

    with open(userjs, "w") as file:
        file.write(r.text)

    print("Installed Betterfox")

# ==================================
# ManualAppUpdateOnly (Windows only)
# ==================================

# https://mozilla.github.io/policy-templates/#manualappupdateonly
policy = """{
  "policies": {
    "ManualAppUpdateOnly": true
  }
}
"""

if platform == OS.WINDOWS:
    answer = input("Add ManualAppUpdateOnly policy? [Y/n]: ")
    if answer.lower() != "n":

        policies = join(USERPROFILE, "scoop", "persist", "firefox", "distribution", "policies.json")

        with open(policies, "w") as file:
            file.write(policy)

        print("Added policy")
