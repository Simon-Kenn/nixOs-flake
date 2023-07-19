{ config, lib, pkgs, host, ...}:
{
  wayland.windowManager.hyprland = {
    extraConfig = builtins.readFile ./hyprland.conf;
  };  
}
