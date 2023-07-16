{ pkgs, lib, ... }:
{
  programs = {
    vim = {
      enable = true;

      plugins = with pkgs.vimPlugins; [
        #catppuccin
        nerdtree
      ];

      extraConfig = builtins.readFile ./vimrc;
    };
  };
}
