#!/usr/bin/env fish

function _panic -d "Custom Error handeler for myself."
    #TODO: COLOR
    #TODO: it errors out when not called with correct number of args.
    echo "[ERROR]: "$argv[1] >&2
    exit $argv[2]
end

function add-to-bin -d "Link binary to ~/.local/bin/"
    if test (count $argv) -lt 1
        _panic "Target to link is required" 2
    else
        ln -sr $argv[1] ~/.local/bin/
    end
end
