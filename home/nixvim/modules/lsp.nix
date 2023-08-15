{
  programs.nixvim.plugins.lsp = {
    enable = true;

    keymaps = {
      diagnostic = {
        "<leader>r" = "goto_prev";
        "<leader>s" = "goto_next";
      };
    };
  };
}
