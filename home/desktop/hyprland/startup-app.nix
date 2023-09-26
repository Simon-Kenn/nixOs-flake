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
			"[workspace 1 silent] kitty ~/Journal --hold sh -c nvim"
			"[workspace 2 silent] kitty ~/Notes --hold sh -c nvim"
			"[workspace 3 silent] kitty ~/Org"
			"[workspace 4 silent] kitty ~/Code"

			"[workspace 6 silent] kitty --hold sh -c btm"
			"[workspace 7 silent] firefox"
			"[workspace 8 silent] discord"
    ];
  };
}
