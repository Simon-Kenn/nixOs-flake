{
  host,
	overlays,
  ...
}: {
  imports = [
		./desktop
    ./cli 
		./productivity
		./nixvim
  ];

  nixpkgs = {
    config = {allowUnfree = true;};
    overlays = overlays;
  };

  home = {
    username = "${host.user}";
    homeDirectory = "/home/${host.user}";

    stateVersion = "23.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
