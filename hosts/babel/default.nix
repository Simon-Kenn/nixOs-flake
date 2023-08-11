{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../nix.nix
    ../locale.nix
    ../console.nix
    ../packages.nix
    ../sound.nix
    ../users.nix
    ../zsh.nix
    ../../modules/core-desktop.nix
    ../../modules/desktop/${host.desktop}.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    loader = {
      efi = {
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
      };
    };
  };

  networking = {
    hostName = "babel";
    networkmanager.enable = true;
  };

  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        rocm-opencl-icd
        rocm-opencl-runtime
        amdvlk
      ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };
}
