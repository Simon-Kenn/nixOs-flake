{
  wayland.windowManager.hyprland = {
    enable = true;
  };

  imports = [
    ./settings.nix
    ./workspaces.nix
    ./basic-bindings.nix
    ./app-bindings.nix
    ./init-tty.nix
    ./startup-app.nix
  ];
}
