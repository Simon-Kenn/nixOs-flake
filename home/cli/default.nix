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
		feh
		neofetch
		ranger
  ];
}
