{
	programs.nixvim.plugins.luasnip = {
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
}
