{
  description = "My NixOs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim.url = "github:nix-community/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager";
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
      desktop = "hyprland";
      system = "x86_64-linux";
      shell = "fish";
      monitors = {
        left = "DP-1";
        center = "HDMI-A-1";
      };
    };

    lib = nixpkgs.lib;
  in {
    homeManagerModules = import ./modules/home-manager;

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
