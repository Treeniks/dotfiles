#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX)

target = join(target_dir(), "wofi")
link = join(DOTCONFIG, "wofi")

make_symlink(target, link)
