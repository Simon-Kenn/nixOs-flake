{config, ...}: let
  inherit (config.colorscheme) colors;
in {
  services.mako = {
    enable = true;

    anchor = "top-right";
    font = "${config.fontProfiles.regular.family} 11";
    backgroundColor = "#${colors.base00}dd";
    borderColor = "#${colors.base0D}";
    textColor = "#${colors.base05}dd";
    width = 400;
    height = 100;
    margin = "20";
    padding = "7, 12, 10";
    borderSize = 1;
    borderRadius = 3;
    progressColor = "over #5588AAFF";
    icons = true;
    maxIconSize = 32;
    markup = true;
    actions = true;
    format = "<b>%s</b>\n%b";
    defaultTimeout = 5000;
    ignoreTimeout = false;
  };
}
