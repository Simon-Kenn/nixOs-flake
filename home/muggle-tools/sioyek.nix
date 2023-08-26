{config, ...}: let 
	inherit (config.colorscheme) colors;
in {
	programs.sioyek = {
		enable = true;

		config = {};

		bindings = {
		};
	};
}
