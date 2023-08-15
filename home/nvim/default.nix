{ config, pkgs, ...}:
let
  color = pkgs.writeText "color.vim" (import ./theme.nix config.colosheme);
in
{
  imports = [];

  programs.neovim = {
    enable = true;


  };
}
