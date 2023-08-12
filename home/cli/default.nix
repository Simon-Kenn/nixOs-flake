{pkgs, ...}: {
  imports = [
    ./git.nix
    ./starship.nix
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
