{pkgs, ...}: {
  

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
