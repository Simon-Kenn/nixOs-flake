{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      neorg
      neorg-telescope
      nvim-treesitter.withAllGrammars
    ];

    extraConfig = builtins.readFile ./vimrc;

    extraLuaConfig = ''
      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true
        }
      }


      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Notes"
              }
            }
          }
        }
      }
    '';
  };
}
