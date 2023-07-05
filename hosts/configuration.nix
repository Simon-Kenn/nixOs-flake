# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, lib, pkgs, inputs, user, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "kvm" "networkmanager"]; 
    initialPassword = "password";
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
    ];
  };
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";

  console = {
     font = "Lat2-Terminus16";
     keyMap = "fr-bepo";
  };

  fonts.fonts = with pkgs; [
    nerdfonts
  ];  

  environment = {
    variables = {
      # TERIMAL = "";
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      displayManager = {
        gdm.enable = true;
      };
      desktopManager = {
        gnome.enable = true;
      };
      layout = "fr";
      xkbVariant = "bepo";
    };
    flatpak.enable = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2-"
    };
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };

  boot = {
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
    kernelParams = [
      "video=DP-1:1920x1080@60"
      "video=HDMI-A-1:1920x1080@60"
    ];
  };

  networking = {
    hostName = "star-end";
    networkmanager.enable = true;
  };

  
  # Enable the X11 windowing system.
  

  sound.enable = true;
  hardware = {
    pulseaudio.enable = true;
    opengl.driSupport = true;
  };  

    

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    pciutils
    discord
    logseq
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

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

