#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX)

target_base = target_dir()
link_base = DOTCONFIG

def m(s):
    target = join(target_base, s)
    link = join(link_base, s)

    make_symlink(target, link)

m("gtk-3.0")
m("gtk-4.0")
m(".gtkrc-2.0")
