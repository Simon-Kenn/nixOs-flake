{
	description = "Foo Bar NodeJs Project";

	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-22.11";
	};

	outputs = { self, nixpkgs }:
		let
			forAllSystems = nixpkgs.lib.genAttrs [ "x86_64linux" "aarch64-linux" ];
			pkgsFor = nixpkgs.legacyPackages;
		in 
		rec {
			packages = forAllSystems (system: {
				default = pkgsFor.${system}.callPackage ./default.nix { };
			});

			devShells = forAllSystems (system: {
				default = pkgsFor.${system}.callPackage ./shell.nix { };
			});
		};
}
