#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX)

target_base = target_dir()
link_base = join(DOTCONFIG, "fish")

def m(s):
    target = join(target_base, s)
    link = join(link_base, s)

    make_symlink(target, link)

m("config.fish")
m("device_specific")
m("functions")
