{
	programs.nixvim.plugins.neorg.modules."core.keybinds".config = {
		default_keybinds = false;
		hook = { __raw = let 
			todo = "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_";
			dirman = "<cmd>Neorg keybind norg core.dirman";
			hop = "<cmd>Neorg keybind norg core.esupports.hop";
			in ''
				function(keybinds)
						-- qol.todo_items
						keybinds.map("norg",	"n", "<LocalLeader>tu", "${todo}undone<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>tp", "${todo}pending<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>td", "${todo}done<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>th", "${todo}on_hold<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>tc", "${todo}cancelled<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>tr", "${todo}recurring<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>ti", "${todo}important<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>ta", "${todo}ambiguous<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>ts", "${todo}cycle<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>tsr", "${todo}cycle_reverse<CR>")

						-- dirman
						keybinds.map("norg",	"n", "<LocalLeader>nn", "${dirman}.new.note<CR>")

						-- hop
						keybinds.map("norg",	"n", "<CR>", "${hop}.hop-link<CR>")
						keybinds.map("norg",	"n", "<M-CR>", "${hop}.hop-link vsplit<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>gd", "${hop}.hop-link<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>gh", "${hop}.hop-link split<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>gg", "${hop}.hop-link vsplit<CR>")
				end
			'';};
	};
}
