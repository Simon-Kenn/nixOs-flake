{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec = [
      "${pkgs.swaybg}/bin/swaybg -i ${config.wallpaper} --mode fill"
    ];
    exec-once = let
      waybar = "${config.programs.waybar.package}/bin/waybar";
      mako = "${config.services.mako.package}/bin/mako";
    in [
      "${waybar} & ${mako}"
    ];
  };
}
