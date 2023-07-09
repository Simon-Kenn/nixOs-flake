{ config, lib, pkgs, unstable, user, ... }:
{
  imports = 
    (import ../modules/programs);

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
