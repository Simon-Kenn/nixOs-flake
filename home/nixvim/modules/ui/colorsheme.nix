 { pkgs, ...}:{
	programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    flavour = "frappe";
		integrations = {
			cmp = true;
			treesitter = true;
			telescope = true;
			which_key = true;
		};
	};
 }
