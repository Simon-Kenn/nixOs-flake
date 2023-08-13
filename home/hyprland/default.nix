{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
    ./workspaces.nix
    ./basic-bindings.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec = [
        "${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
      ];
      bind = let
        wofi = "${config.programs.wofi.package}/bin/wofi";
        terminal = config.home.sessionVariables.TERMINAL;
      in [
        "SUPER,Return,exec,${terminal}"
        "SUPER,space,exec,${wofi} -S drun"
        "SUPER,h,exec,${wofi} -S run"
      ];
    };
    extraConfig = ''
      exec-once = waybar & logseq & kitty & firefox & mako
      exec=swaybg -m fill -i ~/.local/share/wallpapers/abstract_ghost.jpg
    '';
  };
}
