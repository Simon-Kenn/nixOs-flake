{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./git.nix
    ./starship.nix
    ./bat.nix
    ./${host.shell}.nix
    ./vim
  ];

  home.packages = with pkgs; [
    bottom
    ncdu
    exa
    ripgrep
    fd
    diffsitter
    libnotify
    gnumake
  ];
}
