{
  pkgs,
  desktop,
  user,
  ...
}: {
  imports = [
    ./vim
    ./zsh.nix
    ./kitty.nix
    ./starship.nix
    ./git.nix
    ./desktop/${desktop}.nix
    ./wofi.nix
    ./mako.nix
    ./waybar.nix
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

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
