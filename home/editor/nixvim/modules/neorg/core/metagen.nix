{
	programs.nixvim.plugins.neorg.modules."core.esupports.metagen".config = {
		type = "auto";
			delimiter = ": ";
			template = [
				["titre" { __raw = ''
						function()
							return vim.fn.expand("%:p:t:r")
						end	
					'';}
				]
				["description" ""]
				["catégories" ""]
				["création" { __raw = ''
						function()
							return  os.date("%Y-%m-%d")
						end	
					'';}
				]
				["édité" { __raw = ''
						function()
							return  os.date("%Y-%m-%d")
						end	
					'';}
				]
			];
	};
}
