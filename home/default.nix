{
  host,
  outputs,
  ...
}: {
  imports = [
		./desktop
    ./cli
    ./muggle-tools
		./productivity
		./nixvim
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
