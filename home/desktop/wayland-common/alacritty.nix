{config, ...}: let 
	inherit (config.colorscheme) colors;
in {
	home.sessionVariables = {
		TERMINAL = "alacritty";
	};
	programs.alacritty = {
		enable = true;

		settings = {

			font = {
				normal = {
					family = config.fontProfiles.monospace.family;
				};
			};

			colors = {
				primary = {
					background = "#${colors.base00}";
					foreground = "#${colors.base05}";
					dim_foreground = "#${colors.base05}";
					bright_foreground = "#${colors.base05}";
				};

				cursor = {
					text = "#${colors.base00}";
					cursor = "#${colors.base06}";
				};

				vi_mode_cursor = {
					text = "#${colors.base00}";
					cursor = "#${colors.base07}";
				};

				search = {
					matches = {
						foreground = "#${colors.base00}";
						background = "#${colors.base01}"; # TODO: Change
					};
					focused_match = {
						foreground = "#${colors.base00}";
						background = "#${colors.base0B}";
					};
				};

				hints = {
					start = {
						foreground = "#${colors.base00}";
						background = "#${colors.base0A}";
					};
					end = {
						foreground = "#${colors.base00}";
						background = "#${colors.base06}";
					};
				};

				footer_bar= {
					foreground = "#${colors.base00}";
					background = "#${colors.base01}";
				};
				normal = {
					black = "#${colors.base03}";
					red = "#${colors.base08}";
					green = "#${colors.base0B}";
					yellow = "#${colors.base0A}";
					blue = "#${colors.base0D}";
					magenta = "#${colors.base06}";
					cyan = "#${colors.base0C}";
					white = "#${colors.base05}";
				};

				bright = {
					black = "#${colors.base04}";
					red = "#${colors.base08}";
					green = "#${colors.base0B}";
					yellow = "#${colors.base0A}";
					blue = "#${colors.base0D}";
					magenta = "#${colors.base06}";
					cyan = "#${colors.base0C}";
					white = "#${colors.base05}";
				};

				dim = {
					black = "#${colors.base03}";
					red = "#${colors.base08}";
					green = "#${colors.base0B}";
					yellow = "#${colors.base0A}";
					blue = "#${colors.base0D}";
					magenta = "#${colors.base06}";
					cyan = "#${colors.base0C}";
					white = "#${colors.base05}";
				};

			};
		};
	};
}
