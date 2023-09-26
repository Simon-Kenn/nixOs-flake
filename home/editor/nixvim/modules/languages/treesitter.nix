{ 
	programs.nixvim.plugins.treesitter = { 
		enable = true;
    nixGrammars = true;
    ensureInstalled = "all";
  };

	programs.nixvim.plugins.rainbow-delimiters = {
		enable = true;
	};

	programs.nixvim.plugins.ts-autotag = {
		enable = true;
	};

	programs.nixvim.plugins.ts-context-commentstring = {
		enable = true;
	};
}
