# ######################## # 
#  Star-end                       
# ######################## #
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core-desktop.nix
    ../../modules/nix-os.nix
    ../../modules/users.nix
    ../../modules/gnome.nix
  ];  

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];

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
      ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };

}
