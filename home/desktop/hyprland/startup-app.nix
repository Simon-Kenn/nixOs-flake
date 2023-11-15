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
      "waybar 2>&1 > ~/log.txt & mako"

			"[workspace 7 silent] firefox"
			"[workspace 8 silent] discord"
    ];
  };
}
