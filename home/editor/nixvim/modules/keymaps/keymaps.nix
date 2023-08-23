{
	programs.nixvim.maps = {
		normalVisualOp = {
			"<Leader>cja" = "<cmd>Neorg journal today<CR>";
			"<Leader>cjm" = "<cmd>Neorg journal toc<CR>";
			"<Leader>cjh" = "<cmd>Neorg journal yesterday<CR>";
			"<Leader>cjt" = "<cmd>Neorg journal tomorrow<CR>";

			"<Leader>cn" = "<cmd>Neorg workspace<CR>";
			"<Leader>cm" = "<cmd>Neorg index<CR>";
			"<Leader>cf" = "<cmd>Neorg keybind all core.integrations.telescope.find_norg_files<CR>";
			"<Leader>cl" = "<cmd>Neorg keybind all core.integrations.telescope.find_linkable<CR>";
		};
	};

	programs.nixvim.plugins.harpoon.keymaps = {
		addFile = "<leader>a";
		toggleQuickMenu = "<leader>b";
		navFile = {
			"1" = "<leader>\"";
			"2" = "<leader>\«";
			"3" = "<leader>\»";
			"4" = "<leader>\(";
		};
	};

	programs.nixvim.plugins.telescope.keymaps = {
		"<leader>ff" = "find_files";
    "<leader>fg" = "live_grep";
    "<leader>fb" = "buffers";
    "<leader>fh" = "help_tags";

    "<leader>fs" = "treesitter";
		"<leader>fd" = "diagnosics";

		"<leader>fvcw" = "git_commits";
	};

	programs.nixvim.plugins.lsp.keymaps = {
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
}
