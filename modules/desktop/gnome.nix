{
  programs = {
    zsh.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      displayManager = {
        gdm.enable = true;
      };
      desktopManager = {
        gnome.enable = true;
      };
      layout = "fr";
      xkbVariant = "bepo";
    };

    flatpak.enable = true;
  };
}
