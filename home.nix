{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "evil";
  home.homeDirectory = "/home/evil";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.foot = {
    enable = true;
  };

  programs.btop = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Koustubh Saxena";
    userEmail = "46974369+KotUW@users.noreply.github.com";
    delta.enable = true;
    extraConfig = {
      init.defaultBranch = "main";   
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ecdsa.pub";
      core.editor = "hx";
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
      # fileWidgetCommand = "fd --type f";
  };

  programs.fish = {
    enable = true;
    shellAbbrs = {
      q = "exit";
      c = "clear";
      cat = "bat";
      lg = "gitui";
    };

    functions = {
      dcd = {
        body = "pushd ~/work; br --only-folders --cmd \"$argv[1];:cd\"";
      };     
      conf-home = {
        body = "hx ~/.config/home-manager/home.nix";
      };
      mktmp = {
        body = "cd (mktemp -d) ";
      };
    };
  };
  
  programs.helix = {
    enable = false; # Enable after you change below settings with yours
    settings = {
      theme = "noctis_bordo";
      editor = {
        cursorline = true;
        color-mode = true;
        bufferline = "multiple";
        auto-save = true;
        auto-format = true;
      };

      editor.lsp = {
        display-messages = true;
        dispaly-inlay-hints = true;
      };

      editor.soft-wrap.enable = true;
      editor.indent-guides.render = true;
      keys.normal = {
        W = "expand_selection";
        "A-/" = "toggle_comments";
        space.w = ":w";
        space.x = ":wq";
        esc = [ "collapse_selection" "keep_primary_selection" ];
      };
      keys.insert = {
      };
    };
    languages = {
      language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      } 
      {
        name = "text-languageTool";
        language-servers = [{ name = "ltex";} ];  
        file-types = ["md" "txt" "adoc"];
        scope = "text.languageTool";
      }
      ];
      language-server.ltex = {
        command = "${pkgs.ltex-ls}/bin/ltex-ls";
      }; 
    };
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
  };  # Helix Conf

  programs.bat = {
    enable = true;
    config = {
    theme = "Dracula";
    };
  };

  programs.direnv = {
    enable = true;
  };

  programs.broot = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      modal = true;
      default_flags = "g";
      show_selection_mark = true;
      cols_order = [ "mark" "git" "size" "permission" "count" "branch" "name" ];
    };
  };
  
  programs.eza = {
      enable = true;
      enableAliases = true;
  };
    programs.zellij = {
        enable = false;
        # enableFishIntegration = true; # It starts zellij every time. you start fish.
        settings = {
            copy_clipboard = "primary";
            scrollback_editor = "hx";
            default_shell  = "/home/evil/.nix-profile/bin/fish";
        };
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
    keyConfig = ''(
        status_reset_item: Some((code: Char('d'), modifiers: (bits: 0,),)),
      )
    '';
  };

  home.packages = [
    pkgs.just
    pkgs.rustup
    pkgs.go
    pkgs.nil # maybe move to helix-extra-packages?
    pkgs.gopls# maybe move to helix-extra-packages?
    pkgs.bat
    pkgs.ltrace
    pkgs.catgirl
    pkgs.hyperfine
    pkgs.hexyl
    pkgs.glow
    pkgs.gum
    pkgs.xh
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  xdg.configFile = {
  # NOTE don't use flatpak version of wezterm.
    "wezterm/wezterm.lua".source = ./confiles/wezterm.lua;
    "wezterm/wezterm.lua".enable = true;
    "wezterm/charmful.lua".source = ./confiles/charmful.lua;
    "wezterm/charmful.lua".enable = true;
    # "kitty/kitty.conf".source = ./confiles/kitty.conf;
    "foot/foot.ini".source = ./confiles/foot.ini;
  };
  # Doesn't work with flatpak version. And that is also not recommended.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/evil/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
