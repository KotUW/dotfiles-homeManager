{pkgs, ...}: {
    home.username = "kotuw";
    home.homeDirectory = "/home/kotuw";
    home.stateVersion = "22.11"; 
    # Let home manager manage itself.
    programs.home-manager.enable = true;

    home.packages = [
    ];
}