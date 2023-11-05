{
  programs.nixvim.plugins.nvim-cmp = {
    enable = true;

    sources = [
			{name = "nvim_lsp";}
			{name = "luasnip";}
      {name = "path";}
      {name = "buffer";}
			{name = "nvim-lua";}
			{name = "cmp-ledger";}
			{name = "neorg";}
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
