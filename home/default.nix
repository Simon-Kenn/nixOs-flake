{
  pkgs,
  host,
  inputs,
  ...
}: {
  imports = [
    ./cli
    ./vim
    ./desktop/${host.desktop}/default.nix
    inputs.nix-colors.homeManagerModule
  ];

  colorscheme = inputs.nix-colors.colorSchemes.catppuccin-frappe;

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
