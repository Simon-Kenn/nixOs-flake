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
			"[workspace 1 silent] alacritty ~/Journal --hold sh -c nvim"
			"[workspace 2 silent] alacritty ~/Notes --hold sh -c nvim"
			"[workspace 3 silent] alacritty ~/Org"
			"[workspace 4 silent] alacritty ~/Code"

			"[workspace 6 silent] alacritty --hold sh -c btm"
			"[workspace 7 silent] firefox"
			"[workspace 8 silent] discord"
    ];
  };
}
