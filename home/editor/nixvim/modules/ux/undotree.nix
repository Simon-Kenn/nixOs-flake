{
	programs.nixvim.plugins.undotree = {
		enable = true;
	};
	programs.nixvim.maps.normalVisualOp = {
		"<leader>u" = "<cmd>UndotreeToggle<CR>";
	};
}
