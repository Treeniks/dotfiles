#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX, OS.WINDOWS, OS.MACOS)

target = join(target_dir(), "helix")

match platform:
    case OS.LINUX | OS.MACOS:
        link = join(DOTCONFIG, "helix")
    case OS.WINDOWS:
        link = join(APPDATA, "helix")

make_symlink(target, link)
