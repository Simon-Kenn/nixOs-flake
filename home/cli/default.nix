{pkgs, ...}: {
  imports = [
    ./git.nix
    ./starship.nix
    ./bat.nix
  ];

  home.packages = with pkgs; [
    bottom
    ncdu
    exa
    ripgrep
    fd
    diffsitter
  ];
}
