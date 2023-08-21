{
  programs.nixvim.plugins.which-key = {
    enable = true;
  };

	programs.nixvim.extraConfigLua = ''
		local wk = require("which-key")

		wk.register({
			f = {
				name = "Telesope",
				f = "Files finder",
				b = "Buffers finder",
				g = "Live grep",
				h = "Help tags",
				s = "Treesitter"
			},
		}, { prefix = "<leader>" })
	'';
}
