#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX, OS.WINDOWS, OS.MACOS)

target = join(target_dir(), "User")

match platform:
    case OS.LINUX:
        link = join(DOTCONFIG, "sublime-text", "Packages", "User")
    case OS.MACOS:
        link = join(APPLICATION_SUPPORT, "Sublime Text", "Packages", "User")
    case OS.WINDOWS:
        if check_scoop():
            link = join(USERPROFILE, "scoop", "persist", "sublime-text", "Data", "Packages", "User")
        else:
            link = join(APPDATA, "Sublime Text", "Packages", "User")

make_symlink(target, link)
