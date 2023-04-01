# QUICK LINKS    
#  |=> [103] Fish Abbrivations (allias)
#  |=> [16] programs

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
        pkgs.just
        pkgs.glow
        # pkgs.zellij
        pkgs.python310Packages.pipx
    ];

    # Git conf
    programs.git = {
        enable = true;
        userName = "kotuw";
        userEmail = "46974369+KotUW@users.noreply.github.com";
        delta.enable = true;
        extraConfig = {
         init.defaultBranch = "main";   
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
            subl = "DRI_PRIME=1 subl .";
            xcd = "cd (xplr --print-pwd-as-result)";
            py = "nix run nixpkgs#python310Packages.bpython";
            top = "btm -b";
            lsp-nix = "nix shell nixpkgs#nil";
            lsp-py = "nix shell nixpkgs#python310Packages.python-lsp-server";
        };
        plugins = [
            {
                name = "fish-ssh-agent";
                src = pkgs.fetchFromGitHub {
                    owner = "danhper";
                    repo = "fish-ssh-agent";
                    rev = "fd70a2afdd03caf9bf609746bf6b993b9e83be57";
                    sha256 = "sha256-e94Sd1GSUAxwLVVo5yR6msq0jZLOn2m+JZJ6mvwQdLs=";
                };
            }
        ];
    };

    programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
    };

    home.file = {
        "kitty" = {
            enable = true;
            target = ".config/kitty/kitty.conf";
            source = ./df/kitty/kitty.conf;
        };

        "xplr" = {
            enable = true;  
            target = ".config/xplr/init.lua";
            source = ./df/xplr/init.lua;
        };
        
        "wezterm" = {
            enable = false;  
            target = ".config/wezterm/wezterm.lua";
            source = ./df/wezterm/wezterm.lua;
        };
    };

    programs.bat = {
        enable = true;
        config = {
            theme = "Dracula";
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
    
    programs.gitui = {
        enable = true;
        theme = ''(
                selected_tab: Reset,
                command_fg: White,
                selection_bg: DarkGray,
                selection_fg: White,
                cmdbar_bg: Black,
                cmdbar_extra_lines_bg: Black,
                disabled_fg: DarkGray,
                diff_line_add: Green,
                diff_line_delete: Red,
                diff_file_added: LightGreen,
                diff_file_removed: LightRed,
                diff_file_moved: LightMagenta,
                diff_file_modified: Yellow,
                commit_hash: Magenta,
                commit_time: LightCyan,
                commit_author: Green,
                danger_fg: Red,
                push_gauge_bg: Blue,
                push_gauge_fg: Reset,
                tag_fg: LightMagenta,
                branch_fg: LightYellow,
            )
        '';
    };
}