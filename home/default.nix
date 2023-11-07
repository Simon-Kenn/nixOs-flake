{
  pkgs,
  host,
  outputs,
  ...
}: {
  imports = [
		./desktop
    ./cli
		./editor 
    ./muggle-tools
		./productivity
  ];
  nixpkgs = {
    config = {allowUnfree = true;};
    overlays = outputs.overlays;
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
