#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

# other platforms could be supported, but I haven't looked up the relevant paths yet
check_os(OS.LINUX)

target = join(target_dir(), "zed")

match platform:
    case OS.LINUX:
        link = join(DOTCONFIG, "zed")

make_symlink(target, link)
