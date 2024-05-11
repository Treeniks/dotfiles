#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(LINUX)

target = join(target_dir(), "hypr")
link = join(HOME, ".config", "hypr")

make_symlink(target, link)
