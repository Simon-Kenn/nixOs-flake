{
  description = "My NixOs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
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
      desktop = "hyprland";
      system = "x86_64-linux";
      monitors = {
        main = "DP-1";
        second = "HDMI-A-1";
      };
    };

    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      babel = lib.nixosSystem {
        specialArgs = {inherit inputs outputs host;};
        modules = [
          ./hosts/babel

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs outputs host;};
            home-manager.users.${host.user} = import ./home/default.nix;
          }
        ];
      };
    };
  };
}
