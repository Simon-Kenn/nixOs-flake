{pkgs, ...}: {
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
