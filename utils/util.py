#!/usr/bin/env -S nix run nixpkgs#python3

from shutil import copytree
from os import getcwd


programs = []
programs.append(input("Program to copy conf. Of:"))

for p in programs:
    srcDir = "/home/kotuw/.config/{}".format(p)
    dstDir = "./config/{}/".format(p)
    copytree(srcDir, dstDir, True, dirs_exist_ok=True)
    