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

	#sops.secrets.password.neededForUsers = true;
	#users.users.testUser = {
	#	isNormalUser = true;
	#	shell = pkgs.fish;
	#	hashedPasswordFile = config.sops.secrets.password.path;
	#};

  security.pam.services = {swaylock = {};};
}
