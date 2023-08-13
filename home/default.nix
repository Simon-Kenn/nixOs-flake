{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./cli
    ./ui
    ./wizard-tools
    ./hyprland
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
