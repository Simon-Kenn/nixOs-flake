{pkgs, ...}: {
  imports = [
    ./git.nix
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
