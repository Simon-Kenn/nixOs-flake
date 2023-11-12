{
	programs.nixvim.plugins = {
		nvim-cmp = {
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
				"<C-d>" = "cmp.mapping.scroll_docs(-4)";
				"<C-f>" = "cmp.mapping.scroll_docs(4)";
    	  "<CR>" = "cmp.mapping.confirm({ select = true })";
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
		
		luasnip = {
			enable = true;
			extraConfig = {
				history = true;
				updateevents = "TextChanged,TextChangedI";
				enable_autosnippets = true;
			};
			fromLua = [
				{}
				{
					paths = ./luasnip.lua;
				}
			];
		};
	};
}
