import sys
import os
import shutil
import inspect
from enum import Enum, auto

if __name__ == "__main__":
    print("this is not a script")
    sys.exit(0)

HOME = os.environ["HOME"]
join = os.path.join

def target_dir():
    filename = inspect.stack()[1].filename
    realpath = os.path.realpath(filename)
    return os.path.dirname(realpath)

class OS_TYPE(Enum):
    LINUX = auto()
    WINDOWS = auto()
    MACOS = auto()

    def platform(self):
        if self == OS_TYPE.LINUX:
            return "linux"
        if self == OS_TYPE.WINDOWS:
            return "win32"
        if self == OS_TYPE.MACOS:
            return "darwin"

# allow functional-like acces to enum
# probably not good style but makes writing link scripts easier
LINUX = OS_TYPE.LINUX
WINDOWS = OS_TYPE.WINDOWS
MACOS = OS_TYPE.MACOS

def check_os(*oses: OS_TYPE):
    supported_oses = map(OS_TYPE.platform, oses)
    if sys.platform not in supported_oses:
        print("OS not yet supported")
        sys.exit(0)

def make_symlink(target: str, link: str):
    s = os.path.basename(target)
    link_dir = os.path.dirname(link)

    if not os.path.exists(link_dir):
        os.makedirs(link_dir)
        print(f"Created directory {link_dir}")
    elif os.path.exists(link):
        response = input(f"Existing symlink for {s} found\nRemove? [y/N]: ")
        if response.lower() != "y":
            print("Exiting")
            sys.exit(0)
        try:
            os.remove(link)
        except OSError:
            shutil.rmtree(link)
        print(f"Removed {s}")

    os.symlink(target, link)
    print(f"Created symlink for {s}")
