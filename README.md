# Home Manager config for dotfiles

## New

1. Install & Set up nix from [zero-to-nix project site](https://zero-to-nix.com/)  
2. cd into this directory
3. Run `nix run . switch -- --flake .` <- This will run `home-manager switch` **after** building it.
4. Reload the shell environment

## Adding Things

1. commit git shit
2. Edit the `home.nix` file
3. Run `home-manager switch --flake .`
4. profit.

Follow same for Removing stuff.

 # Nix profile 

Install :=>

`nix profile install git+https://github.com/helix-editor/helix/`
