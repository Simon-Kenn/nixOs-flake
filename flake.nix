{
  description = "My NixOs configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; 

    home-manager = {
	    url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, home-manager }:
    let
      user = "simon";
      location = "$HOME/Projets/nixosOs";
    in {
        nixosConfigurations = (
        import ./hosts {
          inherit (nixpkgs) lib;
          inherit inputs nixpkgs nixpkgs-unstable home-manager user location;
         }
      );
    };
}
