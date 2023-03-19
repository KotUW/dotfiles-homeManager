default:
    just -l

init:
    nix run . switch -- --flake .

hm-switch:
    home-manager switch

clean:
    fd -td --maxdepth 1 . 'config/' -X rm -dr

pop: clean
    ./utils/util.py
    ./utils/cmt2nocmt_kitty.sh
