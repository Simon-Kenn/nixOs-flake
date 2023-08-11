{ pkgs, ... }:
{
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";

  console = {
     font = "Lat2-Terminus16";
     keyMap = "fr-bepo";
  };

  fonts.packages = with pkgs; [
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

  programs = {
    zsh.enable = true;
  };

  sound.enable = true;
}
