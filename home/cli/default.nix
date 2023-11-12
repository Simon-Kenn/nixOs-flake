{
  pkgs,
  ...
}: {
  imports = [
		./alacritty.nix
		./nushell.nix
    ./starship.nix
		./zellij.nix
    ./git.nix
		./direnv.nix
    ./bat.nix
		./bottom.nix
		./gpg.nix
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
