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
			"[workspace 1 silent] kitty --hold sh -c btm"
			"[workspace 2 silent] firefox"
			"[workspace 4 silent] discord"

			"[workspace 7 silent] kitty"
			"[workspace 8 silent] kitty ~/Code"
			"[workspace 9 silent] kitty ~/CerveauII --hold sh -c nvim"
    ];
  };
}
