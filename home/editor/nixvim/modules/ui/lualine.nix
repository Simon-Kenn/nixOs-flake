{
	programs.nixvim.plugins.lualine = {
		enable = true;
		
		iconsEnabled = true;

		sections = {
			lualine_a = ["mode"];
			lualine_b = ["branch"];
			lualine_c = ["filename" { extraConfig = { path = 1;};} ];
			
			lualine_x = ["encoding"];
			lualine_y = ["progress"];
			lualine_z = ["location"];
		};
	};
}
