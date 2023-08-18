{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    nixGrammars = true;
    ensureInstalled = "all";
  };
}
