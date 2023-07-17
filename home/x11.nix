{ config, lib, pkgs, unstable, user, ... }:
{

  imports = [
    ./vim
    ./zsh.nix
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  
    stateVersion = "23.05";

    packages = with pkgs; [
      # Apps
      firefox
      google-chrome
      logseq
    ];
  };
  programs = {
    home-manager.enable = true;
  };
}
