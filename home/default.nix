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

    packages = with pkgs; [
      # Apps
      google-chrome
      logseq
      obsidian
    ];
  };

  programs = {
    home-manager.enable = true;
  };
}
