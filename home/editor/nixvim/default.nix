{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
		./options.nix
		./vbepo.nix
		./keymaps.nix
		./ui.nix
		./ux.nix
		./langage.nix
		./completion.nix
  ];

	home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };

	xdg.desktopEntries = {
		nvim = {
			name = "Neovim";
			genericName = "Text Editor";
			comment = "Edit text files";
			exec = "nvim %F";
			icon = "nvim";
			terminal = true;
			type = "Application";
			categories = [ "Utility" "TextEditor"];
		};
	};
}
