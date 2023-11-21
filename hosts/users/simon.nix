{
  pkgs,
  host,
	config,
  ...
}: {
  users.users.${host.user} = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "audio" "kvm" "networkmanager"];
    shell = pkgs.fish;
  };

	users.users.testUser = {
		isNormalUser = true;
		shell = pkgs.fish;
		hashedPasswordFile = config.sops.secrets.test-user-password.path;
	};

	sops.secrets.test-user-password = {
		sopsFile = ../../secrets/secrets.yaml;
		neededForUsers = true;
	};


  security.pam.services = {swaylock = {};};
}
