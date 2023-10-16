{
	programs.zellij = {
		enable = true;
		enableFishIntegration = true;
		settings = {
			theme = "catppuccin-mocha";
			layout = {
				default_tab_template = {
					children = true;
				};
			};
			tab = {
				name = "editor";
				focus = true;
				pane = {
					borderless = true;
				};
			};
		};
	};
}
