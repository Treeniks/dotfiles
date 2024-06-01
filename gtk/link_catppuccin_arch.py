#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX)

target_base = "/usr/share/themes/catppuccin-mocha-pink-standard+default-dark/gtk-4.0"
link_base = join(DOTCONFIG, "gtk-4.0")

def m(s):
    target = join(target_base, s)
    link = join(link_base, s)

    make_symlink(target, link)

m("assets")
m("gtk.css")
m("gtk-dark.css")
