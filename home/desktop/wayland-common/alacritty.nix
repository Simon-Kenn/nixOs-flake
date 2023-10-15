{config, ...}: let 
	inherit (config.colorscheme) colors;
in {
	programs.alacritty = {
		enable = true;

		settings = {
			colors = {
				primary = {
					#background = "#${colors.base00}";
					#foreground = "#${colors.base05}";
				};
			};
		};
	};
}
