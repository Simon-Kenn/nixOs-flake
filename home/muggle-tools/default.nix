{pkgs, ...}:{
  imports = [
    ./firefox.nix
    ./discord.nix
  ];

	home.packages = with pkgs; [
		xfce.thunar
	];
}
