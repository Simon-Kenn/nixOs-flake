{
  pkgs,
  lib,
  ...
}: {
  imports = [];

  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      neorg
      neorg-telescope
      (nvim-treesitter.withPlugins (p:
        with p; [
          tree-sitter-lua
        ]))
    ];

    extraConfig = builtins.readFile ./vimrc;

    extraLuaConfig = ''
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
        }
      }


      require("neorg").setup {
        load = {
          ["core.defaults"] = {}
        }
      }
    '';
  };
}
