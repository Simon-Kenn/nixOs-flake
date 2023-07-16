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
      location = "$HOME/Projets/nixosOs";

      x64_system = "x86_64-linux";
      x64_specialArgs = {
        pkgs-unstable = import inputs.nixpkgs-unstable {
          system = x64_system;
          config.allowUnfree = true;
        };
      };
      star-end_modules = [
        ./hosts/star-end

        #home-manager.nixosModules.home-manager
        #{
        #  home-manager.useGlobalPkgs = true;
        #  home-manager.useUserPackages = true;

        #  home-manager.extraSpecialArgs = x64_specialArgs;
        #  # home-manager.user.${user} = import ./
        #}
      ];

    in {
      nixosConfiguration = let system = x64_system; specialArgs = x64_specialArgs; in {
        star-end = nixpkgs.lib.nixosSystem {
          inherit system specialArgs user location;
          modules = star-end_modules;
        };
      };
      #  nixosConfigurations = (
      #  import ./hosts {
      #    inherit (nixpkgs) lib;
      #    inherit inputs nixpkgs nixpkgs-unstable home-manager hyprland user location;
      #   }
      #);
    };
}
