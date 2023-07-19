{ inputs, pkgs, ...}:
let
  exec = "exec Hyprland";
in
{
  programs = {
    hyprland = {
      enable = true;
    };
  };

  environment = {
    loginShellInit = ''
      if [-z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        ${exec}
      fi
    '';

    variables = {
      XDG_CURRENT_DESKTOP="Hyprland";
      XDG_SESSION_TYPE="wayland";
      XDG_SESSION_DESKTOP="Hyprland";
    };
  };
}
