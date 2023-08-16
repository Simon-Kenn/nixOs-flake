{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules
  ];

  programs.nixvim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };
}
