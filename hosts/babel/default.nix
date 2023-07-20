# ######################## # 
#  Star-end                       
# ######################## #

{ pkgs, desktop, host, unstable, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core-desktop.nix
    ../../modules/nix-os.nix
    ../../modules/users.nix
    ../../modules/desktop/${desktop}.nix
  ];  

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    initrd.kernelModules = [ "amdgpu" ];

    kernelParams = with host; [
      "video=${mainMonitor}:1920x1080@60"
      "video=${secondMonitor}:1920x1080@60"
    ];

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
    hostName = "Babel";
    networkmanager.enable = true;
  };

  hardware = {
    pulseaudio.enable = true;
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        rocm-opencl-icd
        rocm-opencl-runtime
        amdvlk
      ];
      driSupport = true;
      #package = unstable.mesa.drivers;
      driSupport32Bit = true;
      #package32 = unstable.pkgsi686Linux.mesa.drivers;
    };
  };
}
