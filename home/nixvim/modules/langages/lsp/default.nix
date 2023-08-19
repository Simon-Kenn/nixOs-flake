{
	programs.nixvim.plugins.lsp = {
		enable = true;

		keymaps = {
			diagnostic = {
				"<leader>r" = "goto_prev";
				"<leader>s" = "goto_next";
				"<leader>vd" = "open_float";
			};
			lspBuf = {
				"gd" = "definition";
				"gD" = "references";
				"gt" = "type_definition";
				"gi" = "implementation";
				"K" = "hover";
			};
		};

		servers = {
			nixd = {
				enable = true;
				settings = {
					eval = {
						target = {
							args = ["--expr" "with import <nixpkgs> { };"];	
							installable = "";
						};
					};
					options = {
						enable = true;
						target = {
							args = [];
							installable = "<flakeref>#nixosConfigurations.<name>.options";
						};
					};
				};
			};
			html.enable = true;
		};
	};
}
