{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./git.nix
    ./starship.nix
    ./bat.nix
		./bottom.nix
    ./${host.shell}.nix
  ];

  home.packages = with pkgs; [
    ncdu
    eza
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
