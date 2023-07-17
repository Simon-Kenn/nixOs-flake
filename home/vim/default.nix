{ pkgs, lib, ... }:
let 
  plugins = pkgs.vimPlugins // pkgs.callPackage ./custom-plugins.nix {};
in
{
  programs = {
    vim = {
      enable = true;

      plugins = with pkgs; [
        plugins.catppuccin
      ];

      extraConfig = builtins.readFile ./vimrc;
    };
  };
}
