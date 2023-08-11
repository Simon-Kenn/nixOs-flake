{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerdfonts
  ];

  environment = {
    systemPackages = with pkgs; [
      vim
      git
      pciutils
      wget
      curl
    ];
  };
}
