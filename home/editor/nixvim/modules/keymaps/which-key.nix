{
  programs.nixvim.plugins.which-key = {
    enable = true;
  };

	programs.nixvim.extraConfigLua = ''
		local wk = require("which-key")

		wk.register({
			f = {
				name = "Telesope",
				f = "Chercher un fichier",
				b = "Chercher un tampon",
				g = "Grep",
				h = "À l'aide !",
				s = "Treesitter",
				v = {
					git	
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
