{  pkgs, ... }:
{
  imports =
    [
      ../../modules/desktop/gnome/home.nix
      ../../modules/programs/vim/home.nix
    ];

  home = {
    packages = with pkgs; [

    ];
  };
}
