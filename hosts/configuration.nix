{ config, lib, pkgs, inputs, user, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "kvm" "networkmanager"]; 
    initialPassword = "password";
    # shell = pkgs.zsh;
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

  systemPackages = with pkgs; [
    vim
    git
    killall
    nano
    pciutils
    usbutils
    wget
  ];
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
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes"
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    }; 
    stateVersion = "23.05"; # Did you read the comment?
  };
}
