{
	programs.nixvim.plugins.harpoon = {
		enable = true;

		keymaps = {
			addFile = "<leader>a";
			toggleQuickMenu = "<leader>b";
			navFile = {
				"1" = "<leader>\"";
				"2" = "<leader>\«";
				"3" = "<leader>\»";
				"4" = "<leader>\(";
			};
		};
	};
}
