{
	programs.nixvim.neo-tree = {
		enable = true;
		
		mappings = {
			"<space>" = {
				command = "toggle_node";
				nowait = false;
			};
		};
	};
}
