{
  pkgs,
  host,
  inputs,
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
