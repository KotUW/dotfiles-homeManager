{pkgs, ...}: {
    home.username = "kotuw";
    home.homeDirectory = "/home/kotuw";
    home.stateVersion = "22.11"; 
    # Let home manager manage itself.
    programs.home-manager.enable = true;

    home.packages = [
        pkgs.xplr
        pkgs.devbox
        pkgs.gum
        pkgs.ripgrep
        pkgs.cachix
        pkgs.fd
        pkgs.cargo-binstall
    ];

    # Git conf
    programs.git = {
        enable = true;
        userName = "kotuw";
        userEmail = "46974369+KotUW@users.noreply.github.com";
        delta.enable = true;
    };

    programs.gitui.enable = true;

    programs.bat = {
        enable = true;
        config = {
            theme = "Dracula";
        };
    };

    programs.bottom = {
        enable = true;
        settings = {
            flags = {
                dot_marker = false;
                temperature_type = "c";
                battery = true;
                tree = true;
            };

            colors = {
                low_battery_color = "red";
            };
        };
    };

    programs.direnv = {
        enable = true;
        # enableFishIntegration = true;
    };

    programs.exa = {
        enable = true;
        enableAliases = true;
    };
    
    programs.fzf = {
        enable = true;
        enableFishIntegration = true;
        fileWidgetCommand = "fd --type f";
    };

    programs.fish = {
        enable = true;
        shellAbbrs = {
            q = "exit";
            c = "clear";
            cat = "bat";
            lg = "gitui";
            subl = "DRI_PRIME subl .";
            xcd = "cd (xplr --print-pwd-as-result)";
        };
    };

    programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
    };

    # home.file.".config/wezterm/wezterm.lua".source =  ./config/wezterm.lua ;
}