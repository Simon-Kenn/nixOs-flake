{  pkgs, ... }:
{
  imports =
    [
      ../../modules/desktop/gnome/home.nix
    ];

  home = {
    packages = with pkgs; [

    ];
  };
}
