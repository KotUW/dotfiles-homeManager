{pkgs, ...}: {
    home.username = "kotuw";
    home.homeDirectory = "/home/kotuw";
    home.stateVersion = "22.11"; 
    # Let home manager manage itself.
    programs.home-manager.enable = true;

    home.packages = [
        # pkgs.bottom
        pkgs.xplr
        pkgs.devbox
        pkgs.direnv
        pkgs.exa
        pkgs.gum
        pkgs.fzf
        pkgs.zoxide
        pkgs.ripgrep
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
}