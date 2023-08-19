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

		servers.nixd = {
			enable = true;
			settings = {
				eval = {
					target = {
						args = [];
						installable = "";
					};
					depth = 0;
					workers = 3;
				};
				formatting = {
					command = "nixkpgs-fmt";
				};
				options = {
					enable = true;
					target = {
						args = ["yes" "no" "maybe"];
						installable = "";
					};
				};
			};
		};
	};
}
