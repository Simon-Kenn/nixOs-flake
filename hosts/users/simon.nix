{
  pkgs,
  host,
  ...
}: {
  users.users.${host.user} = {
    isNormalUser = true;
    extraGroups = ["wheel" "video" "audio" "kvm" "networkmanager"];
    shell = pkgs.fish;
  };

  security.pam.services = {swaylock = {};};
}
