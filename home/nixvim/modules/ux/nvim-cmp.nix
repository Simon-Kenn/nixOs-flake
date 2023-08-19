{
  programs.nixvim.plugins.nvim-cmp = {
    enable = true;

    sources = [
      {name = "buffer";}
      {name = "path";}
			{name = "nvim-lsp";}
    ];
    mapping = {
      "<CR>" = "cmp.mapping.confirm({ select = true })";
      "C-Space" = {
				modes = ["i" "c"]; 
				action = "cmp.mapping.complete({select = true})";
			};
      "<Tab>" = {
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
