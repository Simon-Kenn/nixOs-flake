{	
	programs.nixvim.plugins.lsp = {
		enable = true;

		servers = {
			nil_ls = {
				enable = true;
				settings = {
					formatting.command = ["alejandra"];
				};
			};
			lua-ls.enable = true;
			ccls.enable = true;

			html.enable = true;
			cssls.enable = true;
			tsserver.enable = true;
			eslint.enable = true;
			jsonls.enable = true;

			texlab.enable = true;
			vuels.enable = true;
		};
	};

	programs.nixvim.plugins.lspkind = {
		enable = true;
	};

	programs.nixvim.plugins.lsp-lines = {
		enable = true;
	};

	programs.nixvim.plugins.lsp-format = {
		enable = true;
	};

	programs.nixvim.plugins.nvim-lightbulb = {
		enable = true;
	};
}
