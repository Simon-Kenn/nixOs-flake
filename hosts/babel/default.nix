{
  pkgs,
  host,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common
    ../common/shells/${host.shell}.nix
    ../users/simon.nix
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

  programs = {
    dconf.enable = true;
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
