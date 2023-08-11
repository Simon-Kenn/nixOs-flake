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
    ../../modules/desktop/${host.desktop}.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = ["amdgpu"];
    kernelParams = with host.monitors; [
      "video=${main}:1920x1080@60"
      "video=${second}:1920x1080@60"
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
