#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.WINDOWS, OS.LINUX)

target = join(target_dir(), "rustfmt.toml")

link = "" # pyright ignore
match platform:
    case OS.LINUX:
        link = link = join(DOTCONFIG, "rustfmt", "rustfmt.toml")
    case OS.WINDOWS:
        link = join(APPDATA, "rustfmt", "rustfmt.toml")

make_symlink(target, link)
