default:
    just -l

init:
    nix run . switch -- --flake .

hm-switch:
    home-manager switch

clean:
    fd -td -E util.py . 'config/' -X rm -dr

pop: clean
    ./utils/util.py
