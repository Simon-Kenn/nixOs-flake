{
  config,
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
in {
  gtk = {
    enable = true;
    font = {
      name = config.fontProfiles.regular.family;
      size = 11;
    };
    theme = {
      name = "${config.colorscheme.slug}";
      packages = gtkThemeFromScheme {scheme = config.colorscheme;};
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    cursor = {
      packages = pkgs.catppuccin-cursors.frappeDark;
      name = "catppuccin-cursors.frappeDark";
    };
  };
}
