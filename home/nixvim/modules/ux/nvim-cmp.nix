{
  programs.nixvim.plugins.nvim-cmp = {
    enable = true;
		
		sources = [
			{ name = "buffer"; }
			{ name = "path"; }
		];

		mapping = {
			"<CR>" = "cmp.mapping.confirm({ select = true })";
			"<Tab>" = {
				modes = ["i" "s" ];
				action = ''
					function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expandable() then
							luasnip.expand()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jumb()
						elseif check_backspace() then
							fallback()
						else
							fallback()
						end
					end
				'';
			};
		};
  };
}
