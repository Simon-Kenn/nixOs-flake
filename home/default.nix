{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./cli
    ./vim
    ./desktop/${host.desktop}/default.nix
  ];


  home = {
    username = "${host.user}";
    homeDirectory = "/home/${host.user}";

    stateVersion = "23.05";

    packages = with pkgs; [
      # Apps
      firefox
      google-chrome
      logseq
    ];
  };

  programs = {
    home-manager.enable = true;
  };
}
