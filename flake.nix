{
  description = "My NixOs configuration";

	nixConfig = {
		experimental-features = [ "nix-command" "flakes" ];
		
		substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org/"
    ];

    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
	};

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";

    nixvim.url = "github:nix-community/nixvim";
    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		hyprwm-contrib = {
			url = "github:hyprwm/contrib";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    inherit (self) outputs;
    host = {
      name = "babel";
      user = "simon";
			path = "/home/simon";
      desktop = "hyprland";
      system = "x86_64-linux";
      shell = "fish";
      monitors = {
        left = "DP-1";
        center = "HDMI-A-1";
      };
    };

    overlays = [
      inputs.neorg-overlay.overlays.default
      inputs.neovim-nightly-overlay.overlay
    ];

    lib = nixpkgs.lib;
  in {
    overlays = overlays;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      babel = lib.nixosSystem {
        specialArgs = {inherit inputs outputs host;};
        modules = [
          ./hosts/babel

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs host;};
            home-manager.users.${host.user} = import ./home/default.nix;
          }
        ];
      };
    };
  };
}
