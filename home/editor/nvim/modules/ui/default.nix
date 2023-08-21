{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    catppuccin-nvim
  ];
  programs.neovim.extraConfig = ''
    colorscheme catppuccin-frappe
  '';
}
