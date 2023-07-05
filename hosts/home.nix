{ config, pkgs, ... }:

{
  home.username = "simon";
  home.homeDirectory = "/home/simon";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
