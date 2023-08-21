{
	programs.nixvim.maps = {
		normalVisualOp = {
			"<Leader>gj" = "<cmd>Neorg journal today<CR>";
			"<Leader>gjj" = "<cmd>Neorg journal toc<CR>";
			"<Leader>gjy" = "<cmd>Neorg journal yesterday<CR>";
			"<Leader>gjt" = "<cmd>Neorg journal tomorrow<CR>";

			"<Leader>gn" = "<cmd>Neorg index<CR>";
			"<Leader>nt" = "<Cmd>Neorg toc<CR>";
		};
	};
}
