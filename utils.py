import sys
import os
import shutil
import inspect
from enum import Enum, auto

if __name__ == "__main__":
    print("this is not a script")
    sys.exit(0)

join = os.path.join

# ignore errors
# just define the ones that are available
try:
    HOME = os.environ["HOME"]
    DOTCONFIG = join(HOME, ".config")
    APPLICATION_SUPPORT = join(HOME, "Library", "Application Support")
except: pass
try: USERPROFILE = os.environ["USERPROFILE"]
except: pass
try: APPDATA = os.environ["APPDATA"]
except: pass
try: LOCALAPPDATA = os.environ["LOCALAPPDATA"]
except: pass

env = os.environ

def target_dir():
    filename = inspect.stack()[1].filename
    realpath = os.path.realpath(filename)
    return os.path.dirname(realpath)

class OS(Enum):
    LINUX = auto()
    WINDOWS = auto()
    MACOS = auto()

    def platform(self):
        if self == OS.LINUX:
            return "linux"
        if self == OS.WINDOWS:
            return "win32"
        if self == OS.MACOS:
            return "darwin"

    @staticmethod
    def type(platform: str):
        if platform == "linux":
            return OS.LINUX
        if platform == "win32":
            return OS.WINDOWS
        if platform == "darwin":
            return OS.MACOS
        print("unknown OS")
        sys.exit(0)

platform = OS.type(sys.platform)

def check_os(*oses: OS):
    supported_oses = map(OS.platform, oses)
    if sys.platform not in supported_oses:
        print("OS not supported")
        sys.exit(0)

def make_symlink(target: str, link: str):
    s = os.path.basename(link)
    link_dir = os.path.dirname(link)

    if not os.path.exists(link_dir):
        os.makedirs(link_dir)
        print(f"Created directory '{link_dir}'")
    elif os.path.lexists(link):
        response = input(f"Existing '{s}' found\nRemove? [y/N]: ")
        if response.lower() != "y":
            print("Exiting")
            sys.exit(0)
        try:
            os.remove(link)
        except OSError:
            shutil.rmtree(link)
        print(f"Removed '{s}'")

    os.symlink(target, link)
    print(f"Created symlink for '{s}'")
