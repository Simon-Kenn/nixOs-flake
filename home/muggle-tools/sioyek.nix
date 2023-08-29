{config, ...}: let 
	inherit (config.colorscheme) colors;
in {
	programs.sioyek = {
		enable = true;

		config = {
			"startup_commands" = "toggle_custom_color";
			"ui_font" = "${config.fontProfiles.regular.family}";
			"font_size" = "12";

			"background_color" = "#${colors.base00}";
			"custom_background_color" = "#${colors.base00}";
			"status_bar_color" = "#${colors.base00}";
			"page_separator_color" = "#${colors.base00}";

			"custom_text_color" = "#${colors.base06}";
			"status_bar_text_color" = "#${colors.base06}";
			"ui_text_color" = "#${colors.base06}";

			"ui_background_color" = "#${colors.base01}";
			"ui_selected_background_color" = "#${colors.base01}";
			"ui_selected_text_color" = "#${colors.base06}";

			"text_highlight_color" = "#${colors.base03}";
			"search_highlight_color" = "#${colors.base0A}";
			"link_highlight_color" = "#${colors.base0D}";
			"synctex_highlight_color" = "#${colors.base08}";

			"highlight_color_a" = "#${colors.base07}"; 
			"highlight_color_b" = "#${colors.base08}";
			"highlight_color_c" = "#${colors.base09}";
			"highlight_color_d" = "#${colors.base0B}";
			"highlight_color_e" = "#${colors.base0E}";
		};

		bindings = {
			"move_up" = "r";
			"move_down" = "s";
			"move_right" = "t";
			"move_left" = "n";

			"screen_up" = "R";
			"screen_down" = "S";

			"goto_toc" = "";
		};
	};
}
