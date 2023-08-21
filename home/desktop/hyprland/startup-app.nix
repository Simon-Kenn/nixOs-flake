{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec = [
      "${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
    ];
    exec-once = [
      "waybar & mako"
    ];
  };
}
