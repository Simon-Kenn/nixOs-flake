{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules
  ];

	home.sessionVariables.EIDITOR = "nvim";

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };
}
