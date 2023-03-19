default:
    just -l

init:
    nix run . switch -- --flake .

hm-switch:
    home-manager switch

clean:
    fd -td -I --maxdepth 1 . 'config/' -X rm -dr

pop: 
    ./utils/util.py
