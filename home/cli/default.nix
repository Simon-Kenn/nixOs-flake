{
  pkgs,
  ...
}: {
  imports = [
		./alacritty.nix
		./fish.nix
    ./git.nix
    ./starship.nix
    ./bat.nix
		./bottom.nix
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
