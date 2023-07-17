{ pkgs, lib, user, ... }:
{
  imports = 
    [(import ./hardware-configuration.nix)]++
    [(import ../../modules/desktop/gnome/default.nix)];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];

    loader = {
      efi = {
        # canTouchEfiVariables = true;
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
  sound.enable = true;

  environment = {
    systemPackages = with pkgs; [
      discord
      firefox
      vim
    ];
  };

  nixpkgs.overlays = [
    (self: super: {
    logseq = super.logseq.overrideAttrs (old: rec {
      version = "0.9.10";
      pname="logseq";
      src = super.fetchurl {
        url = "https://github.com/logseq/logseq/releases/download/${version}/${pname}-linux-x64-${version}.AppImage";
        sha256 = "en8ws0qdMY5j1o8oTkKcIHHQV+kCuQZzQbdFU97qAQE=";
        name = "${pname}-${version}.AppImage";
      };
        appimageContents = super.appimageTools.extract {
          name = "${pname}-${version}";
          inherit src;
        };
      });
    })
    (self: super: {
      discord = super.discord.overrideAttrs (
        _: { src = builtins.fetchTarball {
          url =
            "https://discord.com/api/download?platform=linux&format=tar.gz";
            sha256 = "0mr1az32rcfdnqh61jq7jil6ki1dpg7bdld88y2jjfl2bk14vq4s";
          };  }
       );
     })
   ];

}
