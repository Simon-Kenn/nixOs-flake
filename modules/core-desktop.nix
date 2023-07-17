{ pkgs, ... }:
{
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";

  console = {
     font = "Lat2-Terminus16";
     keyMap = "fr-bepo";
  };

  fonts.fonts = with pkgs; [
    nerdfonts
  ];  

  environment = {
    variables = {
      # TERIMAL = "";
      EDITOR = "vim";
      VISUAL = "vim";
    };
    systemPackages = with pkgs; [
    vim
    git
    pciutils
    wget
    curl
    ];
  };

  sound.enable = true;
}
