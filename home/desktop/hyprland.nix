{ config, lib, pkgs, host, ...}:
{
  wayland.windomManager.hyprland = {
    extraConfig = builtins.readFile ./hyprland.conf;
  };  
}
