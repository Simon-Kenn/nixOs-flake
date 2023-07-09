{ lib, inputs, nixpkgs, nixpkgs-unstable, home-manager, user, location }:

let
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

in
{
  babel = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs unstable system user location;
      host = {
        hostName = "Babel";
      };
    };
    modules = [
      ./babel
      ./configuration.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit unstable user;
          host = {
            hostname = "Babel";
          };
        };
        home-manager.users.${user} = {
          imports = [
            ./home.nix
          ];
        };
      }
    ];
  };
  star-end = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs unstable system user location;
      host = {
        hostName = "desktop";
      };
    };
    modules = [
      ./star-end
      ./configuration.nix
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit unstable user;
          host = {
            hostname = "star-end";
          };
        };
        #home-manager.users.${user} = {
        #  imports = [
        #    ./home.nix
        #  ];
        #};
      }
    ];
  };
}
