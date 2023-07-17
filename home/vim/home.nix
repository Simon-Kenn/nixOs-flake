{ pkgs, lib, ... }:
{
  programs = {
    vim = {
      enable = true;

      plugins = with pkgs.vimPlugins; [
        nerdtree
      ];

      extraConfig = builtins.readFile ./vimrc;
    };
  };
}
