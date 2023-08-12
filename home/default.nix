{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./cli
    ./vim
    ./kitty.nix
    ./desktop/${host.desktop}.nix
    ./mako.nix
    ./wofi.nix
    ./waybar.nix
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
