{pkgs, ...}:{
  imports = [
    ./firefox.nix
    ./discord.nix
		./zathura.nix
  ];

	home.packages = with pkgs; [
		xfce.thunar
		libreoffice-qt
		hunspell
		hunspellDicts.fr-any
		calibre
		zotero
	];
}
