{inputs, ...}: {
	imports = [ inputs.sops-nix.nixosModules.sops ];
	services.openssh.enable = true;
	sops = {
		defaultSopsFile = ../../secrets/secrets.yaml;
		defaultSopsFormat = "yaml";
	};
}
