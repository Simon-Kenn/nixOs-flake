{ pkgs, user, ...}:
{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "kvm" "networkmanager"]; 
    initialPassword = "password";
    shell = pkgs.zsh;
  };
}
