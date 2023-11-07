{
  programs.nixvim.plugins.nvim-cmp = {
    enable = true;

		snippet.expand = "luasnip";
    sources = [
			{name = "nvim_lsp";}
			{name = "nvim-lua";}
			{name = "luasnip";}
      {name = "path";}
			{name = "neorg";}
      {name = "buffer"; keywordLength = 5;}
    ];
    mapping = {
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      "C-Space" = {
				modes = ["i" "c"]; 
				action = "cmp.mapping.complete({select = true})";
			};
      "<Tab>" = {
				modes = ["i" "s"];
        action = ''
          function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end
        '';
      };
			"<S-Tab>" = {
        action = ''
          function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end
        '';
      };
    };
  };
}
