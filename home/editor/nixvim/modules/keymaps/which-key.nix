{
  programs.nixvim.plugins.which-key = {
    enable = true;
  };

	programs.nixvim.extraConfigLua = ''
		local wk = require("which-key")
		wk.register({
			f = {
				name = "Telescope",
			},
			t = {
				name = "Toggle",
				u = "undone"
			},
			n = {
				name = "Nouvelle",
			},
			g = {
				name = "Hop",
			},
			i = {
				name = "Insérer"
			},
			m = {
				name = "Mode"
			},

		}, { prefix = "<localleader>"})

		wk.register({
			f = {
				name = "Telesope",
				f = "Chercher un fichier",
				b = "Chercher un tampon",
				g = "Grep",
				h = "À l'aide !",
				s = "Treesitter",
				v = {
					name = "Git",
					c = {
						name = "commits",
						c = "commits",
						b = "bcommits",
					},
					b = "branches",
					s = "status",
					x = "stash",
				},
				l = {
					name = "lsp",
					r = "Réferences",
					i = "Implémentatinos",
					D = "Définitions",
					t = "Type Définitions",
					d = "Diagnostic",
				},
			},
			c = {
				name = "Cerveau II",
				f = "Chercher une note",
				l = "Chercher un bloc",
				m = "Carte de Cerveau II",
				w = "Workspace",
				g = {
					name = "Gtd",
				},
				j = {
					name = "Journal",
					a = "Aujourd'hui",
					d = "Demain",
					h = "Hier",
					c = "Chercher une date",
					m = "Carte du journal",
				},
			},
			g = {
				name = "Neogit"
			},
				a = "Harponner un fichier",
				b = "Hameçons",
			}, { prefix = "<leader>" })
	'';
}
