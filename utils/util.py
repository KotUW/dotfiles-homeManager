#!/usr/bin/env -S nix run nixpkgs#python3

from shutil import copytree
from os import getcwd

programs = [
    "wezterm",
    "helix",
    "nix"
]

print("[LOG] Starting Copying into {}",)

for p in programs:
    print("[INFO] Copying files for {}",p)
    
    srcDir = "/home/kotuw/.config/{}".format(p)
    dstDir = "./config/{}/".format(p)
    copytree(srcDir, dstDir, True, dirs_exist_ok=True)
    