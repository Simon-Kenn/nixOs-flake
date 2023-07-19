{
  description = "My NixOs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; 

    home-manager = {
	    url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
        url = "github:vaxerski/Hyprland";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };
  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager, hyprland }:
    let
      user = "simon";
      desktop = "gnome";
      location = "$HOME/Projets/nixosOs";

      system = "x86_64-linux";
      
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      
      unstable = nixpkgs.unstable {
      inherit system;
      config.allowUnfree = true;
      };

      lib = nixpkgs.lib;

      babel_modules = [
        ./hosts/babel

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
          inherit unstable user hyprland desktop location;
          host = {
            hostname = "Babel";
            mainMonitor = "DP-1";
            secondMonitor = "HDMI-A-1";
          };
        };
          home-manager.users.${user} = import ./home/default.nix;
        }
      ];
      specialArgs = {
            inherit inputs unstable system user desktop location hyprland;
	    host = {
              hostName = "Babel";
              mainMonitor = "DP-1";
              secondMonitor = "HDMI-A-1";
            };
          };
    in {
      nixosConfigurations = {
        babel = lib.nixosSystem {
          inherit system specialArgs;
          modules = babel_modules;
        }; 
      };
    };
}
