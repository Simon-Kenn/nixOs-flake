{ programs.nixvim.plugins.neorg.modules."core.keybinds".config = {
		default_keybinds = false;
		hook = { __raw = let 
			todo = "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_";
			dirman = "<cmd>Neorg keybind norg core.dirman";
      hop = "<cmd>Neorg keybind norg core.esupports.hop";
			promo = "<cmd>Neorg keybind norg core.promo";
			pivot = "<cmd>Neorg keybind norg core.pivot";
			tempus = "<cmd>Neorg keybind norg core.tempus";
			itero = "<cmd>Neorg keybind norg core.itero";
			presenter = "<cmd>Neorg keybind norg core.presenter";
			traverse-heading = "<cmd>Neorg keybind norg core.integration.treesitter";
			mode = "<cmd>Neorg mode";
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

						-- promo
						keybinds.map("norg",	"n", "<LocalLeader>»", "${promo}.promote<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>«", "${promo}.demote<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>»»", "${promo}.promote nested<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>««", "${promo}.demote nested<CR>")

						-- pivot
						keybinds.map("norg",	"n", "<LocalLeader>tlt", "${pivot}.toggle-list-type<CR>")
						keybinds.map("norg",	"n", "<LocalLeader>tli", "${pivot}.invert-list-type<CR>")

						-- corpus
						keybinds.map("norg",	"n", "<LocalLeader>id", "${tempus}.insert-date<CR>")
						keybinds.map("norg",	"i", "<M>d", "${tempus}.insert-date-ins{@ Lundi 21 Août 2023}tert-mode<CR>")

						-- itero
						keybinds.map("norg",	"i", "<M-CR>", "${itero}.next-iteration<CR>")

						-- traverse-heading
						keybinds.map("traverse-heading",	"n", "s", "${traverse-heading}.next.heading<CR>")
						keybinds.map("traverse-heading",	"n", "r", "${traverse-heading}.previous.heading<CR>")

						-- presenter
						keybinds.map("presenter",	"n", "n", "${presenter}.next_page<CR>")
						keybinds.map("presenter",	"n", "t", "${presenter}.previous_page<CR>")
						keybinds.map("presenter",	"n", "q", "${presenter}.close<CR>")

						-- mode
						keybinds.map("traverse-heading",	"all", "<LocalLeader>mn", "${mode} norg<CR>")
						keybinds.map("norg",	"all", "<LocalLeader>mh", "${mode} traverse-heading<CR>")
				end
			'';};
	};
}
