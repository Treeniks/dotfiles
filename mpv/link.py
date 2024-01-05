#!/usr/bin/python3

import os

current_path = os.path.dirname(os.path.abspath(__file__))
link_target_path = os.path.join(current_path, "config")

if os.name == 'nt':  # Windows
    config_path = os.path.join(os.environ['USERPROFILE'], 'scoop', 'persist', 'mpv', 'portable_config')
elif os.name == 'posix':  # Linux or macOS
    config_path = os.path.join(os.environ['HOME'], '.config', 'mpv')
else:
    print("OS not yet supported")
    exit()

if os.path.exists(config_path):
    answer = input("Config already exists, overwrite? [y/N]: ")
    if answer.lower() == "y":
        os.remove(config_path)
    else:
        exit()

os.symlink(link_target_path, config_path, target_is_directory=True)
print("Symlink created")


import requests
from io import BytesIO
import zipfile

# -- install uosc --
answer = input("Install uosc? [Y/n]: ")
if answer.lower() != "n":
    # version is hardcoded here
    # should be updated every now and then
    url = "https://github.com/tomasklaen/uosc/releases/download/5.1.1/uosc.zip"
    r = requests.get(url)

    with zipfile.ZipFile(BytesIO(r.content), "r") as zip_ref:
        zip_ref.extractall(link_target_path)
    print("Installed uosc")

# -- install thumbfast --
answer = input("Install Thumbfast (thumbnails in timeline for uosc)? [Y/n]: ")
if answer.lower() != "n":
    # commit is hardcoded here
    # should be updated every now and then
    # maybe even switch to submodule?
    url = "https://raw.githubusercontent.com/po5/thumbfast/03e93feee5a85bf7c65db953ada41b4826e9f905/thumbfast.lua"
    r = requests.get(url)

    with open(os.path.join(link_target_path, "scripts", "thumbfast.lua"), "w") as file:
        file.write(r.text)
    print("Installed thumbfast")
